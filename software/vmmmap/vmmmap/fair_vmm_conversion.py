'''
Provides the functionality to map vector matrix 
multiplication (VMM) on RANC cores as 
described in Kaitlin Fair's dissertation.
'''

from rancutils import Neuron, Core, Packet
import numpy as np
import math
from bitstring import BitArray


def vmm_fair_create_cores_and_packets(
        A, 
        x, 
        num_neurons = 256, 
        num_axons = 256, 
        first_core_feedback = True,
        third_core_feedback = True):
    '''
    Creates a list of Core and Packet objects using the method presented by Kaitlin
    Fair's dissertation. Also outputs dictionaries that define the output bus
    and simulator configuration.
    
    Arguments:
        A -- numpy array defining the matrix we are going to use.
        
    Keyword Arguments:
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
        first_core_feedback -- Whether to use feedback in the last core. 
                               Need to use a symmetric reset for this to
                               execute properly on TrueNorth (default: {True})
        third_core_feedback -- Whether to use feedback in the third core (default: {True}).
    '''

    within_bitwidth = np.where(np.absolute(A.flatten()) < 2**8, True, False)
    if not np.all(within_bitwidth):
        print("[ERROR] Not all elements are within a (signed) bitwidth of 9.")
        exit(1)

    '''
    Defining the hardcoded values inherent to the mapping process this is 
    to make the code more clear rather than to parameterize the network
    (different values might mess stuff up)
    '''
    num_rep_neurons_per_element = 16
    if first_core_feedback:
        num_feedback_neurons_per_element = 16
    else:
        num_feedback_neurons_per_element = 0
    num_axons_per_input = 4
    
    '''
    Calculating all the parameters to see how many neurons, axons, and cores
    we will need.
    ''' 
    height, width = A.shape
    num_neurons_per_element = num_rep_neurons_per_element + num_feedback_neurons_per_element
    max_width_per_corelet = num_neurons // num_neurons_per_element
    num_representation_axons_per_corelet = num_axons_per_input * \
                                            height + num_feedback_neurons_per_element * \
                                            min(max_width_per_corelet, width)
    num_representation_neurons = num_neurons_per_element * width
    num_corelets = math.ceil(num_representation_neurons / num_neurons)
    num_corelets_per_splitter = math.floor(min(num_neurons, num_axons) / (num_axons_per_input * height))
    num_splitter_cores = math.ceil(num_corelets / num_corelets_per_splitter) 
    num_inputs_per_splitter = num_axons_per_input * height * num_corelets_per_splitter

    '''
    Checking if the configuration is possible given the number of neurons and axons in a core
    '''
    if num_representation_axons_per_corelet > num_axons:
        print("[ERROR] Matrix provided would require corelets with {} axons. " \
              "Current core has {} axons. Currently cannot create create VMMs " \
              "with more axons than can go into a single core. Decided to hold off " \
              "on adding this functionality as Kaitlin Fair said " \
              "it is a real pain :-/".format(num_representation_axons_per_corelet, num_axons))
        exit(1)
        

    if num_inputs_per_splitter > num_neurons or num_inputs_per_splitter > num_axons:
        print("[ERROR] Matrix provided would require {} axons and neurons in the " \
              "splitter cores but a core only has {} neurons and {} axons. " \
              .format(num_inputs_per_splitter, num_neurons, num_axons))
        exit(1)

    print("Using Fair's method to create {} splitter cores and {} corelets".format(num_splitter_cores, num_corelets))

    '''
    Creating splitter cores and representation cores and putting them all in a list. Then creating a list 
    of packets to go to each splitter core. Packets are a list of lists where packets 
    delivered on the same tick are in a list together. Just sending everything on the 
    first tick so adding everything to the first inner list.
    
    FIXME: Because I am sending everything on the first tick and using the delivery
    tick to space out the input spikes, the maximum input number possible is 16.
    '''
    cores = []
    packets = [[]]
    for splitter_num in range(num_splitter_cores):
        splitter_core = _vmm_fair_create_splitter_core(
                            height, 
                            num_corelets_per_splitter, 
                            splitter_num, num_splitter_cores, 
                            num_corelets, 
                            num_neurons = num_neurons, 
                            num_axons = num_axons)
        packets[0] = packets[0] + _vmm_fair_create_packets(x, destination_core = [splitter_num, 0])
        cores.append(splitter_core)
    
    
    for corelet_num in range(num_corelets):
        col_start = corelet_num * max_width_per_corelet
        col_end = width if corelet_num == (num_corelets - 1)  else (corelet_num + 1) * max_width_per_corelet
        first_core, second_core, third_core = _vmm_fair_create_single_corelet(
                                                A[:, col_start:col_end], 
                                                corelet_num + num_splitter_cores, 
                                                num_corelets, num_splitter_cores, 
                                                num_neurons = num_neurons, 
                                                num_axons = num_axons, 
                                                first_core_feedback = first_core_feedback,
                                                third_core_feedback = third_core_feedback)
        cores.append(first_core)
        cores.append(second_core)
        cores.append(third_core)
   
    '''
    Creating the output bus which will be on the same row as the third cores of the corelet and 
    one column to the right of them. All of third cores are programmed for the output bus to be 
    there so if it is moved things will break.
    ''' 
    output_bus = {
        'coordinates': [num_corelets + num_splitter_cores, 2],
        'num_outputs': 2 * A.shape[1]
    }
    '''
    Creating the config file for the simulator so you can configure the simulator to 
    have the correct parameters. Note that the num_cores_x and num_cores_y assume
    that the cores are placed in a specific way so if that is later changed these
    values will have to be calculated differently.
    '''
    config = {
        'num_neurons': num_neurons,
        'num_axons': num_axons,
        'num_cores_x': 1 + num_splitter_cores + num_corelets,
        'num_cores_y': 3,
        'num_weights': 4,
        'max_tick_offset': 16,
        'neuron_block_trace_verbosity': 0,
        'token_controller_trace_verbosity': 0,
        'scheduler_trace_verbosity': 0,
    }

    return cores, output_bus, packets, config


def _fair_create_first_core(
        A, 
        core_coordinates, 
        num_neurons = 256, 
        num_axons = 256):
    '''
    Creates the first core in the VMM corelet according 
    to the method presented in Kaitlin Fair's dissertation.
    For every row this core requires 8 positive representation 
    neurons, 8 negative representation neurons, 8 positive feedback
    neurons, and 8 negative feedback neurons. Note that there 
    are no feedback neurons in this core so a symmetric reset
    is required to execute properly.

   
    Arguments:
        A -- numpy array defining the matrix we are going to use.
        core_coordinates -- the (x, y) coordinates of where the core
                            will be placed in the grid
        
    Keyword Arguments:
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
    '''

    '''
    Defining the hardcoded values inherent to the mapping process this is 
    to make the code more clear rather than to parameterize the network
    (different values might mess stuff up)
    '''
    num_pos_rep_neurons_per_element = 8
    num_neg_rep_neurons_per_element = 8
    num_rep_neurons_per_element = num_pos_rep_neurons_per_element + \
                                    num_neg_rep_neurons_per_element
    

    height, width = A.shape

    # Creating the neurons for the first core
    first_core_neurons = []
    for neuron_num in range(num_neurons):
        '''
        Calculating which element the neuron is a part 
        of (neuron_group) and which neuron it is 
        for that element (neuron_id). Used to figure
        out if the neuron should be a feedback neuron
        or a representation neuron and what size it is
        '''
        neuron_group = math.floor(neuron_num / num_rep_neurons_per_element)
        neuron_id = neuron_num % num_rep_neurons_per_element
        # First half neurons are positive representation neurons
        pos_rep_neuron =  neuron_id < num_pos_rep_neurons_per_element
        # Second half neurons are negative representation neurons
        neg_rep_neuron =  neuron_id >= num_pos_rep_neurons_per_element and \
                            neuron_id < num_rep_neurons_per_element

        if pos_rep_neuron:
            weight_list = [1, -1, 0, 0]
            destination_core = [0, 1]
            destination_axon = neuron_id + neuron_group * num_rep_neurons_per_element
        elif neg_rep_neuron:
            weight_list = [-1, 1, 0, 0]
            destination_core = [0, 1]
            destination_axon = neuron_id + neuron_group * num_rep_neurons_per_element
        else:
            print("[ERROR] Unknown neuron group.")
            exit(1)
        
        
        first_core_neurons.append(
            Neuron(
                reset_potential=0,
                weights=weight_list,
                leak=0,
                positive_threshold=1,
                negative_threshold=-1,
                destination_core=destination_core,
                destination_axon=destination_axon,
                destination_tick=0,
                current_potential=0,
                reset_mode=1
            )
        )

    '''
    Creating the connections for the first 
    core. In Fair's implementation
    the connections is where the binary
    representation of the matrix is stored.
    We also need to create the connections for the 
    feedback neurons.
    '''
    first_core_connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
    for col in range(width):
        for row in range(height):
            '''
            Obtaining the binary representation of the absolute value
            of the element in the matrix
            ''' 
            binary_rep = np.array(
                            [int(i) for i in BitArray(uint = abs(A[row, col]), length = 8).bin],
                            dtype=np.int32)
            
            '''
            Determining the row we will write the element to.
            If the element is positive, we store the binary representation on the upper axons.
            If the element is negative, we store the binary representation on the lower axons.
            '''
            if A[row, col] > 0:
                row_start = row * 2
            else:
                row_start = (row * 2) + 2 * height
            row_end = row_start + 2 # Just writing two rows

            '''
            Determining the columns we will be writing to. We will be able to write 
            a contigious 64 (2 32 bit rows) bits into the connection array as the 
            32 sequential axons all will have the binary representation of the weights 
            and we will write that representation to both the positive and negative 
            input axons.
            '''
            col_start = col * num_rep_neurons_per_element
            col_end = (col + 1) * num_rep_neurons_per_element
            
            '''
            After determining what row we will be writing the binary representation to, we can write
            these binary values to the positive representation neurons, the negative representation neurons,
            the positive feedback neurons, and the negative feedback neurons.
            '''
            col_connections = np.vstack((binary_rep, binary_rep))
            first_core_connections[row_start:row_end, col_start:col_end] = np.hstack((
                                                                            col_connections, 
                                                                            col_connections))
        
    '''
    Creating the neurons instructions for every axon in the core
    '''
    # neuron instructions for the positive input axons
    axon_list = [i % 2 for i in range(2 * height)] 
    # neuron instructions for the negative input axons 
    axon_list += [1 - (i % 2) for i in range(2 * height)]

    return Core(
        axons=axon_list,
        neurons=first_core_neurons,
        connections=first_core_connections.T,
        coordinates=core_coordinates
    )



def _fair_create_first_core_feedback(
        A, 
        core_coordinates, 
        num_neurons = 256, 
        num_axons = 256):
    '''
    Creates the first core in the VMM corelet according 
    to the method presented in Kaitlin Fair's dissertation.
    For every row this core requires 16 positive representation 
    neurons, 16 negative representation neurons, 16 positive feedback
    neurons, and 16 negative feedback neurons. The positive feedback
    neurons provide feedback for the positive representation
    neurons and the negative feedback neruons provide feedback for 
    the negative representation neurons.
    
    Arguments:
        A -- numpy array defining the matrix we are going to use.
        core_coordinates -- the (x, y) coordinates of where the core
                            will be placed in the grid
        
    Keyword Arguments:
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
    '''

    '''
    Defining the hardcoded values inherent to the mapping process this is 
    to make the code more clear rather than to parameterize the network
    (different values might mess stuff up)
    '''
    num_pos_feedback_neurons_per_element = 8
    num_neg_feedback_neurons_per_element = 8
    num_pos_rep_neurons_per_element = 8
    num_neg_rep_neurons_per_element = 8
    num_feedback_neurons_per_element = num_pos_feedback_neurons_per_element + \
                                        num_neg_feedback_neurons_per_element
    num_rep_neurons_per_element = num_pos_rep_neurons_per_element + \
                                    num_neg_rep_neurons_per_element
    num_axons_per_input = 4
    num_neurons_per_element = num_feedback_neurons_per_element + \
                                num_rep_neurons_per_element 

    height, width = A.shape

    '''
    Creating the neurons for the first core.
    All of these neurons differ in the weights, 
    the destination axons, and the destination
    core.
    '''
    first_core_neurons = []
    for neuron_num in range(num_neurons):
        '''
        Calculating which element the neuron is a part 
        of (neuron_group) and which neuron it is 
        for that element (neuron_id). Used to figure
        out if the neuron should be a feedback neuron
        or a representation neuron and what size it is
        '''
        neuron_group = math.floor(neuron_num / num_neurons_per_element)
        neuron_id = neuron_num % num_neurons_per_element
        # First quarter neurons are positive representation neurons
        pos_rep_neuron =  neuron_id < num_pos_rep_neurons_per_element
        # Second quarter neurons are negative representation neurons
        neg_rep_neuron =  neuron_id >= num_pos_rep_neurons_per_element and \
                            neuron_id < num_rep_neurons_per_element
        # Third quarter neurons are positive feedback neurons
        pos_feedback_neuron =  neuron_id >= num_rep_neurons_per_element and \
                                neuron_id < num_rep_neurons_per_element + \
                                num_pos_rep_neurons_per_element
        # Fourth quarter neurons are negative feedback neurons
        neg_feedback_neuron =  neuron_id >= num_rep_neurons_per_element + \
                                num_pos_rep_neurons_per_element

        if pos_rep_neuron:
            weight_list = [1, -1, 0, 0]
            destination_core = [0, 1]
            destination_axon = neuron_id + neuron_group * num_rep_neurons_per_element
        elif neg_rep_neuron:
            weight_list = [-1, 1, 0, 0]
            destination_core = [0, 1]
            destination_axon = neuron_id + neuron_group * num_rep_neurons_per_element
        elif pos_feedback_neuron:
            weight_list = [-1, 1, 0, 0]
            destination_core = [0, 0]
            destination_axon = height * num_axons_per_input + \
                                neuron_group * num_feedback_neurons_per_element + \
                                neuron_id - num_rep_neurons_per_element
        elif neg_feedback_neuron:
            weight_list = [1, -1, 0, 0]
            destination_core = [0, 0]
            destination_axon = height * num_axons_per_input + \
                                neuron_group * num_feedback_neurons_per_element + \
                                neuron_id - num_rep_neurons_per_element
        else:
            print("[ERROR] Unknown neuron group.")
            exit(1)
        
        
        first_core_neurons.append(
            Neuron(
                reset_potential=0,
                weights=weight_list,
                leak=0,
                positive_threshold=1,
                negative_threshold=0,
                destination_core=destination_core,
                destination_axon=destination_axon,
                destination_tick=0,
                current_potential=0,
                reset_mode=1
            )
        )

    '''
    Creating the connections for the first 
    core. In Fair's implementation
    the connections is where the binary
    representation of the matrix is stored.
    We also need to create the connections for the 
    feedback neurons.
    '''
    first_core_connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
    for col in range(width):
        for row in range(height):
            '''
            Obtaining the binary representation of the absolute value
            of the element in the matrix
            ''' 
            binary_rep = np.array(
                            [int(i) for i in BitArray(uint = abs(A[row, col]), length = 8).bin],
                            dtype=np.int32)
            
            '''
            Determining the row we will write the element to.
            If the element is positive, we store the binary representation on the upper axons.
            If the element is negative, we store the binary representation on the lower axons.
            '''
            if A[row, col] > 0:
                row_start = row * 2
            else:
                row_start = (row * 2) + 2 * height
            row_end = row_start + 2 # Just writing two rows

            '''
            Determining the columns we will be writing to. We will be able to write 
            a contigious 64 (2 32 bit rows) bits into the connection array as the 
            32 sequential axons all will have the binary representation of the weights 
            and we will write that representation to both the positive and negative 
            input axons.
            '''
            col_start = col * num_neurons_per_element
            col_end = (col + 1) * num_neurons_per_element
            
            '''
            After determining what row we will be writing the binary representation to, we can write
            these binary values to the positive representation neurons, the negative representation neurons,
            the positive feedback neurons, and the negative feedback neurons.
            '''
            col_connections = np.vstack((binary_rep, binary_rep))
            first_core_connections[row_start:row_end, col_start:col_end] = np.hstack((
                                                                            col_connections, 
                                                                            col_connections, 
                                                                            col_connections, 
                                                                            col_connections))
        
        '''
        After writing all of the elements in the row, we need to create the 
        connection arrays for the feedback neurons. This might look confusing
        without first seeing a picture of what the cores look like but there 
        is a pretty simple pattern that arises.
        '''
        # Starting at the first row below all of the input spikes
        row_start = col * num_feedback_neurons_per_element + num_axons_per_input * height
        row_end = row_start + num_feedback_neurons_per_element

        # Starting at the first neuron of the column and going to the last
        col_start = col * num_neurons_per_element
        col_end = col_start + num_neurons_per_element

        '''
        The connections for both the positive representation neuron and 
        the negative feedback. Look at an image of the connections to
        see why it has this pattern
        '''
        pos_rep_neg_feedback_connections = np.vstack((
                                                np.identity(num_pos_rep_neurons_per_element), 
                                                np.zeros((
                                                    num_pos_rep_neurons_per_element, 
                                                    num_pos_rep_neurons_per_element))))
        '''
        The connections for both the negative representation neurons and the 
        positive feedback. Look at an image of the connections to see 
        why it has this pattern.
        '''
        neg_rep_pos_feedback_connections = np.vstack((
                                                np.zeros((
                                                    num_neg_rep_neurons_per_element, 
                                                    num_neg_rep_neurons_per_element)
                                                ),  
                                                np.identity(num_neg_rep_neurons_per_element)))
        
        '''
        Writing the feedback connections for the entire column of the matrix. Look 
        at an image of the connections to see why it has this pattern.
        '''
        first_core_connections[row_start:row_end, col_start:col_end] = np.hstack((pos_rep_neg_feedback_connections, 
                                                                        neg_rep_pos_feedback_connections,
                                                                        neg_rep_pos_feedback_connections,
                                                                        pos_rep_neg_feedback_connections))
        

    '''
    Creating the neurons instructions for every axon in the core
    '''
    # neuron instructions for the positive input axons
    axon_list = [i % 2 for i in range(2 * height)] 
    # neuron instructions for the negative input axons 
    axon_list += [1 - (i % 2) for i in range(2 * height)]  
    for col in range(width):
        # neurons instructions for the positive feedback neurons
        axon_list += [0 for i in range(num_pos_feedback_neurons_per_element)]
        # neuron instructions for the negative feedback neurons
        axon_list += [1 for i in range(num_neg_feedback_neurons_per_element)]

    return Core(
        axons=axon_list,
        neurons=first_core_neurons,
        connections=first_core_connections.T,
        coordinates=core_coordinates
    )


def _fair_create_second_core(
        A, 
        core_coordinates, 
        num_neurons = 256, 
        num_axons = 256):
    '''
    Creates the second core in the VMM corelet according 
    to the method presented in Kaitlin Fair's dissertation.
    This core applies the initial weights of [8, 4, 2, 1]
    to the output spikes of the first core.
    
    Arguments:
        A -- numpy array defining the matrix we are going to use.
        core_coordinates -- the (x, y) coordinates of where the core
                            will be placed in the grid
        
    Keyword Arguments:
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
    '''

    '''
    Defining the hardcoded values inherent to the mapping process this is 
    to make the code more clear rather than to parameterize the network
    (different values might mess stuff up)
    '''
    num_axons_per_neuron = 4
   
    '''
    Creating the neurons.
    All of these neurons are the same so just 
    creating a list of identical neurons
    '''
    second_core_neurons = []
    for neuron_num in range(num_neurons):
        second_core_neurons.append(
            Neuron(
                reset_potential=0,
                weights=[8, 4, 2, 1],
                leak=0,
                positive_threshold=1,
                negative_threshold=0,
                destination_core=[0, 1],
                destination_axon=neuron_num,
                destination_tick=0,
                current_potential=0,
                reset_mode=1
            )
        )

    
    # Creating the connections
    second_core_connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
    
    '''
    Each neuron has num_axons_per_neuron vertical sequential synapses
    which connects it to either the four most or least signifigant
    bits of the first core.
    '''
    for col in range(math.ceil(num_axons / num_axons_per_neuron)):
        row_start = col * num_axons_per_neuron
        row_end = (col + 1) * num_axons_per_neuron
        second_core_connections[row_start:row_end, col] = np.ones(
                                                            num_axons_per_neuron,
                                                            dtype=np.int32)

    return Core(
        axons=[i % num_axons_per_neuron for i in range(num_axons)],
        neurons=second_core_neurons,
        connections=second_core_connections.T,
        coordinates=core_coordinates
    )


def _fair_create_third_core_feedback(
        A, 
        num_corelets, 
        num_splitter_cores, 
        core_coordinates, 
        first_core_feedback = True,
        num_neurons = 256, 
        num_axons = 256):
    '''
    Creates the third core in the VMM corelet according 
    to the method presented in Kaitlin Fair's dissertation.
    This method also has feedback which will eliminate the 
    ammount of positive-negative representation neurons spiking.
    Feedback is necessary to get a one-to-one match with Compass.
    This core applies the initial weights of [16, -16, 1, -1]
    to the output spikes of the second core.
    
    Arguments:
        A -- numpy array defining the matrix we are going to use.
        num_corelets -- The number of corelets in the entire VMM. Used
                        to determine the dx necessary to get to the 
                        output bus
        num_splitter_cores -- The number of splitter cores in the entire
                                VMM. Used to determine the dx necessary
                                to get to the output bus
        core_coordinates -- the (x, y) coordinates of where the core
                            will be placed in the grid
        
    Keyword Arguments:
        first_core_feedback -- Whether there is feedback in the first core.
                               This is necessary because the last core
                               needs to know how many columns of the matrix
                               one corelet can handle so it can send to the
                               correct axons in the output bus (default: {True})
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
    '''

    '''
    Defining the hardcoded values inherent to the mapping process this is 
    to make the code more clear rather than to parameterize the network
    (different values might mess stuff up)
    '''
    num_rep_neurons_per_element = 2
    num_feedback_neurons_per_element = 2
    num_rep_axons_per_neuron = 4
    
    if first_core_feedback:
        first_core_num_neurons_per_element = 32
    else:
        first_core_num_neurons_per_element = 16
    
    _, width = A.shape
    
    # The iteration of corelet we are currrently on
    corelet_num = core_coordinates[0] - num_splitter_cores
    
    # This is the number of output elements that this core will output
    max_width_per_corelet = num_neurons // first_core_num_neurons_per_element
    
    '''
    Creating the neurons. In this core there are three kinds of 
    neurons: representation neurons, feedback neurons, and 
    do nothing neurons. Need to program each one differently
    '''
    third_core_neurons = []
    
    for neuron_num in range(num_neurons):
        # If it is a pos or neg representation neuron
        if neuron_num < num_rep_neurons_per_element * width: 
            '''
            Packets need to go past the remaining corelets in the grid
            '''
            destination_core = [num_corelets - corelet_num, 0]
            
            '''
            Axon of the output bus to write into. Need to write
            into the axon after all of the previous corelets.
            Each corelet will write num_rep_neurons_per_element * 
            max_width_per_corelet axons to the output bus as 
            that is the maximum number of elements a core can 
            handle times two as we need to output both the negative 
            and positive representation of the result
            '''
            destination_axon = neuron_num + corelet_num * \
                                num_rep_neurons_per_element * \
                                max_width_per_corelet
            
            '''
            Positive representation neurons will have the 
            positive weights first while negative representation
            neurons will have the negative weights first.
            '''
            if neuron_num % num_rep_neurons_per_element == 0:
                weight_list = [16, 1, -16, -1]
            else:
                weight_list = [-16, -1, 16, 1]
        # If it is a feedback neuron
        elif neuron_num < (num_rep_neurons_per_element + num_feedback_neurons_per_element) * width:
            destination_core = [0, 0]
            # Send to the axon directly after the inputs from the second core
            destination_axon = num_rep_neurons_per_element * width + neuron_num
            
            # Feedback weights are the negative of representation weights
            if neuron_num % num_feedback_neurons_per_element == 0:
                weight_list = [-16, -1, 16, 1]
            else:
                weight_list = [16, 1, -16, -1]
        # If it is a do nothing neurons
        else:
            destination_core = [0, 0]
            destination_axon = 0
            weight_list = [0, 0, 0, 0]
        
        
        
        third_core_neurons.append(
            Neuron(
                reset_potential=0,
                weights=weight_list,
                leak=0,
                positive_threshold=1,
                negative_threshold=0,
                destination_core=destination_core,
                destination_axon=destination_axon,
                destination_tick=0,
                current_potential=0,
                reset_mode=1
            )
        )


    # Creating the connections
    third_core_connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
    
    for col in range(width):
        # The number of columns (in the matrix) we still have to process
        num_cols_remaining = width - col
        
        '''
        Writing the entire column of the matrix. The row will start
        at the first axon that receives input from the second core
        and go all the way down to the feedback connections at the bottom
        '''
        start_row = col * num_rep_axons_per_neuron
        end_row = start_row + num_rep_axons_per_neuron * num_cols_remaining + \
                    num_feedback_neurons_per_element * col + \
                    num_feedback_neurons_per_element
        
        '''
        The columns of the synaptic crossbar where the representation
        neurons have their connections
        '''
        rep_start_col = col * num_rep_neurons_per_element
        rep_end_col = rep_start_col + num_rep_neurons_per_element
        
        '''
        The columns of the synaptic crossbar where the feedback 
        neurons have their connections
        '''
        feedback_start_col = rep_start_col + num_rep_neurons_per_element * width
        feedback_end_col = rep_end_col + num_feedback_neurons_per_element * width
        
        '''
        The number of rows inbetween the representation connections and the
        feedback connections 
        '''
        num_zeros = end_row - start_row - \
                    (num_rep_axons_per_neuron + num_feedback_neurons_per_element)

        '''
        All of the connections of the representation neurons. Look at the
        image to see why it looks like this.
        '''
        rep_connection_matrix = np.vstack((
                                    np.ones((
                                        num_rep_axons_per_neuron, 
                                        num_rep_neurons_per_element)), 
                                    np.zeros((
                                        num_zeros, 
                                        num_rep_neurons_per_element)),
                                    np.identity(num_feedback_neurons_per_element)))
   
        '''
        Same as representation connection but connection to feedback axons are rotated
        '''
        feedback_connection_matrix = np.vstack((
                                    np.ones((
                                        num_rep_axons_per_neuron, 
                                        num_rep_neurons_per_element)), 
                                    np.zeros((
                                        num_zeros, 
                                        num_rep_neurons_per_element)), 
                                    np.rot90(np.identity(num_feedback_neurons_per_element))))

        # writing the connections to the representation neurons
        third_core_connections[start_row:end_row, \
            rep_start_col:rep_end_col] = rep_connection_matrix
        
        # writing the connections to the feedback neurons
        third_core_connections[start_row:end_row, \
            feedback_start_col:feedback_end_col] = feedback_connection_matrix
    
    # neurons instructions for axons which receive inputs from the second core
    neuron_instructions = [i % num_rep_axons_per_neuron \
                            for i in range(num_rep_axons_per_neuron * width)]
    
    # neuron instructions for axons which receive inputs from feedback neurons
    for i in range(num_axons - num_rep_axons_per_neuron * width):
        if i % 2 == 0:
            neuron_instructions.append(1)
        else:
            neuron_instructions.append(3)

    return Core(
        axons=neuron_instructions,
        neurons=third_core_neurons,
        connections=third_core_connections.T,
        coordinates=core_coordinates
    )


def _fair_create_third_core(
        A, 
        num_corelets, 
        num_splitter_cores, 
        core_coordinates, 
        first_core_feedback = True,
        num_neurons = 256, 
        num_axons = 256):
    '''
    Creates the third core in the VMM corelet according 
    to the method presented in Kaitlin Fair's dissertation.
    This core applies the initial weights of [16, 1]
    to the output spikes of the second core. 

    NOTE: This will give the right answer but not a one-to-one
    spiking behavior with compass. Because of this it has 
    not been updated in a while so it will probably fail.

    Arguments:
        A -- numpy array defining the matrix we are going to use.
        num_corelets -- The number of corelets in the entire VMM. Used
                        to determine the dx necessary to get to the 
                        output bus
        num_splitter_cores -- The number of splitter cores in the entire
                                VMM. Used to determine the dx necessary
                                to get to the output bus
        core_coordinates -- the (x, y) coordinates of where the core
                            will be placed in the grid
        
    Keyword Arguments:
        first_core_feedback -- Whether there is feedback in the first core.
                               This is necessary because the last core
                               needs to know how many columns of the matrix
                               one corelet can handle so it can send to the
                               correct axons in the output bus (default: {True})
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
    '''

    '''
    Defining the hardcoded values inherent to the mapping process this is 
    to make the code more clear rather than to parameterize the network
    (different values might mess stuff up)
    '''
    num_rep_neurons_per_element = 2
    num_rep_axons_per_neuron = 2
    if first_core_feedback:
        first_core_num_neurons_per_element = 32
    else:
        first_core_num_neurons_per_element = 16
    
    _, width = A.shape
    
    # The iteration of corelet we are currrently on
    corelet_num = core_coordinates[0] - num_splitter_cores
    
    # This is the number of output elements that this core will output
    max_width_per_corelet = num_neurons // first_core_num_neurons_per_element
 

    '''
    Creating the neurons.
    All of these neurons are the same so just 
    creating a list of identical neurons
    '''
    third_core_neurons = []
    for neuron_num in range(num_neurons):
        destination_axon = neuron_num + corelet_num * \
                            num_rep_neurons_per_element * \
                            max_width_per_corelet
        destination_core = [num_corelets - corelet_num, 0]
        
        # Only need to create the representation neurons
        if neuron_num < num_rep_neurons_per_element * width:  
            third_core_neurons.append(
                Neuron(
                    reset_potential=0,
                    weights=[16, 1, 0, 0],
                    leak=0,
                    positive_threshold=1,
                    negative_threshold=0,
                    destination_core=destination_core,
                    destination_axon=destination_axon,
                    destination_tick=0,
                    current_potential=0,
                    reset_mode=1
                )
            )

    '''
    Creating the connections
    '''
    third_core_connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
    for col in range(math.ceil(num_axons / num_rep_axons_per_neuron)):
        third_core_connections[col * num_rep_axons_per_neuron:\
                                (col + 1) * num_rep_axons_per_neuron, col] = \
                                    np.ones(num_rep_axons_per_neuron, dtype=np.int32)

    return Core(
        axons=[i % num_rep_axons_per_neuron for i in range(num_axons)],
        neurons=third_core_neurons,
        connections=third_core_connections.T,
        coordinates=core_coordinates
    )


def _vmm_fair_create_single_corelet(
        A, 
        col_coord, 
        num_corelets, 
        num_splitter_cores, 
        num_neurons = 256, 
        num_axons = 256,
        first_core_feedback = True,
        third_core_feedback = True):
    '''
    Creates a single VMM corelet as defined in Kaitlin Fair's dissertation. This corelet consists of 
    three cores. It takes in the portion of the matrix and creates three cores which will do the 
    VMM of the input vector and that portion of the matrix.
    
    Arguments:
        A -- numpy array defining the matrix we are going to use.
        
    Keyword Arguments:
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
        first_core_feedback -- Whether tp ise feedback in the last core. 
                               Need to use a symmetric reset for this to
                               execute properly on TrueNorth (default: {True})
        third_core_feedback -- Whether to use feedback in the third core (default: {True}). 
    '''
    
    if first_core_feedback: 
        first_core = _fair_create_first_core_feedback(
                        A, 
                        [col_coord, 0], 
                        num_neurons=num_neurons, 
                        num_axons=num_axons)
    else:
        first_core = _fair_create_first_core(
                        A, 
                        [col_coord, 0], 
                        num_neurons=num_neurons, 
                        num_axons=num_axons)
 
    second_core = _fair_create_second_core(
                    A, 
                    [col_coord, 1], 
                    num_neurons=num_neurons, 
                    num_axons=num_axons)
    if third_core_feedback:
        third_core = _fair_create_third_core_feedback(
                        A, 
                        num_corelets, 
                        num_splitter_cores, 
                        [col_coord, 2], 
                        first_core_feedback = first_core_feedback,
                        num_neurons=num_neurons, 
                        num_axons=num_axons)
    else:
        third_core = _fair_create_third_core(
                        A, 
                        num_corelets, 
                        num_splitter_cores, 
                        [col_coord, 2], 
                        first_core_feedback = first_core_feedback,
                        num_neurons=num_neurons, 
                        num_axons=num_axons)
    
    return [first_core, second_core, third_core]


def _vmm_fair_create_splitter_core(
        height, 
        num_corelets_per_splitter, 
        splitter_num, 
        num_splitter_cores, 
        num_corelets, 
        num_neurons = 256, 
        num_axons = 256):
    '''
    Creates a splitter core.

    Arguments:
        height -- The height of the matrix. This is the number of elements in 
                  the vector which tells us how many cores we will have.
        num_corelets_per_splitter -- The number of corelets that we will need 
                                     to send the input to for a single splitter.
        splitter_num -- The index of the splitter core that we are creating. 
                        This is when we have multiple splitter cores.
    
    Keyword Arguments:
        num_neurons -- The number of neurons in a core (Default: {256})
        num_axons -- The number of axons in a core (Default: {256})
    '''

    '''
    Determining how many corelets this particular splitter will send to and how many 
    corelets are already hooked up to splitter cores.
    '''
    is_last_splitter = splitter_num == num_splitter_cores - 1
    if is_last_splitter:
        num_corelets_to_send_to = num_corelets - splitter_num * num_corelets_per_splitter
    else:
        num_corelets_to_send_to = num_corelets_per_splitter
    
    # The number of corelets that already have splitters sending to them
    num_corelets_already_hooked_up = splitter_num * num_corelets_per_splitter

    '''
    Creating all of the neurons in the splitter core
    '''
    neurons = [] 
    for corelet_num in range(num_corelets_to_send_to):
        for neuron_num in range(4 * height):
            weights = [1, 0, 0, 0]
            destination_core = [num_splitter_cores -\
                                         splitter_num + \
                                        num_corelets_already_hooked_up + \
                                        corelet_num, 0]
            destination_axon = neuron_num

            neurons.append(
                Neuron(
                    reset_potential=0,
                    weights=weights,
                    leak=0,
                    positive_threshold=1,
                    negative_threshold=0,
                    destination_core=destination_core,
                    destination_axon=destination_axon,
                    destination_tick=0,
                    current_potential=0,
                    reset_mode=1
            )
    )

    '''
    Creating the connections. Connections are just going to be 
    a bunch of identity matrices horizontally concatenated to each other
    '''
    connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
    for corelet in range(num_corelets_to_send_to):
        connections[0:4 * height, corelet * 4 * height:(corelet + 1) * 4 * height] = np.identity(4 * height, dtype = np.int32)

    return Core(
        axons=[0 for i in range(num_axons)],
        neurons=neurons,
        connections=connections.T,
        coordinates=[splitter_num, 0]
    ) 


def _vmm_fair_create_packets(vector, destination_core = [0, 0]):
    '''
    Creates a list of Packet objects using the method presented by Kaitlin
    Fair's dissertation.
    
    Arguments:
        vector -- numpy array defining the vector that we are going to use.

    Keyword Arguments:
        destination_core -- list defining the coordinates of where the input packets will go
    '''

    '''
    The only difference between Fair and Mendat's versions are that Fair
    needs to send each input in twice in order to be able to avoid 
    indexing issues when using both positive and negative elements
    in the matrix.
    '''

    output_packets = []
    _, width = vector.shape
    '''
    Need to create each input twice to deal with negative inputs and negative
    weights (otherwise run into an indexing issue)
    '''
    for input_iter in range(2):
        for col in range(width):
            for packet in range(abs(vector[0, col])):
                if vector[0, col] > 0:
                    destination_axon = 2 * col + input_iter * 2 * width
                else:
                    destination_axon = 2 * col + 1 + input_iter * 2 * width

                output_packets.append(
                    Packet(
                        destination_core=destination_core,
                        destination_axon=destination_axon,
                        destination_tick=packet
                    )
                )

    
    return output_packets # Just sending everything on the same tick

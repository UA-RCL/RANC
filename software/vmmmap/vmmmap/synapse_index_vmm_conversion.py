from rancutils import Neuron, Core, Packet
import numpy as np
import math
from bitstring import BitArray

def vmm_synapse_index_create_cores_and_packets(
    A, 
    x, 
    num_neurons = 256, 
    num_axons = 256):
    '''
    Creates a list of Core and Packet objects using the VMM mapping method of indexing
    into the weight lookup tables with the synapse. Also outputs dictionaries that define 
    the output bus and simulator configuration. Note the following:
        - Special architectural changes are necessary for this mapping to work. 
        - There is no feedback so symmetric synapse has to be enabled.
        - No splitter cores so there is a maximum width of matrix. 
    
    Arguments:
        A -- numpy array defining the matrix we are going to use.
        
    Keyword Arguments:
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
    '''

    '''
    Defining the hardcoded values inherent to the mapping process this is 
    to make the code more clear rather than to parameterize the network
    (different values might mess stuff up)
    '''
    num_rep_neurons_per_element = 2
    num_axons_per_input = 2

    '''
    Calculating all the parameters to see how many neurons, axons, and cores
    we will need.
    ''' 
    height, width = A.shape
    num_representation_neurons = num_rep_neurons_per_element * width
    
    '''
    Making sure the given parameters will map a valid VMM
    '''
    if num_representation_neurons > num_neurons:
        print("[ERROR] VMM provided requires {} neurons but the architecture " \
            "only has {} neurons. Either increase the number of neurons or " \
            "implement the splitter core functionality." \
            .format(num_representation_neurons, num_neurons))
        exit(1)
    
    if height * num_axons_per_input > num_axons:
        print("[ERROR] VMM provided requires {} axons but the architecture " \
            "only has {} axons.".format(height * num_axons_per_input, num_axons))
        exit(1)

    print("Using indexing synapse method to map a VMM")

    # Generating all of the input packets which will represent the vector
    packets = [_vmm_synapse_index_create_packets(x)]

    '''
    Creating the single core for the VMM. Also need to get the
    number of weights as it depends on the maximum number of 
    unique elements in a col.
    '''
    core, num_weights = _vmm_synpase_index_create_core(A, 
                            num_neurons = num_neurons,
                            num_axons = num_axons)
    cores = [core]


    '''
    Creating the output bus which will be directly above the single core.
    ''' 
    output_bus = {
        'coordinates': [0, 1],
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
        'num_cores_x': 1,
        'num_cores_y': 2,
        'num_weights': num_weights,
        'max_tick_offset': 16,
        'neuron_block_trace_verbosity': 0,
        'token_controller_trace_verbosity': 0,
        'scheduler_trace_verbosity': 0
    }

    return cores, output_bus, packets, config


def _vmm_synpase_index_create_core(
        A,
        num_neurons = 256,
        num_axons = 256):

    height, width = A.shape

    '''
    Creating all of the connections that are going to be used in the VMM. 
    All elements in the crossbar will be connected where there are 
    valid neurons and axons. So setting all of those conections
    to one.
    '''
    connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
    connections[:2*height, :2*width] = np.ones((2*height, 2*width), dtype=np.int32)


    '''
    Creating the list of unique possible weights for every neuron. 
    This is going to depend on the specific elements in the matrix 
    so it will change everytime. This is done so we can maximuze the
    our weight reuse and try to minimize the memory footprint.
    '''
    weight_lists = []
    max_unique_weights = 0
    for col in range(width):
        weights = np.squeeze(np.asarray(A[:, col]))
        weights = np.hstack((weights, -1 * weights))
        weights = list(set(weights))
        weight_lists.append(weights)
        if len(weights) > max_unique_weights:
            max_unique_weights = len(weights)

    for index, weight_list in enumerate(weight_lists):
        for _ in range(max_unique_weights - len(weight_list)):
            weight_lists[index].append(0)

    '''
    Creating all of the neurons that are going to be used in the VMM. Don't have
    to create all `num_neurons` neurons as the simulator and hardware will place
    default neurons that don't do anything for those neurons.
    '''
    neurons = []
    for neuron_num in range(2 * width):
        neurons.append(
            Neuron(
                reset_potential=0,
                weights=weight_lists[neuron_num // 2],
                leak=0,
                positive_threshold=1,
                negative_threshold=-1,
                destination_core=[0, 1],
                destination_axon=neuron_num,
                destination_tick=0,
                current_potential=0,
                reset_mode=1
            )
        )


    axons = []
    for col in range(width):
        pos_neuron_axons = []
        neg_neuron_axons = []
        for row in range(height):
            pos_neuron_axons.append(weight_lists[col].index(A[row, col]))
            pos_neuron_axons.append(weight_lists[col].index(-1 * A[row, col]))
            neg_neuron_axons.append(weight_lists[col].index(-1 * A[row, col]))
            neg_neuron_axons.append(weight_lists[col].index(A[row, col]))
        axons.append(pos_neuron_axons)
        axons.append(neg_neuron_axons)



    return Core(
        axons=axons,
        neurons=neurons,
        connections=connections.T,
        coordinates=[0, 0]
    ), max_unique_weights



def _vmm_synapse_index_create_packets(vector, destination_core = [0, 0]):
    '''
    Creates a list of Packet objects. Should be the same as the method
    presented by Mendat.
    
    Arguments:
        vector -- numpy array defining the vector that we are going to use.

    Keyword Arguments:
        destination_core -- list defining the coordinates of where the input packets will go
    '''

    output_packets = []
    _, width = vector.shape
    
    for col in range(width):
        for packet in range(abs(vector[0, col])):
            if vector[0, col] > 0:
                destination_axon = 2 * col
            else:
                destination_axon = 2 * col + 1

            output_packets.append(
                Packet(
                    destination_core=destination_core,
                    destination_axon=destination_axon,
                    destination_tick=packet
                )
            )

    
    return output_packets # Just sending everything on the same tick
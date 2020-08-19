'''
Provides the functionality to map vector matrix 
multiplication (VMM) on RANC cores as described
in Daniel Mendat's dissertation.

NOTE: Should only use Fair's methods for the 
time being. Have not worked on Mendat's methods
in a while so it is possible they will not work
with the current flow. Ideally there will be a 
similar interface for all methods and you just pick
your favorite.
'''


from rancutils import Neuron, Core, Packet
import numpy as np
import math
from bitstring import BitArray


def vmm_mendat_create_cores(
        A, 
        num_neurons = 256, 
        num_axons = 256, 
        bitwidth = 4):
    '''
    Creates a list of Core objects using the method presented by Mendat et. al
    in "Word2vec World Similarities on IBM's TrueNorth Neurosynaptic System".
    
    Arguments:
        A -- numpy array defining the matrix we are going to use.
        
    Keyword Arguments:
        num_neurons -- The number of neurons in a given core. (default: {256})
        num_axons -- The number of axons in a given core. (default: {256})
        bitwidth -- The precision of the VMM. (default: {4})
    '''

    '''
    Checking if all inputs fall within the bitwidth
    '''
    within_bitwidth = np.where(
                        A.flatten() <= 2**(bitwidth - 1) - 1, 
                        True, 
                        False)
    if not np.all(within_bitwidth):
        print("[ERROR] Not all elements are " \
                "within a bitwidth of {}.".format(bitwidth))
        return None
    
    height, width = A.shape
    if height > num_axons / 2:
        print("[ERROR] Cannot support matrix of height: {}. " \
                "Increase the number of axons.", height)
        return None

    '''
    Splitting into multiple corelets 
    (where each corelet corresponds to two cores) 
    '''
    num_corelets = math.ceil(width / 64)

    '''
    Iterating through every corelet which contains two cores
    '''
    cores = []
    for corelet_num in range(num_corelets):
        '''
        Creating the neurons for the first core.
        All of these neurons are the same except
        for the destination axon.
        '''
        first_core_neurons = []
        for neuron_num in range(num_neurons):
            destination_axon = (math.floor(neuron_num / bitwidth) + 1) * \
                                bitwidth - 1 - neuron_num % bitwidth
            first_core_neurons.append(
                Neuron(
                    reset_potential=0,
                    weights=[1, 1, 1, 1],
                    leak=0,
                    positive_threshold=1,
                    negative_threshold=0,
                    destination_core=[0, 1],
                    destination_axon= destination_axon,
                    destination_tick=0,
                    current_potential=0,
                    reset_mode=1
                )
            )

        '''
        Creating the connections for the first 
        core. In Mendat's implementation
        the connections is where the binary
        representation of the matrix is stored.
        Iterate through every element of the
        matrix and store the binary representation
        in the connections 
        '''
        first_core_connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
        for row in range(height):
            for col in range(width):
                first_core_connections[row * 2, col*bitwidth:(col+1)*bitwidth] = np.array([int(i) for i in BitArray(int = A[row, col], length = bitwidth).bin], dtype=np.int32)
                first_core_connections[row * 2 + 1, col*bitwidth:(col+1)*bitwidth] = np.array([int(i) for i in BitArray(int = -1 * A[row, col], length = bitwidth).bin], dtype=np.int32)
  
        '''
        Appending the first core to the core list
        '''
        cores.append(
            Core(
                axons=[0 for i in range(num_axons)],
                neurons=first_core_neurons,
                connections=first_core_connections.T,
                coordinates=[corelet_num, 0]
            )
        )

        '''
        Creating the neurons for the first core.
        All of these neurons are the same so just 
        creating a list of identical neurons
        '''
        second_core_neurons = []
        for neuron_num in range(num_neurons):
            second_core_neurons.append(
                Neuron(
                    reset_potential=0,
                    weights=[1, 2, 4, -8],
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

        '''
        Creating the connections for the second core.
        In Mendat's implementation the second core is 
        used to apply the proper weight to the spikes 
        of the previous core.
        '''
        second_core_connections = np.zeros((num_axons, num_neurons), dtype=np.int32)
        for col in range(math.ceil(num_neurons / bitwidth)):
            second_core_connections[col * bitwidth:(col + 1) * bitwidth, col] = np.ones((1, bitwidth), dtype=np.int32)

        '''
        Appending the first core to the core list
        '''
        cores.append(
            Core(
                axons=[i % bitwidth for i in range(num_axons)],
                neurons=second_core_neurons,
                connections=second_core_connections.T,
                coordinates=[corelet_num, 1]
            )
        )

    return cores

def vmm_mendat_create_packets(vector):
    '''
    Creates a list of Packet objects using the method presented by Mendat et. al
    in "Word2vec World Similarities on IBM's TrueNorth Neurosynaptic System".
    
    Arguments:
        vector -- numpy array defining the vector that we are going to use.
    '''
    output_packets = []
    _, width = vector.shape
    for col in range(width):
        for packet in range(abs(vector[0, col])):
            output_packets.append(
                Packet(
                    destination_core=[0, 0],
                    destination_axon= 2 * col if vector[0, col] > 0 else 2 * col + 1,   # Dealing with negative inputs
                    destination_tick=packet
                )
            )

    
    return [output_packets] # Just sending everything on the first tick


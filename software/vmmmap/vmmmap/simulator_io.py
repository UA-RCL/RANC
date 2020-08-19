'''
Provides the functionality to interface with the simulator
when it is executing a VMM. Right now this just contains
functionality on how to convert a output spike stream into
a result of a VMM.
'''


from rancutils import Neuron, Core, Packet
import numpy as np
import math
from bitstring import BitArray


def read_vmm_output(file_path):
    '''
    Reads the output of the simulator and decodes the 
    spikes to be interpreted as the result of a VMM.
    It returns the pure spikes of the neurons, the 
    accumulated spikes for each neuron, and the 
    resulting vector of the calculation

    Arguments:
        file_path -- Path to output file
    '''
    spikes = []
    with open(file_path) as f:
        for line in f:
            '''
            Turning into integer and getting rid of the 
            BOM that is there because output is utf-8 encoded.
            '''
            spikes.append([
                    int(i.split('\ufeff')[1])  \
                    if '\ufeff' in i \
                    else int(i) \
                    for i in line.split()
                ])

    '''
    Turning it into a numpy array so I can do FANCAY things :-)
    '''
    spikes = np.array(spikes, dtype = np.int32).T
    neuron_output = np.sum(spikes, axis = 1)
    vector_output = np.subtract.reduceat(
                        neuron_output, 
                        range(0, spikes.shape[0], 2))

    return spikes, neuron_output, vector_output

import os
from collections import namedtuple

from myhdl import Cosimulation

'''
Note need to put two slashes around the string so we can 
also escape it in the iverilog command. The -D<name>=val commands
are doing a "`define <Name> val" in the testbench.
'''
cmd = ('iverilog -o TokenController.o -Dnum_axons=%s -Dnum_neurons=%s '
       '-Dnum_weights=%s -Dfilename=\\"%s\\" -s test_TokenController '
       '../../sources/*.v test_TokenController.v')


Ports = namedtuple('ports', 'clk, rst, tick, axon_spikes, synapses, spike_in,'
                            'CSRAM_complete, local_buffers_full, error,'
                            'CSRAM_init, scheduler_set, scheduler_clr,'
                            'CSRAM_set, CSRAM_write, neuron_instruction,'
                            'spike_out, neuron_reg_en, next_neuron,'
                            'write_current_potential')

Params = namedtuple('params', 'num_axons, num_neurons, num_weights, filename')


def TokenController(ports, params):
    os.system(cmd % (params.num_axons,
                     params.num_neurons,
                     params.num_weights,
                     params.filename))

    return Cosimulation("vvp -m ../iverilog/myhdl.vpi TokenController.o",
                        **ports._asdict())

import os
from collections import namedtuple

from myhdl import Cosimulation


cmd = ('iverilog -o NeuronBlock.o -Dleak_width=%s '
       '-Dweight_width=%s -Dthreshold_width=%s -Dpotential_width=%s '
       '-Dnum_weights=%s -Dnum_reset_modes=%s -s test_NeuronBlock '
       '../../sources/*.v test_NeuronBlock.v')


Ports = namedtuple('ports', 'leak, weights, positive_threshold, '
                            'negative_threshold, reset_potential, '
                            'current_potential, neuron_instruction, '
                            'reset_mode, next_neuron, clk, integrator_reg_en, '
                            'write_current_potential, write_potential, '
                            'spike_out')

Params = namedtuple('params', 'leak_width, weight_width, threshold_width,'
                              'potential_width, num_weights, num_reset_modes')


def NeuronBlock(ports, params):
    os.system(cmd % (params.leak_width,
                     params.weight_width,
                     params.threshold_width,
                     params.potential_width,
                     params.num_weights,
                     params.num_reset_modes))
    return Cosimulation("vvp -m ../iverilog/myhdl.vpi NeuronBlock.o",
                        **ports._asdict())

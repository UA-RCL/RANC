import os
from collections import namedtuple

from myhdl import Cosimulation


cmd = ('iverilog -o RANCNetwork.o -I ../../sources -Dgrid_dimension_x=%s '
       '-Dgrid_dimension_y=%s -Doutput_core_x_coordinate=%s '
       '-Doutput_core_y_coordinate=%s -Dnum_outputs=%s -Dnum_neurons=%s '
       '-Dnum_axons=%s -Dnum_ticks=%s -Dnum_weights=%s -Dnum_reset_modes=%s '
       '-Dpotential_width=%s -Dweight_width=%s -Dleak_width=%s '
       '-Dthreshold_width=%s -Ddx_msb=%s -Ddx_lsb=%s -Ddy_msb=%s -Ddy_lsb=%s '
       '-Dinput_buffer_depth=%s -Drouter_buffer_depth=%s '
       '-Dmemory_filepath=\\"%s\\" -Dmaximum_number_of_packets=%s '
       '-Dc_s00_axis_tdata_width=%s -s test_RANCNetwork '
       '../../sources/*.v test_RANCNetwork.v')


InputPorts = namedtuple('input_ports', 'clk, rst, tick, s00_axis_aclk,'
                        's00_axis_aresetn, s00_axis_tdata,'
                        's00_axis_tstrb, s00_axis_tlast,'
                        's00_axis_tvalid')

OutputPorts = namedtuple('output_ports', 'packet_out, packet_out_valid,'
                         'token_controller_error,'
                         'scheduler_error, packet_read_error,'
                         'fifo_write_error, s00_axis_tready')

Params = namedtuple('params', 'grid_dimension_x, grid_dimension_y,'
                    'output_core_x_coordinate,'
                    'output_core_y_coordinate, num_outputs,'
                    'num_neurons, num_axons, num_ticks, num_weights,'
                    'num_reset_modes, potential_width, weight_width,'
                    'leak_width, threshold_width, dx_msb, dx_lsb, dy_msb,'
                    'dy_lsb, input_buffer_depth,'
                    'router_buffer_depth, memory_filepath,'
                    'maximum_number_of_packets,'
                    'c_s00_axis_tdata_width')


def RANCNetwork(input_ports, output_ports, params):
    os.system(cmd % (params.grid_dimension_x,
                     params.grid_dimension_y,
                     params.output_core_x_coordinate,
                     params.output_core_y_coordinate,
                     params.num_outputs,
                     params.num_neurons,
                     params.num_axons,
                     params.num_ticks,
                     params.num_weights,
                     params.num_reset_modes,
                     params.potential_width,
                     params.weight_width,
                     params.leak_width,
                     params.threshold_width,
                     params.dx_msb,
                     params.dx_lsb,
                     params.dy_msb,
                     params.dy_lsb,
                     params.input_buffer_depth,
                     params.router_buffer_depth,
                     params.memory_filepath,
                     params.maximum_number_of_packets,
                     params.c_s00_axis_tdata_width))

    return Cosimulation("vvp -m ../iverilog/myhdl.vpi RANCNetwork.o",
                        **input_ports._asdict(), **output_ports._asdict())

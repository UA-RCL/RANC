import os
import collections

from myhdl import Cosimulation


cmd = ('iverilog -o ForwardEastWest.o -Dpacket_width=%s '
       '-Ddx_msb=%s -Ddx_lsb=%s -Ddy_msb=%s -Ddy_lsb=%s -Dbuffer_depth=%s '
       '-Deast=%s -s test_ForwardEastWest ../../sources/*.v '
       'test_ForwardEastWest.v')

Ports = collections.namedtuple('ports', 'clk, rst, din_routing,'
                                        'din_token_controller, empty_routing,'
                                        'ren_in_north, empty_token_controller,'
                                        'ren_in_routing, ren_in_south,'
                                        'ren_out_routing,'
                                        'ren_out_token_controller,'
                                        'dout_routing, routing_buffer_empty,'
                                        'dout_north, north_buffer_empty,'
                                        'dout_south, south_buffer_empty')

Params = collections.namedtuple('params', 'packet_width, dx_msb, dx_lsb,'
                                          'dy_msb, dy_lsb, buffer_depth, east')


def ForwardEastWest(ports, params):
    os.system(cmd % (params.packet_width,
                     params.dx_msb,
                     params.dx_lsb,
                     params.dy_msb,
                     params.dy_lsb,
                     params.buffer_depth,
                     params.east))

    return Cosimulation("vvp -m ../iverilog/myhdl.vpi ./ForwardEastWest.o",
                        **ports._asdict())

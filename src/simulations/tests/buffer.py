import os

from myhdl import Cosimulation


cmd = ('iverilog -o buffer.o -Ddata_width=%s -Dbuffer_depth=%s '
       '-s test_buffer ../../sources/*.v test_buffer.v')


def buffer(clk, rst, din, din_valid, read_en, dout, empty, full, depth=4):
    os.system(cmd % (len(din), depth))
    return Cosimulation('vvp -m ../iverilog/myhdl.vpi buffer.o',
                        clk=clk,
                        rst=rst,
                        din=din,
                        din_valid=din_valid,
                        read_en=read_en,
                        dout=dout,
                        empty=empty,
                        full=full)

import unittest
import random

from myhdl import Simulation, Signal, delay, intbv
from myhdl import StopSimulation, always

from buffer import buffer


WIDTHS = [4, 21, 32, 64, 128]
DEPTHS = [1, 2, 4, 8, 16, 32, 64, 128]


class TestBuffer(unittest.TestCase):

    def runTest(self, test, width, depth, delay_ns=10):
        """Helper function to run a specific test with the standard signals"""
        # Regs
        clk, din_valid, read_en = [Signal(bool(0)) for i in range(3)]
        rst = Signal(bool(1))
        din = Signal(intbv(0)[width:0])
        # Wires
        dout = Signal(intbv(0)[width:0])
        empty, full = [Signal(bool(0)) for i in range(2)]

        dut = buffer(clk,
                     rst,
                     din,
                     din_valid,
                     read_en,
                     dout,
                     empty,
                     full,
                     depth=depth)

        @always(delay(delay_ns))
        def clockGen():
            clk.next = not clk

        check = test(clk, rst, din, din_valid,
                     read_en, dout, empty, full, depth)

        sim = Simulation(dut, clockGen, check)
        sim.run()

    def testBufferFull(self):
        """Tests buffer full signal."""
        def test(clk, rst, din, din_valid, read_en, dout, empty, full, depth):
            # Cycle reset
            yield clk.negedge
            rst.next = 0
            yield clk.negedge
            # Fill up buffer
            data_list = [random.choice(range(1, min(2**len(din), 2**32)))
                         for _ in range(depth)]
            for data in data_list:
                self.assertNotEqual(full, 1)
                din.next = data
                din_valid.next = bool(1)
                yield clk.negedge
            # Check full signal
            yield clk.posedge
            self.assertEqual(full, 1)
            # Read from buffer
            yield clk.negedge
            read_en.next = 1
            # Check full signal and output data
            yield clk.posedge
            yield delay(10)
            self.assertNotEqual(full, 1)
            self.assertEqual(dout, data_list[0])
            raise StopSimulation

        for width in WIDTHS:
            for depth in DEPTHS:
                self.runTest(test, width, depth)

    def testBufferEmpty(self):
        """Tests buffer empty signal"""
        def test(clk, rst, din, din_valid, read_en, dout, empty, full, depth):
            # Cycle reset
            yield clk.negedge
            rst.next = 0
            yield clk.negedge
            # Fill up buffer
            data_list = [random.choice(range(1, min(2**len(din), 2**32)))
                         for _ in range(depth)]
            # data_list = random.sample(range(1, min(2**len(din), 2**32)), depth)
            for data in data_list:
                self.assertNotEqual(full, 1)
                din.next = data
                din_valid.next = bool(1)
                yield clk.negedge
            # Check full signal
            din_valid.next = bool(0)
            yield clk.posedge
            self.assertEqual(full, 1)
            # Read from buffer
            yield clk.negedge
            read_en.next = 1
            for data in data_list:
                self.assertNotEqual(empty, 1)
                yield clk.posedge
                yield delay(10)
                self.assertNotEqual(full, 1)
                self.assertEqual(dout, data)

            read_en.next = 0
            self.assertEqual(empty, 1)
            raise StopSimulation

        for width in WIDTHS:
            for depth in DEPTHS:
                self.runTest(test, width, depth)


if __name__ == '__main__':
    unittest.main(verbosity=2)

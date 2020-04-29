import unittest
from myhdl import Signal, intbv, Simulation, always, delay, StopSimulation
from RANCNetwork import RANCNetwork, InputPorts, OutputPorts, Params

# Helper function


def peek_line(f):
    pos = f.tell()
    line = f.readline()
    f.seek(pos)
    return line


# Constants across all tests
TICK_PERIOD_NS = 1400000
DEBUG = True


class TestRANCNetwork(unittest.TestCase):

    def runTest(self, test, grid_dimension_x, grid_dimension_y,
                output_core_x_coordinate, output_core_y_coordinate,
                num_outputs, num_neurons, num_axons, num_ticks, num_weights,
                num_reset_modes, potential_width, weight_width, leak_width,
                threshold_width, max_dimension_x, max_dimension_y,
                input_buffer_depth, router_buffer_depth, memory_filepath,
                maximum_number_of_packets, c_s00_axis_tdata_width,
                correct_filepath, delay_ns=10, tick_latency=1):

        # Initializing registers
        clk, rst, tick, s00_axis_aclk, s00_axis_aresetn = [
            Signal(bool(0)) for _ in range(5)]
        s00_axis_tdata = Signal(intbv(0)[c_s00_axis_tdata_width:0])
        s00_axis_tstrb = Signal(intbv(0)[(c_s00_axis_tdata_width/8):0])
        s00_axis_tlast, s00_axis_tvalid = [Signal(bool(0)) for _ in range(2)]

        # Initializing wires
        packet_out = Signal(intbv(0)[num_outputs.bit_length():0])
        packet_out_valid, token_controller_error, scheduler_error, \
            packet_read_error, fifo_write_error, s00_axis_tready = [
                Signal(bool(0)) for _ in range(6)]

        input_ports = InputPorts(clk, rst, tick, s00_axis_aclk,
                                 s00_axis_aresetn, s00_axis_tdata,
                                 s00_axis_tstrb, s00_axis_tlast,
                                 s00_axis_tvalid)

        output_ports = OutputPorts(packet_out, packet_out_valid,
                                   token_controller_error, scheduler_error,
                                   packet_read_error, fifo_write_error,
                                   s00_axis_tready)

        params = Params(grid_dimension_x, grid_dimension_y,
                        output_core_x_coordinate, output_core_y_coordinate,
                        num_outputs, num_neurons, num_axons, num_ticks,
                        num_weights, num_reset_modes, potential_width,
                        weight_width, leak_width, threshold_width,
                        max_dimension_x, max_dimension_y, input_buffer_depth,
                        router_buffer_depth, memory_filepath,
                        maximum_number_of_packets, c_s00_axis_tdata_width)

        # Registers for the test bench
        counter = Signal(intbv(0)[32:0])
        num_ticks = Signal(intbv(0)[32:0])
        current_correct_line = Signal(intbv(0)[32:0])
        packet_count = Signal(intbv(0)[32:0])

        # Getting all of the correct packets
        correct_file = open(correct_filepath, 'r')

        # Obtaining the cosimulation object
        dut = RANCNetwork(input_ports, output_ports, params)

        """Generating the clock, tick, and checking the output
        against the simulator should be the same for every test
        so just keeping them all in here"""
        @always(delay(delay_ns))
        def clockGen():
            clk.next = not clk
            s00_axis_aclk.next = not s00_axis_aclk

        @always(clk.negedge)
        def tickGen():
            if int(bin(counter.val), 2) == TICK_PERIOD_NS / delay_ns - 1:
                counter.next = 0
                tick.next = 1
                num_ticks.next = num_ticks + 1
            else:
                tick.next = 0
                counter.next = counter + 1

        @always(clk.posedge)
        def checkOutput():
            if(num_ticks > tick_latency and packet_out_valid):
                correct_packet = correct_file.readline().rstrip()
                if DEBUG:
                    print('Tick {}, Packet {}: actual is {}, '
                          'correct is {}'.format(
                              int(bin(num_ticks.val), 2),
                              int(bin(packet_count.val), 2),
                              bin(packet_out.val), correct_packet))
                current_correct_line.next = current_correct_line + 1
                self.assertEqual(int(bin(packet_out.val), 2),
                                 int(correct_packet, 2))

                # Checking if there are more packets to process
                next_correct_packet = peek_line(correct_file)
                if next_correct_packet == '':
                    if DEBUG:
                        print('Test complete. All packets are correct.')
                    raise StopSimulation

                packet_count.next = packet_count + 1

        check = test(input_ports, output_ports, params)

        sim = Simulation(dut, clockGen, tickGen, checkOutput, check)
        sim.run()

    def test_vmm(self):
        """Comparing VMM with simulator"""

        # Parameters for this particular test
        grid_dimension_x = 3
        grid_dimension_y = 3
        output_core_x_coordinate = 2
        output_core_y_coordinate = 2
        num_outputs = 256
        num_neurons = 256
        num_axons = 256
        num_ticks = 16
        num_weights = 4
        num_reset_modes = 2
        potential_width = 9
        weight_width = 9
        leak_width = 9
        threshold_width = 9
        max_dimension_x = 512
        max_dimension_y = 512
        input_buffer_depth = 512
        router_buffer_depth = 4
        memory_filepath = '../memory_files/vmm/'
        maximum_number_of_packets = 400
        c_s00_axis_tdata_width = 32
        num_inputs_filepath = '../memory_files/vmm/tb_num_inputs.txt'
        input_filepath = '../memory_files/vmm/tb_input.txt'
        correct_filepath = '../memory_files/vmm/tb_correct.txt'

        # Opening the files that are to be used in the initial block
        num_inputs_file = open(num_inputs_filepath, 'r')
        input_file = open(input_filepath, 'r')

        def test(input_ports, output_ports, params):
            # Initialize inputs
            input_ports.s00_axis_aresetn.next = 0
            input_ports.s00_axis_tdata.next = 0
            input_ports.s00_axis_tlast.next = 0
            input_ports.s00_axis_tstrb.next = 15
            input_ports.s00_axis_tvalid.next = 0

            # Waiting fo nothing
            yield input_ports.clk.negedge
            yield input_ports.clk.negedge

            # Initializng AXI stream stuff
            yield input_ports.clk.posedge
            delay(1)
            input_ports.rst.next = 1
            for _ in range(15):
                yield input_ports.clk.posedge
            yield input_ports.clk.posedge
            delay(1)
            input_ports.rst.next = 0
            for _ in range(5):
                yield input_ports.clk.posedge
            yield input_ports.clk.posedge
            delay(1)
            input_ports.s00_axis_aresetn.next = 1
            yield input_ports.clk.posedge
            delay(1)

            # Sending the input data
            while True:
                num_inputs = num_inputs_file.readline().rstrip()
                if num_inputs == '':
                    if DEBUG:
                        print("Done sending inputs")
                    break

                """Iterate through every input and use AXI
                stream to send it into RANC"""
                for i in range(int(num_inputs)):
                    input_ports.s00_axis_tdata.next = intbv(
                        input_file.readline().rstrip())
                    input_ports.s00_axis_tvalid.next = 1
                    if i == int(num_inputs) - 1:
                        input_ports.s00_axis_tlast.next = 1

                    while not output_ports.s00_axis_tready:
                        yield input_ports.clk.posedge

                    yield input_ports.clk.posedge
                    delay(2)

                input_ports.s00_axis_tdata.next = 0
                input_ports.s00_axis_tvalid.next = 0
                input_ports.s00_axis_tlast.next = 0
                yield input_ports.tick.posedge

        self.runTest(test, grid_dimension_x, grid_dimension_y,
                     output_core_x_coordinate, output_core_y_coordinate,
                     num_outputs, num_neurons, num_axons, num_ticks,
                     num_weights, num_reset_modes, potential_width,
                     weight_width, leak_width, threshold_width, max_dimension_x,
                     max_dimension_y, input_buffer_depth,
                     router_buffer_depth, memory_filepath,
                     maximum_number_of_packets, c_s00_axis_tdata_width,
                     correct_filepath, tick_latency=1)


if __name__ == '__main__':
    unittest.main(verbosity=2)

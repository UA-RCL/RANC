import unittest
from itertools import permutations

from myhdl import Signal, intbv, Simulation, always, delay, StopSimulation

from ForwardEastWest import ForwardEastWest, Ports, Params

# Timing parameters
DELAY_NS = 10
TIMEOUT = DELAY_NS * 10
# Input parameters
MSBS_LSBS = [(29, 21, 20, 12), (20, 11, 10, 0), (10, 5, 4, 1), (20, 15, 8, 3)]
PACKET_WIDTHS = [30, 40, 50]
BUFFER_DEPTHS = [4, 8, 16]


def get_input_ports(ports):
    """Returns tuples containing input ports for either the router or tc"""
    routing_in_port = (ports.din_routing, ports.empty_routing,
                       ports.ren_out_routing)
    token_controller_in_port = (ports.din_token_controller,
                                ports.empty_token_controller,
                                ports.ren_out_token_controller)
    return routing_in_port, token_controller_in_port


def get_output_port(ports, dx, dy):
    """Gets the output ports for the destination of a packet with a particular
    dx and dy"""
    if dx:
        return (ports.routing_buffer_empty,
                ports.dout_routing,
                ports.ren_in_routing)
    elif dy >= 0:
        return (ports.north_buffer_empty, ports.dout_north,
                ports.ren_in_north)
    else:
        return (ports.south_buffer_empty, ports.dout_south,
                ports.ren_in_south)


def get_packet(params, dx, dy):
    """Returns a packet with the given dx and dy"""
    p = intbv(0)[params.packet_width:0]
    p[params.dx_msb +
        1:params.dx_lsb] = intbv(dx)[params.dx_msb - params.dx_lsb + 1:0]
    p[params.dy_msb +
        1:params.dy_lsb] = intbv(dy)[params.dy_msb - params.dy_lsb + 1:0]
    return p


def get_dx(params, packet):
    """Returns the dx of a packet"""
    return packet[params.dx_msb + 1: params.dx_lsb].signed()


def get_dy(params, packet):
    """Returns the dy of a packet"""
    return packet[params.dy_msb + 1: params.dy_lsb].signed()


class TestForwardEastWest(unittest.TestCase):

    def runTest(self, test, packet_width, dx_msb, dx_lsb, dy_msb, dy_lsb,
                buffer_depth, east, delay_ns=DELAY_NS):
        """Helper function to run a specific test with the standard signals"""
        # Regs
        clk, din_valid, read_en = [Signal(bool(0)) for i in range(3)]
        rst = Signal(bool(1))
        din_routing, din_token_controller = [
            Signal(intbv(0)[packet_width:0]) for i in range(2)]
        empty_routing, empty_token_controller = [
            Signal(bool(1)) for _ in range(2)]
        ren_in_north, ren_in_routing, ren_in_south = [
            Signal(bool(0)) for _ in range(3)]
        # Wires
        ren_out_routing, ren_out_token_controller = [
            Signal(bool(0)) for _ in range(2)]
        dout_routing = Signal(intbv(0)[packet_width-(dx_msb-dy_msb):0])
        dout_north, dout_south = \
            [Signal(intbv(0)[packet_width:0]) for _ in range(2)]
        routing_buffer_empty, north_buffer_empty, south_buffer_empty = [
            Signal(bool(1)) for i in range(3)]

        ports = Ports(clk,
                      rst,
                      din_routing,
                      din_token_controller,
                      empty_routing,
                      ren_in_north,
                      empty_token_controller,
                      ren_in_routing,
                      ren_in_south,
                      ren_out_routing,
                      ren_out_token_controller,
                      dout_routing,
                      routing_buffer_empty,
                      dout_north,
                      north_buffer_empty,
                      dout_south,
                      south_buffer_empty)

        params = Params(packet_width, dx_msb, dx_lsb,
                        dy_msb, dy_lsb, buffer_depth, east)

        dut = ForwardEastWest(ports, params)

        @always(delay(delay_ns))
        def clockGen():
            clk.next = not clk

        check = test(ports, params)

        sim = Simulation(dut, clockGen, check)
        sim.run()

    def runSweep(self, test):
        """Iterates over possible parameters and runs tests"""
        for (dx_msb, dx_lsb, dy_msb, dy_lsb) in MSBS_LSBS:
            with self.subTest(dx_msb=dx_msb, dx_lsb=dx_lsb, dy_msb=dy_msb,
                              dy_lsb=dy_lsb):
                for east in [0, 1]:
                    with self.subTest(east=east):
                        for packet_width in PACKET_WIDTHS:
                            with self.subTest(packet_width=packet_width):
                                for buffer_depth in BUFFER_DEPTHS:
                                    with self.subTest(
                                            buffer_depth=buffer_depth):
                                        self.runTest(test, packet_width,
                                                     dx_msb, dx_lsb, dy_msb,
                                                     dy_lsb, buffer_depth,
                                                     east)

    def test_paths(self):
        """Sends a packet through all possible paths"""
        def test(ports, params):
            dx_add = -1 if params.east else 1
            # Cycle reset
            yield ports.clk.negedge
            ports.rst.next = 0
            yield ports.clk.negedge
            # Test all paths
            for din, empty_in, ren_out in get_input_ports(ports):
                for dx in [0, 1 if params.east else -1]:
                    for dy in [1, 0, -1]:
                        # Set output ports
                        empty_out, dout, ren_in = get_output_port(
                            ports, dx, dy)
                        # Set empty low
                        empty_in.next = bool(0)
                        # Wait for read enable
                        yield ren_out.posedge, delay(TIMEOUT)
                        self.assertTrue(ren_out)
                        # Send in packet
                        yield ports.clk.posedge
                        din.next = get_packet(params, dx, dy)
                        empty_in.next = bool(1)
                        # Wait for packet to populate buffer
                        yield (empty_out.negedge,
                               delay(TIMEOUT))
                        self.assertFalse(empty_out)
                        # Read packet
                        yield ports.clk.negedge
                        ren_in.next = Signal(bool(1))
                        yield ports.clk.posedge
                        yield delay(2)
                        if dx:
                            self.assertEqual(get_dx(params, dout), dx + dx_add)
                        else:
                            self.assertEqual(get_dy(params, dout), dy)
                        ren_in.next = Signal(bool(0))
            raise StopSimulation

        self.runSweep(test)

    def test_contention(self):
        """Tests contention between all possible paths"""
        def test(ports, params):
            dx_add = -1 if params.east else 1
            yield ports.clk.negedge
            ports.rst.next = 0
            yield ports.clk.negedge
            # Test all paths
            for dx_routing, dx_tc in permutations([0,
                                                   1 if params.east else -1]):
                for dy_routing, dy_tc in permutations([1, 0, -1], 2):
                    # Set output ports
                    empty_out_routing, dout_routing, ren_in_routing = \
                        get_output_port(ports, dx_routing, dy_routing)
                    empty_out_tc, dout_tc, ren_in_tc = \
                        get_output_port(ports, dx_tc, dy_tc)
                    # Set empty low
                    ports.empty_routing.next = bool(0)
                    ports.empty_token_controller.next = bool(0)
                    # Wait for read enable for routing
                    yield ports.ren_out_routing.posedge, delay(TIMEOUT)
                    self.assertTrue(ports.ren_out_routing)
                    self.assertFalse(ports.ren_out_token_controller)
                    # Send in packet from routing
                    yield ports.clk.posedge
                    ports.din_routing.next = get_packet(params, dx_routing,
                                                        dy_routing)
                    ports.empty_routing.next = bool(1)
                    # Wait for packet to populate buffer (on posedge)
                    yield (empty_out_routing.negedge,
                           delay(TIMEOUT))
                    self.assertFalse(empty_out_routing)
                    # Request packet from routing
                    ren_in_routing.next = Signal(bool(1))
                    # Wait for read enable to tc
                    yield (ports.ren_out_token_controller.posedge,
                           delay(TIMEOUT))
                    self.assertFalse(ports.ren_out_routing)
                    self.assertTrue(ports.ren_out_token_controller)
                    # Send in packet from token controller
                    yield ports.clk.posedge
                    ports.din_token_controller.next = get_packet(params,
                                                                 dx_tc,
                                                                 dy_tc)
                    ports.empty_token_controller.next = bool(1)
                    # Read packet from routing
                    yield delay(2)
                    if dx_routing:
                        self.assertEqual(
                            get_dx(params, dout_routing), dx_routing + dx_add)
                    else:
                        self.assertEqual(
                            get_dy(params, dout_routing), dy_routing)
                    ren_in_routing.next = Signal(bool(0))
                    # Wait for packet from tc to populate buffer
                    yield (empty_out_tc.negedge,
                           delay(TIMEOUT))
                    # Request packet from tc
                    ren_in_tc.next = Signal(bool(1))
                    # Read packet from tc
                    yield ports.clk.posedge
                    yield delay(2)
                    if dx_tc:
                        self.assertEqual(
                            get_dx(params, dout_tc), dx_tc + dx_add)
                    else:
                        self.assertEqual(
                            get_dy(params, dout_tc), dy_tc)
                    ren_in_tc.next = Signal(bool(0))

            raise StopSimulation

        self.runSweep(test)

    def test_buffers(self):
        """Fills all buffers and checks full signals"""
        def test(ports, params):
            dx_add = -1 if params.east else 1
            # Cycle reset
            yield ports.clk.negedge
            ports.rst.next = 0
            yield ports.clk.negedge
            # Test all paths
            for din, empty_in, ren_out in get_input_ports(ports):
                for dx in [0, 1 if params.east else -1]:
                    for dy in [0, 1]:
                        # for dx in [0, 1 if params.east else -1]:
                        # for dy in [1, 0, -1]:
                        # Set empty low
                        empty_in.next = bool(0)
                        for _ in range(params.buffer_depth):
                            # Wait for read enable
                            yield ren_out.posedge, delay(TIMEOUT)
                            self.assertTrue(ren_out)
                            # Send in packet
                            yield ports.clk.posedge
                            din.next = get_packet(params, dx, dy)
                        yield ren_out.negedge, delay(TIMEOUT)
                        self.assertFalse(ren_out)
                        empty_in.next = bool(1)
                        din.next = 0
                        # Read data
                        for _ in range(params.buffer_depth):
                            # Set output ports
                            empty_out, dout, ren_in = get_output_port(
                                ports, dx, dy)
                            # Read packet
                            yield ports.clk.negedge
                            ren_in.next = Signal(bool(1))
                            yield ports.clk.posedge
                            yield delay(2)
                            if dx:
                                self.assertEqual(
                                    get_dx(params, dout), dx + dx_add)
                            else:
                                self.assertEqual(get_dy(params, dout), dy)

            raise StopSimulation

        self.runSweep(test)


if __name__ == '__main__':
    unittest.main(verbosity=2)

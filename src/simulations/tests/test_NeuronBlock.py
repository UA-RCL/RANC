import unittest

from myhdl import Signal, intbv, Simulation, always, delay, StopSimulation

from NeuronBlock import NeuronBlock, Ports, Params


class TestNeuronBlock(unittest.TestCase):

    def runTest(self, test, leak_width, weight_width, threshold_width,
                potential_width, num_weights, num_reset_modes, delay_ns=10):
        # regs
        leak = Signal(intbv(0)[leak_width:0])
        weights = Signal(intbv(0)[weight_width*num_weights:0])
        positive_threshold, negative_threshold = [
            Signal(intbv(0)[threshold_width:0])for _ in range(2)]
        reset_potential, current_potential = [
            Signal(intbv(0)[potential_width:0]) for _ in range(2)]
        neuron_instruction = Signal(
            intbv(0)[num_weights.bit_length():0])
        reset_mode = Signal(
            intbv(0)[num_reset_modes.bit_length():0])
        next_neuron, clk, integrator_reg_en = [
            Signal(bool(0)) for _ in range(3)]
        write_current_potential = Signal(bool(0))
        # wire
        write_potential = Signal(intbv(0)[potential_width:0])
        spike_out = Signal(bool(0))

        ports = Ports(leak, weights, positive_threshold,
                      negative_threshold, reset_potential, current_potential,
                      neuron_instruction, reset_mode, next_neuron, clk,
                      integrator_reg_en, write_current_potential,
                      write_potential, spike_out)

        params = Params(leak_width, weight_width, threshold_width,
                        potential_width, num_weights, num_reset_modes)

        dut = NeuronBlock(ports, params)

        @always(delay(delay_ns))
        def clockGen():
            clk.next = not clk

        check = test(ports, params)

        sim = Simulation(dut, clockGen, check)
        sim.run()

    def setWeights(self, ports, params, weights):
        for i, weight in enumerate(weights):
            ports.weights.next[
                (i+1)*params.weight_width:i*params.weight_width
            ] = intbv(weight).signed()[params.weight_width:]

    def testHardReset(self):
        """Test if hard reset is working"""
        def test(ports, params):
            yield ports.clk.negedge
            yield ports.clk.negedge
            # Set values for this neuron
            yield ports.clk.posedge
            yield delay(1)
            weights = [-10, 10, 2, 4]
            self.setWeights(ports, params, weights)
            ports.write_current_potential.next = 0
            ports.positive_threshold.next = 5
            ports.negative_threshold.next = intbv(-5)[params.threshold_width:]
            ports.reset_potential.next = intbv(-3)[params.potential_width:]
            ports.current_potential.next = 0
            ports.reset_mode.next = 0
            ports.leak.next = intbv(-1)[params.leak_width:]
            # First spike - weight of -10 falls below negative_threshold,
            # so reset to - -3
            ports.next_neuron.next = bool(1)
            ports.integrator_reg_en.next = 1
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.write_potential.signed(),
                             -ports.reset_potential.signed())
            ports.next_neuron.next = bool(0)
            # Check middle two weights (no resets should happen)
            running_sum = -10
            for weight in weights[1:-1]:
                ports.neuron_instruction.next += 1
                yield ports.clk.posedge
                yield delay(1)
                running_sum += weight
                self.assertEqual(ports.write_potential.signed(),
                                 running_sum + ports.leak.signed())
            # Last weight should cause spike and reset
            ports.neuron_instruction.next += 1
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.spike_out, 1)
            self.assertEqual(ports.write_potential.signed(),
                             ports.reset_potential.signed())
            raise StopSimulation

        # Run with default parameters
        self.runTest(test, 9, 9, 18, 18, 4, 2)

    def testLinearReset(self):
        """Test if linear reset is working"""
        def test(ports, params):
            yield ports.clk.posedge
            yield delay(1)
            weights = [-10, 10, 2, 3]
            self.setWeights(ports, params, weights)
            ports.write_current_potential.next = 0
            ports.positive_threshold.next = 4
            ports.negative_threshold.next = intbv(-5)[params.threshold_width:]
            ports.reset_potential.next = intbv(-3)[params.potential_width:]
            ports.current_potential.next = 0
            ports.reset_mode.next = 1
            # First spike - weight of -10 falls below negative_threshold,
            # so reset to - -3
            ports.next_neuron.next = bool(1)
            ports.integrator_reg_en.next = 1
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.write_potential.signed(),
                             weights[0]-ports.negative_threshold.signed())
            ports.next_neuron.next = bool(0)
            # Check middle two weights (no resets should happen)
            running_sum = -10
            for weight in weights[1:-1]:
                ports.neuron_instruction.next += 1
                yield ports.clk.posedge
                yield delay(1)
                running_sum += weight
                self.assertEqual(ports.write_potential.signed(),
                                 running_sum)
            # Last weight should cause spike and reset
            ports.neuron_instruction.next += 1
            running_sum += weights[-1]
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.spike_out, 1)
            self.assertEqual(ports.write_potential.signed(),
                             running_sum - ports.positive_threshold.signed())
            raise StopSimulation

        # Run with default parameters
        self.runTest(test, 9, 9, 18, 18, 4, 2)

    def testVariableWeights(self):
        """Tests varying the number and bitwidth of weights"""
        def test(ports, params):
            yield ports.clk.posedge
            yield delay(1)
            weights = [i + 1 for i in range(params.num_weights)]
            self.setWeights(ports, params, weights)
            ports.write_current_potential.next = 0
            ports.positive_threshold.next = sum(weights)
            ports.negative_threshold.next = intbv(-5)[params.threshold_width:]
            ports.reset_potential.next = intbv(0)[params.potential_width:]
            ports.current_potential.next = 0
            ports.reset_mode.next = 0

            ports.next_neuron.next = bool(1)
            ports.integrator_reg_en.next = 1
            yield ports.clk.posedge
            yield delay(1)
            ports.next_neuron.next = 0
            if num_weights == 1:
                self.assertEqual(ports.spike_out, 1)
                self.assertEqual(ports.write_potential, ports.reset_potential)
                raise StopSimulation

            self.assertEqual(ports.write_potential, weights[0])
            for i, weight in enumerate(weights[1:-1]):
                ports.neuron_instruction.next += 1
                yield ports.clk.posedge
                yield delay(1)
                self.assertEqual(ports.write_potential,
                                 sum(weights[:i+2]))

            raise StopSimulation

        '''
        FIXME: weight_width of 64 is breaking because unknown module type
        of weight_width_greater_than_potential_width. I think the module
        is correctly reporting the error but myhdl/iverilog doesn't know 
        what to do with it so it keeeps running the simulation and then
        throws an assertion.
        '''
        for weight_width in [8, 9, 12]: #[8, 9, 12, 64]:
            with self.subTest(weight_width=weight_width):
                for num_weights in [1, 2, 4, 8, 9]:
                    with self.subTest(num_weights=num_weights):
                        self.runTest(test, 9, weight_width,
                                     18, 18, num_weights, 2)

    def testVariableBitwidths(self):
        """Test varying bitwidths for thresholds, leaks, and potential"""
        def test(ports, params):
            yield ports.clk.negedge
            yield ports.clk.negedge
            # Set values for this neuron
            yield ports.clk.posedge
            yield delay(1)
            weights = [-10, 10, 2, 4]
            self.setWeights(ports, params, weights)
            ports.positive_threshold.next = 5
            ports.negative_threshold.next = intbv(-5)[params.threshold_width:]
            ports.reset_potential.next = intbv(-3)[params.potential_width:]
            ports.current_potential.next = 0
            ports.reset_mode.next = 0
            ports.leak.next = intbv(-1)[params.leak_width:]
            # First spike - weight of -10 falls below negative_threshold,
            # so reset to - -3
            ports.next_neuron.next = bool(1)
            ports.integrator_reg_en.next = 1
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.write_potential.signed(),
                             -ports.reset_potential.signed())
            ports.next_neuron.next = bool(0)
            # Check middle two weights (no resets should happen)
            running_sum = -10
            for weight in weights[1:-1]:
                ports.neuron_instruction.next += 1
                yield ports.clk.posedge
                yield delay(1)
                running_sum += weight
                self.assertEqual(ports.write_potential.signed(),
                                 running_sum + ports.leak.signed())
            # Last weight should cause spike and reset
            ports.neuron_instruction.next += 1
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.spike_out, 1)
            self.assertEqual(ports.write_potential.signed(),
                             ports.reset_potential.signed())
            raise StopSimulation

        # Run with varying parameters
        for leak_width in [2, 4, 9, 20]:
            with self.subTest(leak_width=leak_width):
                for threshold_width in [5, 8, 20, 40]:
                    with self.subTest(threshold_width=threshold_width):
                        for potential_width in [5, 8, 20, 40]:
                            weight_width = min(potential_width, 9)
                            with self.subTest(potential_width=potential_width):
                                self.runTest(test, leak_width, weight_width,
                                             threshold_width, potential_width,
                                             4, 2)


if __name__ == '__main__':
    unittest.main(verbosity=2)

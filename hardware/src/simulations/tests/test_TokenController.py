import unittest
import random
from myhdl import Signal, intbv, Simulation, always, delay, StopSimulation
from TokenController import TokenController, Ports, Params

# Input parameters
NUM_AXONS = [128, 256, 512, 1024, 2048]


def create_word(
        params,
        indices):
    '''
    Creates a word of num_axons length and sets
    every index in the list "indices" to one.
    '''
    word = intbv(0)[params.num_axons:0]
    for index in indices:
        word[index] = 1

    return word


class TestTokenController(unittest.TestCase):

    def runTest(self, test, num_axons, num_neurons, num_weights, filename,
                delay_ns=10):

        # Initializing registers
        clk = Signal(bool(0))
        rst = Signal(bool(0))
        tick = Signal(bool(0))
        axon_spikes = Signal(intbv(0)[num_axons:0])
        synapses = Signal(intbv(0)[num_axons:0])
        spike_in = Signal(bool(0))
        CSRAM_complete = Signal(bool(0))
        local_buffers_full = Signal(bool(0))

        # Initializing wires
        error = Signal(bool(0))
        CSRAM_init = Signal(bool(0))
        scheduler_set = Signal(bool(0))
        scheduler_clr = Signal(bool(0))
        CSRAM_set = Signal(bool(0))
        CSRAM_write = Signal(bool(0))
        neuron_instruction = Signal(intbv(0)[num_weights.bit_length():0])
        spike_out = Signal(bool(0))
        neuron_reg_en = Signal(bool(0))
        next_neuron = Signal(bool(0))
        write_current_potential = Signal(bool(0))

        # Getting all of the ports of the module
        ports = Ports(clk, rst, tick, axon_spikes, synapses, spike_in, CSRAM_complete,
                      local_buffers_full, error, CSRAM_init, scheduler_set,
                      scheduler_clr, CSRAM_set, CSRAM_write, neuron_instruction,
                      spike_out, neuron_reg_en, next_neuron, write_current_potential)

        # Getting all of the params to customize the module
        params = Params(num_axons, num_neurons, num_weights, filename)

        # Object which lets us interface with iverilog
        dut = TokenController(ports, params)

        @always(delay(delay_ns))
        def clockGen():
            clk.next = not clk

        check = test(ports, params)

        sim = Simulation(dut, clockGen, check)
        sim.run()

    def test_error(self):
        """Test if the tc_error is reported correctly"""
        def test(ports, params):
            # Waiting fo nothing
            yield ports.clk.negedge
            yield ports.clk.negedge

            # In state IDLE and recieving a tick
            yield ports.clk.negedge
            yield delay(1)
            ports.tick.next = 1
            yield ports.clk.negedge
            yield delay(1)
            ports.tick.next = 1  # Keeping the tick high

            # Checking state SET_SCHED_INIT_CSRAM
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.error, 1)
            self.assertEqual(ports.CSRAM_init, 1)
            self.assertEqual(ports.scheduler_set, 1)

            raise StopSimulation

        self.runTest(
            test,
            256,
            256,
            4,
            '../memory_files/token_controller_tests/tc_unittest_256.mem')

    def test_entire_flow(self):
        """Test entire token controller flow with varying number of axons"""
        def test(ports, params):
            # Waiting fo nothing
            yield ports.clk.negedge
            yield ports.clk.negedge

            # In state IDLE and recieving a tick
            yield ports.clk.negedge
            yield delay(1)
            ports.tick.next = 1
            yield ports.clk.negedge
            yield delay(1)
            ports.tick.next = 0

            # Checking state SET_SCHED_INIT_CSRAM
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.error, 0)
            self.assertEqual(ports.CSRAM_init, 1)
            self.assertEqual(ports.scheduler_set, 1)

            # Going through every neuron (states SET_CSRAM -> NEURON_CHECK)
            for neuron_num in range(0, params.num_neurons):
                if neuron_num == params.num_neurons - 1:
                    ports.CSRAM_complete.next = 1
                else:
                    ports.CSRAM_complete.next = 0

                # Checking state WAIT_FOR_CSRAM
                yield ports.clk.posedge
                yield delay(1)
                synapses = list(set([random.randint(0, params.num_axons - 1)
                                     for i in range(random.randint(params.num_axons / 2, params.num_axons))]))
                ports.synapses.next = create_word(params, synapses)
                self.assertEqual(ports.CSRAM_init, 0)
                self.assertEqual(ports.scheduler_set, 0)
                self.assertEqual(ports.CSRAM_set, 0)
                yield ports.clk.negedge  # Receive axon_spikes on the negative edge
                yield delay(1)
                if neuron_num == 0:  # Only get the new spikes on the first neuron
                    axon_spikes = list(set([random.randint(0, params.num_axons - 1) for i in range(
                        random.randint(params.num_axons / 2, params.num_axons))]))
                    ports.axon_spikes.next = create_word(params, axon_spikes)

                # Checking state FIRST_SPIKE_IN
                yield ports.clk.posedge
                yield delay(1)
                self.assertEqual(ports.next_neuron, 1)
                self.assertEqual(ports.neuron_reg_en, 1)
                if (0 in axon_spikes) and (0 in synapses):
                    self.assertEqual(ports.write_current_potential, 0)
                    self.assertEqual(ports.neuron_instruction, 0)
                else:
                    self.assertEqual(ports.write_current_potential, 1)

                # Checking state SPIKE_IN
                # Process the rest of the spikes
                for axon_num in range(1, params.num_axons):
                    yield ports.clk.posedge
                    yield delay(1)
                    '''FIXME: neuron instruction is hardcoded to the tea
                    learning neuron instructions should make it more dynamic
                    where.'''
                    self.assertEqual(ports.neuron_instruction, axon_num % 2)
                    self.assertEqual(ports.next_neuron, 0)
                    # if spike and synapse on this axon
                    if (axon_num in axon_spikes) and (axon_num in synapses):
                        self.assertEqual(ports.neuron_reg_en, 1)
                    else:
                        self.assertEqual(ports.neuron_reg_en, 0)

                # Checking state WRITE_CSRAM when the local buffer is full for
                # two clock cycles
                ports.local_buffers_full.next = 1
                ports.spike_in.next = 1
                yield ports.clk.posedge
                yield delay(1)
                self.assertEqual(ports.neuron_reg_en, 0)
                self.assertEqual(ports.CSRAM_write, 0)
                self.assertEqual(ports.spike_out, 0)
                yield ports.clk.posedge
                yield delay(1)
                ports.local_buffers_full.next = 0
                yield ports.clk.posedge
                yield delay(1)
                self.assertEqual(ports.neuron_reg_en, 0)
                self.assertEqual(ports.CSRAM_write, 1)
                self.assertEqual(ports.spike_out, 1)

                # Checking state NEURON_CHECK
                yield ports.clk.posedge
                yield delay(1)
                self.assertEqual(ports.CSRAM_write, 0)
                self.assertEqual(ports.spike_out, 0)

            # Checking state CLR_SCHED
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.scheduler_clr, 1)
            if neuron_num != params.num_neurons - 1:
                self.assertEqual(ports.CSRAM_set, 1)

            # Checking state IDLE
            yield ports.clk.posedge
            yield delay(1)
            self.assertEqual(ports.scheduler_clr, 0)

            raise StopSimulation

        '''
        Sweeping number of axons. Not sweeping number of neurons
        because all of the functionality for counting the number
        of neurons is in the CSRAM (doesn't even need to be a 
        parameter for the TC, but it is nice to have). Also
        not sweeping number of weights because that is 
        just used to get the bitwidths for the neuron instructions.
        '''
        for axon in NUM_AXONS:
            with self.subTest(num_axons=axon):
                self.runTest(
                    test,
                    axon,
                    256,
                    4,
                    '../memory_files/token_controller_tests/'
                    'tc_unittest_{}.mem'.format(axon))


if __name__ == '__main__':
    unittest.main(verbosity=2)

from bitstring import BitArray


class Neuron(object):
    def __init__(self, reset_potential, weights, leak, positive_threshold,
                 negative_threshold, destination_core, destination_axon,
                 destination_tick, current_potential=0, reset_mode=0):
        assert len(destination_core) == 2,\
            'Destination Core must be 2D.'
        self.reset_potential = reset_potential
        self.weights = weights
        self.leak = leak
        self.positive_threshold = positive_threshold
        self.negative_threshold = negative_threshold
        #self.destination_core = destination_core   # Altered by Spencer on 11/14/2019 - Removed for updated destination_core_offset json listing.
        self.destination_core_offset = destination_core
        self.destination_axon = destination_axon
        self.destination_tick = destination_tick
        self.current_potential = current_potential
        self.reset_mode = reset_mode
        return super(Neuron, self).__init__()

    def hardware_str(self,
                     potential_width=9,
                     leak_width=9,
                     weight_width=9,
                     threshold_width=9,
                     num_reset_modes=2,
                     max_dx=512,
                     max_dy=512,
                     num_axons=256,
                     num_ticks=16):
        """Returns the CSRAM entry for this neuron"""
        formatted_weights = [BitArray(int=weight, length=weight_width)
                             for weight in self.weights]
        neuron_params = '{}{}{}{}{}{}{}'.format(
            BitArray(int=self.current_potential, length=potential_width).bin,
            BitArray(int=self.reset_potential, length=potential_width).bin,
            ''.join([w.bin for w in formatted_weights]),
            BitArray(int=self.leak, length=leak_width).bin,
            BitArray(int=self.positive_threshold, length=threshold_width).bin,
            BitArray(int=self.negative_threshold, length=threshold_width).bin,
            BitArray(uint=self.reset_mode,
                     length=num_reset_modes.bit_length()-1).bin
        )

        spike_destination = '{}{}{}'.format(
            ''.join([BitArray(int=i, length=m.bit_length()-1).bin
                     for i, m in zip(self.destination_core_offset, #self.destination_core,
                                     [max_dx, max_dy])]),
            BitArray(uint=self.destination_axon,
                     length=num_axons.bit_length()-1).bin,
            BitArray(uint=self.destination_tick,
                     length=num_ticks.bit_length()-1).bin
        )

        return '{}{}'.format(neuron_params, spike_destination)

from bitstring import BitArray


class Packet(object):
    def __init__(self, destination_core, destination_axon, destination_tick):
        assert len(destination_core) == 2,\
            'Destination Core must be 2D.'
        self.destination_core = destination_core
        self.destination_axon = destination_axon
        self.destination_tick = destination_tick
        return super(Packet, self).__init__()

    def hardware_str(self,
                     max_dx=512,
                     max_dy=512,
                     num_axons=256,
                     num_ticks=16):
        return '{}{}{}{}'.format(
            BitArray(int=self.destination_core[0],
                     length=max_dx.bit_length() - 1).bin,
            BitArray(int=self.destination_core[1],
                     length=max_dy.bit_length() - 1).bin,
            BitArray(uint=self.destination_axon,
                     length=num_axons.bit_length() - 1).bin,
            BitArray(uint=self.destination_tick,
                     length=num_ticks.bit_length() - 1).bin
        )

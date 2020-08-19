class Core(object):

    def __init__(self, axons, neurons, connections, coordinates):
        """Initializes a new `Core` object.

        Arguments:
            axons -- A list containing the neuron instructions for each axon
            neurons -- A list of `Neuron` objects containing the neurons for
                       this core
            connections -- A (num_axons, num_neurons) shaped matrix containing
                           the binary connection values for the core.
            coordinates -- (x, y) coordinates of the core."""
        self.axons = axons
        self.neurons = neurons
        self.connections = connections
        self.coordinates = coordinates
        return super(Core, self).__init__()

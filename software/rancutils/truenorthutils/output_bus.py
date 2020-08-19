class OutputBus(object):
    def __init__(self, coordinates, num_outputs):
        self.coordinates = coordinates
        assert len(coordinates) == 2, \
            'Coordinates must be 2D'
        self.num_outputs = num_outputs

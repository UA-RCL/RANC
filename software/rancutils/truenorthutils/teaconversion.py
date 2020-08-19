from .neuron import Neuron
from .core import Core
from .packet import Packet

import numpy as np


def get_connections_and_biases(model, num_layers):
    weights = model.get_weights()
    names = [weight.name for layer in model.layers for weight in layer.weights]
    connections = [[] for i in range(num_layers)]
    biases = [[] for i in range(num_layers)]

    for weight, name in zip(weights, names):
        layer_id = int(name.split('/')[0].split('_')[1]) - 1
        data_type = name.split('/')[1]

        if 'connection' in data_type:
            connections[layer_id].append(weight)
        elif 'bias' in data_type:
            biases[layer_id].append(weight)

    return connections, biases


def create_cores(
    model, num_layers, core_coordinates=None,
    weights=[1, -1, 1, -1],
    num_classes=10, num_neurons=256,
    neuron_reset_type=0
):
    connections, biases = get_connections_and_biases(model, num_layers)

    core_shapes = [[core.shape for core in layer] for layer in connections]
    layer_sizes = [len(layer) for layer in connections]

    # If core coordinates are not specified, each layer is given a row
    if core_coordinates is None:
        core_coordinates = []
        for i, layer in enumerate(core_shapes):
            layer_coordinates = []
            for j in range(len(layer)):
                layer_coordinates.append((j, i))
            core_coordinates.append(layer_coordinates)

    # Define core objects
    cores = []
    for layer_coordinates, layer_shapes, layer_size, connections_layer, \
        bias_layer in zip(core_coordinates, core_shapes, layer_sizes,
                          connections, biases):

        layer_cores = []
        for single_core_coordinates, core_shape, connections_core, bias_core \
            in zip(layer_coordinates,
                   layer_shapes,
                   connections_layer,
                   bias_layer):
            # FIXME: Simulator assumes connections are formatted as
            # (neurons, axons). Probably not intuitive
            connections_constrained = np.round(connections_core)
            connections_constrained = np.clip(connections_constrained, 0, 1)
            layer_cores.append(
                Core(axons=[0, 1]*int(core_shape[0]/2),
                     neurons=None,
                     connections=connections_constrained.T.astype(
                         int
                     ).tolist(),
                     coordinates=single_core_coordinates)
            )
        cores.append(layer_cores)

    # Define neuron objects
    layer_num = 0
    for layer_cores, layer_shapes, layer_size, connections_layer, \
        bias_layer in zip(cores, core_shapes, layer_sizes,
                          connections, biases):
        # The number of cores to offset the in the destination
        core_offset = 0
        axon_offset = 0
        for core, core_shape, connections_core, bias_core in zip(
            layer_cores, layer_shapes, connections_layer, bias_layer
        ):
            neurons = []
            # Iterate through neurons
            for connections_neuron, bias_neuron in zip(
                connections_core.T, bias_core
            ):
                if (layer_num != len(cores) - 1):
                    coords = (
                        cores[layer_num+1][core_offset].coordinates[0] -
                        core.coordinates[0],
                        cores[layer_num+1][core_offset].coordinates[1] -
                        core.coordinates[1])
                else:
                    # Output bus is given its own row
                    coords = (-core.coordinates[0], 1)
                neurons.append(Neuron(reset_potential=0,
                                      weights=weights,
                                      leak=int(np.round(bias_neuron)),
                                      positive_threshold=0,
                                      negative_threshold=0,
                                      destination_core=coords,
                                      destination_axon=axon_offset,
                                      destination_tick=0,
                                      current_potential=0,
                                      reset_mode=neuron_reset_type))
                axon_offset += 1
                if layer_num < len(core_shapes) - 1:
                    if axon_offset == \
                       core_shapes[layer_num+1][core_offset][0]:
                        core_offset += 1
                        axon_offset = 0

            core.neurons = neurons
        layer_num += 1

    # Flatten cores
    return [c for cl in cores for c in cl]


def create_packets(packets, core_coordinates=None):
    # If no coordinates specified, feed to the first row
    if core_coordinates is None:
        core_coordinates = []
        for i in range(len(packets)):
            core_coordinates.append((i, 0))

    output_packets = []
    for core_num, core in enumerate(packets):
        for tick_num, tick in enumerate(core):
            packets_tick = []
            for packet_num, packet in enumerate(tick):
                if (np.round(packet) == 1):
                    packets_tick.append(
                        Packet(destination_core=core_coordinates[core_num],
                               destination_axon=packet_num,
                               destination_tick=0)
                    )
            if len(output_packets) - 1 < tick_num:
                output_packets.append(packets_tick)
            else:
                output_packets[tick_num] += packets_tick

    return output_packets

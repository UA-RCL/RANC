# Utlities for the RANC FPGA Emulation
from .neuron import Neuron
from .core import Core

import os
import struct
import math

from bitstring import BitArray
import numpy as np


def write_cores(cores,
                max_xy=(64, 64),
                potential_width=9,
                leak_width=9,
                weight_width=9,
                threshold_width=9,
                num_reset_modes=2,
                max_dx=512,
                max_dy=512,
                num_axons=256,
                num_neurons=256,
                num_ticks=16,
                num_weights=4,
                output_path='streaming/',
                max_file_number=100,
                verbose=False):

    assert len(str(max_file_number)) >= len(str(max_xy[0]*max_xy[1]))

    # Define default cores for those that are not specified
    default_cores = []
    default_axons = [0]*num_axons
    default_neuron = Neuron(
        0, [0]*num_weights, 0, 1, 0, [0, 0], 0, 0
    )
    default_neurons = [default_neuron]*num_neurons
    default_connections = np.zeros((num_axons,
                                    num_neurons)).astype(int).tolist()

    for x in range(max_xy[0]):
        cores_row = []
        for y in range(max_xy[1]):
            cores_row.append(Core(default_axons,
                                  default_neurons,
                                  default_connections,
                                  [x, y]))
        default_cores.append(cores_row)

    for core in cores:
        default_cores[core.coordinates[0]][core.coordinates[1]] = core

    for core_num, core in enumerate([core for row in default_cores
                                     for core in row]):
        if verbose:
            print('writing csram and tc memory: core', core_num + 1, '/',
                  max_xy[0]*max_xy[1], end='\r')
        with open(os.path.join(output_path, 'csram_{}.mem'.format(
            str(core.coordinates[0] + max_xy[0] * core.coordinates[1]).zfill(
                len(str(max_file_number))
            )
        )), 'w+') as csram_file:
            for neuron_num in range(num_neurons):
                # If there is a neuron defined
                if neuron_num < len(core.neurons):
                    core_connections_np = np.array(core.connections)
                    neuron_str = core.neurons[neuron_num].hardware_str(
                        potential_width,
                        leak_width,
                        weight_width,
                        threshold_width,
                        num_reset_modes,
                        max_dx,
                        max_dy,
                        num_axons,
                        num_ticks
                    )
                    # If there are connections defined for this neuron
                    if neuron_num < core_connections_np.shape[0]:
                        conns = ''.join(
                            [str(conn) for conn in np.flip(
                                core.connections[neuron_num],
                                axis=0)]
                        ).zfill(num_axons)
                    else:
                        conns = ''.join(['0']*num_axons)
                # If there are no more defined neurons, use default
                else:
                    neuron_str = default_neuron.hardware_str(
                        potential_width,
                        leak_width,
                        weight_width,
                        threshold_width,
                        num_reset_modes,
                        max_dx,
                        max_dy,
                        num_axons,
                        num_ticks
                    )
                    conns = ''.join(['0']*num_axons)
                csram_file.write('{}{}\n'.format(conns, neuron_str))
        with open(os.path.join(output_path, 'tc_{}.mem'.format(
            str(core.coordinates[0] + max_xy[0] * core.coordinates[1]).zfill(
                len(str(max_file_number))
            )
        )), 'w+') as tc_file:
            for axon in core.axons:
                tc_file.write('{}\n'.format(
                    BitArray(uint=axon, length=num_weights.bit_length()-1).bin)
                )
            for _ in range(num_axons - len(core.axons)):
                tc_file.write('{}\n'.format(
                    BitArray(uint=0, length=num_weights.bit_length()-1).bin)
                )
    if verbose:
        print('writing csram and tc memory: done', end='\r')
        print()


def output_for_streaming(cores,
                         packets=None,
                         max_xy=(64, 64),
                         potential_width=9,
                         leak_width=9,
                         weight_width=9,
                         threshold_width=9,
                         num_reset_modes=2,
                         max_dx=512,
                         max_dy=512,
                         num_axons=256,
                         num_neurons=256,
                         num_ticks=16,
                         num_weights=4,
                         max_packet_xy=(512, 512),
                         output_path='streaming/',
                         packet_file_name='data.bin',
                         packet_count_file_name='count.bin',
                         max_file_number=100,
                         verbose=False):
    try:
        os.makedirs(output_path)
    except FileExistsError:
        pass

    if not (packets is None):
        with open(os.path.join(output_path, packet_file_name),
                  'wb') as packet_file, \
            open(os.path.join(output_path, packet_count_file_name),
                 'wb') as packet_count_file:

            for tick_index, tick in enumerate(packets):
                for packet_index, packet in enumerate(tick):
                    packet_file.write(
                        struct.pack('i', int(packet.hardware_str(
                            max_dx=max_packet_xy[0],
                            max_dy=max_packet_xy[1],
                            num_axons=num_axons,
                            num_ticks=num_ticks), 2))
                    )
                packet_count_file.write(struct.pack('i', len(tick)))
                if verbose and tick_index % 100 == 0:
                    print('generating packets: tick', tick_index + 1, '/',
                          len(packets), end='\r')
        if verbose:
            print('generating packets: done', end='\r')
            print()

    write_cores(cores,
                max_xy=max_xy,
                potential_width=potential_width,
                leak_width=leak_width,
                weight_width=weight_width,
                threshold_width=threshold_width,
                num_reset_modes=num_reset_modes,
                max_dx=max_dx,
                max_dy=max_dy,
                num_axons=num_axons,
                num_neurons=num_neurons,
                num_ticks=num_ticks,
                num_weights=num_weights,
                output_path=output_path,
                max_file_number=max_file_number,
                verbose=verbose)


def output_for_testbench(packets,
                         correct_outputs,
                         output_path='testbench/',
                         input_filename='tb_input.txt',
                         correct_filename='tb_correct.txt',
                         num_inputs_filename='tb_num_inputs.txt',
                         num_outputs_filename='tb_num_outputs.txt',
                         max_packet_xy=(512, 512),
                         num_axons=256,
                         num_ticks=16,
                         num_outputs=250):
    try:
        os.makedirs(output_path)
    except FileExistsError:
        pass

    with open(os.path.join(output_path, input_filename), 'w') as f, \
        open(os.path.join(output_path, num_inputs_filename),
             'w') as num_inputs_f:

        for tick, packets_tick in enumerate(packets):
            num_inputs_f.write(str(len(packets_tick)) + '\n')
            for packet_num, packet in enumerate(packets_tick):
                if tick != 0 or packet_num != 0:
                    f.write('\n')
                f.write(packet.hardware_str(max_dx=max_packet_xy[0],
                                            max_dy=max_packet_xy[1],
                                            num_axons=num_axons,
                                            num_ticks=num_ticks))

    with open(os.path.join(output_path, correct_filename), 'w') as f, \
        open(os.path.join(output_path, num_outputs_filename),
             'w') as num_outputs_f:

        for tick, correct_tick in enumerate(correct_outputs):
            num_outputs_f.write(str(len(np.nonzero(correct_tick)[0])) + '\n')
            for correct_num, correct in enumerate(np.nonzero(correct_tick)[0]):
                if tick != 0 or correct_num != 0:
                    f.write('\n')
                f.write(BitArray(
                    uint=int(correct),
                    length=math.ceil(math.log(num_outputs, 2))
                ).bin)

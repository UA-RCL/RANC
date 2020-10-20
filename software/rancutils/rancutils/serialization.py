from .packet import Packet
from .neuron import Neuron
from .core import Core

import json
import numpy as np


def save(filename, cores, packets, output_bus, indent=None):
    """Saves a list of cores and packets to a json file.

    Arguments:
        filename -- The name of the file to save to.
        cores -- A list of core objects to save.
        packets -- A 2D list of packet objects to save
                            (a list for each tick)

    Keyword Arguments:
        indent -- The amount to indent the json. If none, json is
                  written to one line. (default: {None})"""
    with open(filename, 'w+') as f:
        f.write(encode(cores, packets, output_bus, indent=indent))


def encode(cores, packets, output_bus, indent=None):
    """Encodes a list of cores and packets to json

    Arguments:
        cores -- A list of core objects to save.
        packets -- A 2D list of packet objects to save
                   (a list for each tick)
        output_bus -- The core that collects output

    Keyword Arguments:
        indent -- The amount to indent the json. If none, json is
                  written to one line. (default: {None})

    Returns:
        A string of json.
    """
    d = {'packets': packets, 'output_bus': output_bus, 'cores': cores}
    return json.dumps(d, default=_serialize, indent=indent)


def parse_packets(parent_json):
    """Parses a json string for a 2D list of packets.

    Arguments:
        parent_json -- The json string to parse. If it contains a 'packets'
                       object, this object should either be empty or be a 2D
                       list containing a list of packets for each tick.

    Returns:
        A 2D list of packet objects if packets were present in json,
            otherwise None.

    Raises:
        TypeError -- If packets is not empty but also not a 2D list, or if an
                     individual packet does not have the correct parameters.
    """
    if 'packets' not in parent_json:
        return None
    packets_json = parent_json['packets']
    if not packets_json:
        return None
    if (not isinstance(packets_json, list) or
       not isinstance(packets_json[0], list)):
        raise(TypeError, 'Packets json object is not a 2D list.')

    packets = []
    for packets_json_tick in packets_json:
        packets_tick = []
        for packet_json in packets_json_tick:
            packet = Packet(packet_json['destination_core'],
                            packet_json['destination_axon'],
                            packet_json['destination_tick'])
            packets_tick.append(packet)
        packets.append(packets_tick)

    return packets


def parse_neuron(neuron_json):
    """Parses a json string for a neuron object.

    Arguments:
        neuron_json -- The json string for the neuron.

    Returns:
        The neuron object.
    """
    return Neuron(neuron_json['reset_potential'],
                  neuron_json['weights'],
                  neuron_json['leak'],
                  neuron_json['positive_threshold'],
                  neuron_json['negative_threshold'],
                  neuron_json['destination_core'],
                  neuron_json['destination_axon'],
                  neuron_json['destination_tick'],
                  neuron_json['current_potential'],
                  neuron_json['reset_mode'])


def parse_cores(parent_json):
    """Parses a json string for a list of cores.

    Arguments:
        parent_json -- The json string to parse. If it contains a 'cores'
                       object, this object should either be empty or be a
                       list of cores.

    Returns:
        A list of core objects if cores were present in json, otherwise None.

    Raises:
        TypeError -- If a core does not have the correct parameters."""
    if 'cores' not in parent_json:
        return None
    cores_json = parent_json['cores']
    if not cores_json:
        return None
    if not isinstance(cores_json, list):
        raise(TypeError, 'Cores json object is not a list.')

    cores = []
    for core_json in cores_json:
        neurons = []
        for neuron_json in core_json['neurons']:
            neurons.append(parse_neuron(neuron_json))
        cores.append(Core(core_json['axons'],
                          neurons,
                          core_json['connections'],
                          core_json['coordinates']))

    return cores


def load(filename):
    """Loads a list of packets and cores from a json file.

    Arguments:
        filename -- The name of the file to read from.

    Returns:
         The packets and cores that were read.
    """
    with open(filename, 'r') as f:
        json_data = f.read()

    data = json.loads(json_data)

    packets = parse_packets(data)
    cores = parse_cores(data)

    if packets is None and cores is None:
        raise(ValueError, 'json file did not have packets or cores to parse.')

    return packets, cores


def _serialize(obj):
    """Helper function so that numpy arrays can be serialized correctly."""
    if isinstance(obj, np.ndarray):
        return obj.tolist()
    if isinstance(obj, np.int32) or isinstance(obj, np.int64):
        return int(obj)
    else:
        return obj.__dict__

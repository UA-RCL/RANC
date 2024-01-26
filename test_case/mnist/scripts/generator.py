from __future__ import absolute_import, division, print_function

from warnings import simplefilter
simplefilter(action='ignore', category=FutureWarning)
#simplefilter(action='ignore', category=tensorflow:Entity)

import tensorflow as tf
import numpy as np
import pathlib
import random
import argparse

#from PIL import Image
from tealayer2 import Tea, AdditivePooling
from truenorthutils.teaconversion import create_cores, create_packets, Packet, get_connections_and_biases
from tensorflow.keras.layers import Flatten, Activation, Input, Lambda, concatenate, Dropout
from tensorflow.keras import Model
from tensorflow.keras.models import Sequential
from tensorflow.keras.utils import to_categorical
from tensorflow.keras.datasets import mnist

##################################################
def run(options):
    # Generate the network based on user defined inputs
    network = generate_network(options)
    
    # Generate the model based on generated network
    model = Model(inputs=network[0], outputs=network[-1])

    model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])

    classnames = np.array([item.name for item in pathlib.Path(options.train_path).glob('*') if item.name != 'LICENSE.txt'])

    if options.debug:
        print("Classnames: {c}".format(c=classnames))
    
    '''
    # Generate the Data:
    training_data = []
    testing_data  = []
    training_data = create_training_data(training_data, classnames, [pathlib.Path(options.train_path)], 0)
    testing_data  = create_training_data(testing_data, classnames, [pathlib.Path(options.test_path)], 0)
    
    

    if options.debug:
        print("Training Data Acquired: {t}".format(t=len(training_data)))
        print("Testing Data Acquired: {t}".format(t=len(testing_data)))

    # Randomly shuffle the testing/training data
    random.shuffle(training_data)
    random.shuffle(testing_data)

    # Create the train/test pairs:
    X_train, y_train = [], []
    X_test, y_test = [], []

    # Populate the pairs
    for features, labels in training_data:
        X_train.append(features)
        y_train.append(labels)

    for features, labels in testing_data:
        X_test.append(features)
        y_test.append(labels)

    X_train = np.array(X_train).reshape(-1, options.image_size)
    X_test = np.array(X_test).reshape(-1, options.image_size)

    # Noramlize the Data:
    X_train, X_test = X_train/255.0, X_test/255.0
    
    '''
    (X_train, y_train), (X_test, y_test) = mnist.load_data()
    X_train = X_train.astype('float32')
    X_test = X_test.astype('float32')
    X_train /= 255
    X_test /= 255
                        
    #y_train = to_categorical(y_train, 10)
    #y_test = to_categorical(y_test, 10)
    
    X_train = X_train.reshape(-1, 28*28)
    X_test = X_test.reshape(-1, 28*28)

    # Encode the Data:
    if options.use_encoding:
        if options.debug:
            print("Using Encoding Datasets. Encoding the Train & Test Data")
        # Rate Encoding:
        if options.encoding_scheme.lower() in ('rate', 'r', 'rate encoding'):
            X_train = encode_dataset(X_train, options.tick_rate, 'rate', options.spike_train)
            X_test  = encode_dataset(X_test,  options.tick_rate, 'rate', options.spike_train)
        # Burst Rate Encoding:
        elif options.encoding_scheme.lower() in ('burst-rate', 'burst rate', 'burst', 'b', 'br'):
            X_train = encode_dataset(X_train, options.tick_rate, 'burst rate', options.spike_train)
            X_test  = encode_dataset(X_test,  options.tick_rate, 'burst rate', options.spike_train)
        # Time to Spike Encoding:
        elif options.encoding_scheme.lower() in ('time-to-spike', 'time', 'time_to_spike', 'tts', 't', 'ts'): 
            X_train = encode_dataset(X_train, options.tick_rate, 'time', options.spike_train)
            X_test  = encode_dataset(X_test,  options.tick_rate, 'time', options.spike_train)
        # If get something not what expected, default to Burst Rate Encoding.
        else:
            X_train = encode_dataset(X_train, options.tick_rate, 'burst rate', options.spike_train)
            X_test  = encode_dataset(X_test,  options.tick_rate, 'burst rate', options.spike_train)
    
    if options.debug:
        print("Training Shape: {s}".format(s=X_train.shape))
        print("Testing Shape: {s}".format(s=X_test.shape))

    y_train = to_categorical(y_train, options.classes)
    y_test  = to_categorical(y_test , options.classes)

    if options.debug:
        print("Training Label Shape: {s}".format(s=y_train.shape))
        print("Testing Label Shape: {s}".format(s=y_test.shape))

    model.fit(X_train, y_train, batch_size=options.batch_size, epochs=options.epochs, verbose=1, validation_split=options.validation_split)

    score = model.evaluate(X_test, y_test, verbose=0)
    print("Test Loss: ", score[0])
    print("Test Accuracy: ", score[1])
    
    test_predictions = model.predict(X_test)
    
    x_test_flat = X_test.reshape((10000, 28*28))
    partitioned_packets = []

    num_test_samples = 10000
	
    if num_test_samples > x_test_flat.shape[0]:
        num_test_samples = x_test_flat.shape[0]
    
    input_size = 256
    
    overlap = input_size - int((28*28 - input_size)/((options.layers-1)**2-1))
    
    for layer in range((options.layers-1)**2) :
        partitioned_packets.append(x_test_flat[:num_test_samples, (layer*(256-overlap)):(layer*(256-overlap)+256)])
    
    cores_sim = create_cores(model, options.layers - 1, neuron_reset_type=0) # Use absolute/hard reset
    packets_sim = create_packets(partitioned_packets)
    output_bus_sim = OutputBus((0, options.layers - 1), num_outputs=250)
        
    save("./mnist_config_.json", cores_sim, packets_sim, output_bus_sim, indent=2)
    np.save("./mnist_config_tf_preds.txt", test_predictions)
    np.save("./mnist_config_correct_preds.txt", y_test)
    
##################################################
def generate_network(options):
    topology = options.topology.split('_')
    neurons = options.neurons.split('_')
    inputs = options.inputs.split('_')
    
    for x in range(len(topology)):
        topology[x] = int(topology[x])
        neurons[x] = int(neurons[x])
        inputs[x] = int(inputs[x])

    if options.debug:
        print("Number of Network Layers: {n}".format(n=options.layers))
        print("Layer Topology: {t}".format(t=topology))
        print("Layer Inputs: {i}".format(i=inputs))
        print("Layer Neurons: {n}".format(n=neurons))

    layers = []

    if options.use_encoding:
        layers.append(Input(shape=(options.tick_rate, options.image_size)))
    else:
        layers.append(Input(shape=(options.image_size)))

    layers.append(Flatten()(layers[0]))

    overlap = int(((options.image_size) - (inputs[0]*topology[0])) / (-1*(topology[0]-1)))
    
    if options.debug:
        print("Overlap based on Image Size, 1st Layer Size, and 1st Layer Input Amount: {o}".format(o=overlap))
    
    layerOut = 0
    offset = 2

    # Iterate through all layers, but the last. The very last layer we'll do manually.
    for i in range(options.layers-1):
        if options.debug:
            print("\t\tLayer: {L}".format(L=i))
            print("\t\tLayers Length: {l}".format(l=len(layers)))
        # If the input layer:
        if i == 0:
            y = 0
            z = inputs[i]
            for x in range(topology[i]-1):
                layers.append(Lambda(lambda x : x[:, y:z])(layers[1]))
                layers[-1] = Tea(units=neurons[i])(layers[-1])
                y = z - overlap
                z = y + inputs[i]
            layers.append(Lambda(lambda x: x[:, options.image_size-inputs[i]:])(layers[1]))
            layers[-1] = Tea(units=neurons[i])(layers[-1])
            
            #for x in range(layer_topology[layer]):
                # Appened layers from just above
            #   layers[x+offset] = Tea(units=layer_neurons[layer])(layers[x+offset])
            
            layers.append(concatenate(layers[offset:]))
            layers.append(Dropout(options.dropout_rate)(layers[-1]))
            #layerOut = concatenate(layers[offset:])
            #dropout = Dropout(options.dropout_rate)(layerOut)
            offset = len(layers)

            if options.debug:
                print("\t\t\tNew Offset: {o}".format(o=offset))
        else:
            for q in range(topology[i]):
                layers.append(Lambda(lambda x : x[:,q:neurons[i-1]*topology[i-1]:topology[i-1]])(layers[offset-1]))
                layers[-1] = Tea(units=neurons[i])(layers[-1])
            
            #for q in range(layer_topology[layer]):
            #    layers[offset+q] = Tea(units=layer_neurons[layer])(layers[q+offset])

            layers.append(concatenate(layers[offset:]))
            layers.append(Dropout(options.dropout_rate)(layers[-1]))
            offset = len(layers)
            #layerOut = concatenate(layers[offset:])
            #dropout = Dropout(options.dropout_rate)(layerOut)
            #offset = offset + layer_topology[layer]
            
            if options.debug:
                print("\t\t\tNew Offset: {o}".format(o=offset))

    layers.append(Tea(units=neurons[-1])(layers[-1]))
    layers.append(AdditivePooling(options.classes)(layers[-1]))
    layers.append(Activation('softmax')(layers[-1]))

    if options.debug:
        print("\t\tLayers Length: {l}".format(l=len(layers)))

    return layers
##################################################
def parse_pass(options):
    if options.layers == 0:
        print("Specified network layers to be {l}. Require at least 1 layer.".format(l=options.layers))
        return False

    if options.topology == 'None':
        print("No Network Topology given")
        return False

    if options.inputs == 'None':
        print("No Network Input Sizes given")
        return False

    if options.neurons == 'None':
        print("No Neuron Designations given")
        return False

    if options.train_path == 'None':
        print("No Training Data designated")
        return False

    if options.test_path == 'None':
        print("No Testing Data designated")
        return False

    if options.image_size == 0:
        print("No image size designated")
        return False

    topology = options.topology.split("_")
    neurons = options.neurons.split("_")
    inputs = options.inputs.split("_")

    topology = len(topology)
    neurons = len(neurons)
    inputs = len(inputs)

    if topology != options.layers:
        print("Number of specified layers does not match given topology. Specified {l} Layers, but given Topology of {L} Layers.".format(l=options.layers, L = topology))
        return False

    if topology - neurons != 0:
        print("Neurons per layer does not match the number of layers. Given {li} Layer neurons and {l} Layers.".format(li=neurons, l=topology))
        return False

    if topology - inputs != 0:
        print("Inputs per layer does not match the number of layers. Given {li} Layer inputs and {l} Layers.".format(li=inputs, l=topology))
        return False

    if int(options.neurons.split('_')[-1]) % options.classes != 0:
        print("Number of designated classes does not factor into given number of Classification Layer Neurons. Given {c} Classes and {n} Classification Neurons.".format(c=options.classes, n=options.neurons.split('_')[-1]))
        return False

    return True
##################################################
def str2bool(s):
    if isinstance(s, bool):
        return s
    if s.lower() in ('yes', 'true', 't', 'y', '1'):
        return True
    elif s.lower() in ('no', 'false', 'n', 'f', '0'):
        return False
    else:
        raise argparse.ArgumentTypeError("Boolean value expected.")
##################################################
if __name__ == "__main__":

    # Define the arguments for Command Line Use
    parser = argparse.ArgumentParser()
    parser.add_argument('-layers', '-l', metavar='INT', default=0, type=int, help="Number of Network Layers.")
    parser.add_argument('-topology', '-top', metavar='STRING', default='None', type=str, help='Network Topology gives as Layer_Layer_Layer_...etc. Example: 16_8_4_2_1 for a network with an input layer of 16 cores, then a layer of 8 cores, then a layer of 4 cores, a layer of 2 cores and then finally a classification layer of 1 core.')
    parser.add_argument('-inputs', '-in', metavar='STRING', default='None', type=str, help='Input size for each layer. Example: 256_256_256_256_256 for a network where for each layer each core has 256 inputs.')
    parser.add_argument('-neurons', '-n', metavar='STRING', default='None', type=str, help='The number of neurons for each layer. Example: 128_128_128_128_256 for a network of 128 neurons for each layer except the classification layer which uses all 256 neurons.')
    parser.add_argument('-classes', '-c', metavar='INT', default=10, type=int, help='The number of classes to be classified.')
    parser.add_argument('-use_encoding', '-usE', metavar="BOOL", type=str2bool, default=True, help='Use encoding schemes? True or False. Default: True')
    parser.add_argument('-encoding_scheme', '-enc', metavar='STRING', default='Rate', type=str, help='Type of encoding to use. Rate, Burst or Time.', choices=['Rate', 'Burst', 'Time', 'rate', 'burst', 'time', 'r', 'b', 't', 'R', 'B', 'T'])
    parser.add_argument('-spike_train', '-spkt', metavar='STRING', default='Forward', type=str, help='What type of spike train to generate, forward or reverse?', choices=['Forward', 'forward', 'f', 'r', 'reverse', 'Reverse', 'F', 'R'])
    parser.add_argument('-train_path', '-train', metavar='STRING', default='None', type=str, help='Path to the training data')
    parser.add_argument('-test_path', '-test', metavar='STRING', default='None', type=str, help='Path to the testing data')
    parser.add_argument('-image_size', '-im', metavar='INT', default=0, type=int, help='Image Size as a 1D value. Ex: a 32x32 image would be 1024')
    parser.add_argument('-dropout_rate', '-drop', metavar='FLOAT', default=0.0, type=float, help='Dropout percentage rate')
    parser.add_argument('-tick_rate', '-ticks', metavar='INT', type=int, default=16, help='Number of ticks to encode information with')
    parser.add_argument('-debug', '-dbg', metavar="BOOL", type=str2bool, default=True, help='Debug on or off? True or False. Default: True')
    parser.add_argument('-batch_size', '-batch', metavar="INT", type=int, default=32, help="Batch size for model training. Default: 32")
    parser.add_argument('-epochs', metavar="INT", type=int, default=200, help="Number of training epochs for model training. Default: 200")
    parser.add_argument('-validation_split', '-val', metavar="FLOAT", default=0.20, type=float, help="Validation Split percentage for model training. Default: 0.20")
    # Collect Options by parging the arguments
    options = parser.parse_args()

    # Check the collected options. If all good, run the program.
    # Else, print some error notices and don't run the program.
    if parse_pass(options):
        run(options)

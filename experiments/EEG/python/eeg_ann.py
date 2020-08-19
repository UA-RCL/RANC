from PIL import Image
from mpl_toolkits.mplot3d import Axes3D
import h5py
import itertools
import numpy as np
import keras
from sklearn.model_selection import train_test_split
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from tealayers import Tea, AdditivePooling
import click
from rancutils.simulator import simulator_conversion
from rancutils.tealearning import create_cores, create_packets, tea_weight_initializer, ConnectionHistory
from rancutils.hardware import hardware_conversion
from keras.models import Model
import tensorflow as tf
import math


def one_hot_decode(data):
	'''
	Returns the label of a one-hot encoded vector

	Arguments:
	data - numpy array of a one-hot encoded label.
	'''
	return np.argmax(data)


def plot_history(history, filename='accuracies.png', title = 'Accuracy vs. Epoch'):
	'''
	Creates a plot of the training accuracy from a history object from a training
	session

	Arguments:
	history - A history object which contains the training accuracy.

	Keyword Arguments:
	filename - The path of the image to be saved to
	'''

	plt.figure()
	plt.plot(history.history['acc'])
	plt.plot(history.history['val_acc'])
	plt.title(title)
	plt.ylabel('Accuracy')
	plt.xlabel('Epoch')
	plt.legend(['Training'], loc='lower right')
	plt.legend(['Training', 'Validation'], loc='lower right')
	plt.savefig(filename)



def print_data_stats(x_train, x_test, y_train, y_test, image_shape, create_image_plot = False, create_stem_plot = False):
	'''
	Prints statistics about the data and creates figures of the images, stem plots of the
	data, and three dimensional plots of the reduced data using both PCA and tSNE

	Arguments:
	x_train - Training data
	x_test - Testing data
	y_train - Training labels
	y_test - Testing labels
	image_shape - The shape of the images

	Keyword Arguments:
	create_image_plot - Whether to create the figures of the images
	create_stem_plot - Whether to create the figures of the stem plots
	'''

	print("x_train shape: {}".format(x_train.shape))
	print("x_test shape: {}".format(x_test.shape))
	print("y_train shape: {}".format(y_train.shape))
	print("y_test shape: {}".format(y_test.shape))

	'''
	Finding and printing the number of images for each label
	'''
	class_count = [0] * 3
	for test_iter, train_iter in itertools.zip_longest(y_test, y_train):
		if not (test_iter is None):
			class_count[one_hot_decode(test_iter)] += 1
		if not (train_iter is None):
			class_count[one_hot_decode(train_iter)] += 1

	print("Train number of class 0: {}".format(class_count[0]))
	print("Train number of class 1: {}".format(class_count[1]))
	print("Train number of class 2: {}".format(class_count[2]))

	'''
	Will create the plots used to visualize the data
	'''
	if create_image_plot:
		plot_images(x_train, y_train, image_shape = image_shape)
	if create_stem_plot:
		create_stem_plots(x_train, y_train, image_shape = image_shape)


def create_stem_plots(x, y, n_samples_per_class = 4, image_shape = (46, 100), base_filename = "class_stem_plots"):
	'''
	Will create a figure for every class which contains n_samples_per_class stemplots to
	show how the data varies.

	Arguments:
	x - Data
	y - Labels

	Keyword Arguments:
	n_samples_per_class - The number of the stem plots to create in a figure
	image_shape - The shape of the image
	base_filename - The base file name. When creating the file the label will be appended to the file name
	'''

	if n_samples_per_class % 2 != 0:
		print("create_stem_plots: only can do even samples per class :(. Exiting")
		exit(1)

	if image_shape[0] * image_shape[1] != x.shape[1]:
		print("create_stem_plots: dimension mismatch between image_shape ({}) and data ({}). Exiting".format(image_shape, x.shape[1]))
		exit(1)

	'''
	Iterates over the number of classes
	'''
	for i in range(y.shape[1]):
		'''
		Creating a figure object which will contain all of the subplots
		'''
		fig, axs = plt.subplots((int)(n_samples_per_class / 2), (int)(n_samples_per_class / 2), sharex = True, sharey = True)
		'''
		Getting all of the data of the class that we are on
		'''
		class_data = np.array([x_iter for x_iter, y_iter in zip(x, y) if one_hot_decode(y_iter) == i])
		'''
		Iterate through the number of images we want to create and create a stem plot for each one
		'''
		for j in range(n_samples_per_class):
			axs[(int)(j % (n_samples_per_class / 2)), (int)(j // (n_samples_per_class / 2))].stem(class_data[j, :].flatten())

		fig.suptitle("First {} images from class {}".format(n_samples_per_class, i))
		fig.savefig("{}_{}.png".format(base_filename, i))


def plot_images(x, y, n_samples_per_class = 4, image_shape = (46, 100), base_filename = "class_images"):
	'''
	Will create a figure for every class to and plot n_samples_per_class number of images on the figure.
	This is just to see what the data looks like.

	Arguments:
	x - Data
	y - Labels

	Keyword Arguments:
	n_samples_per_class - The number of the stem plots to create in a figure
	image_shape - The shape of the image
	base_filename - The base file name. When creating the file the label will be appended to the file name
	'''
	if n_samples_per_class % 2 != 0:
		print("plot_images: only can do even samples per class :(. Exiting")
		exit(1)

	if image_shape[0] * image_shape[1] != x.shape[1]:
		print("plot_images: dimension mismatch between image_shape ({}) and data ({}). Exiting".format(image_shape, x.shape[1]))
		exit(1)

	'''
	Iterates over the number of classes
	'''
	for i in range(y.shape[1]):
		'''
		Creating a figure object which will contain all of the subplots
		'''
		fig, axs = plt.subplots((int)(n_samples_per_class / 2), (int)(n_samples_per_class / 2), sharex = True, sharey = True)
		'''
		Getting all of the data of the class that we are on
		'''
		class_data = np.array([x_iter for x_iter, y_iter in zip(x, y) if one_hot_decode(y_iter) == i])
		'''
		Iterate through the number of images we want to create and create a stem plot for each one
		'''
		for j in range(n_samples_per_class):
			axs[(int)(j % (n_samples_per_class / 2)), (int)(j // (n_samples_per_class / 2))].imshow(class_data[j, :].reshape(image_shape), cmap = 'gray')

		fig.suptitle("First {} images from class {}".format(n_samples_per_class, i))
		fig.savefig("{}_{}.png".format(base_filename, i))



def one_d_conv_network(num_outputs = 3, input_shape = (46, 100)):
	'''
	Will return a one-dimensional convolutional network.

	Keyword Arguments:
	num_outputs - The number of neurons in the output layer
	input_shape - The shape of the input data
	'''
	model = keras.models.Sequential()
	model.add(keras.layers.Reshape(input_shape, input_shape=(input_shape[0] * input_shape[1],)))
	model.add(keras.layers.Conv1D(32, kernel_size=(5), strides=(1), activation='relu'))
	model.add(keras.layers.Flatten())
	model.add(keras.layers.Dense(units = 100, activation='tanh'))
	model.add(keras.layers.Dense(units = num_outputs, activation='softmax'))


	model.compile(loss = 'categorical_crossentropy',
		optimizer='adam',
		metrics=['accuracy'])

	return model


def two_d_conv_network(num_outputs = 3, input_shape = (46, 100, 1)):
	'''
	Will return a two-dimensional convolutional network

	Keyword Arguments:
	num_outputs - The number of neurons in the output layer
	input_shape - The shape of the input data
	'''
	model = keras.models.Sequential()
	model.add(keras.layers.Reshape(input_shape, input_shape=(input_shape[0] * input_shape[1] * input_shape[2],)))
	model.add(keras.layers.Conv2D(40, kernel_size=(5, 5), strides=(1, 1), activation='sigmoid'))
	model.add(keras.layers.MaxPooling2D(pool_size=(2, 2), strides=(2, 2)))
	model.add(keras.layers.Conv2D(100, kernel_size=(5, 5), strides=(1, 1), activation='sigmoid'))
	model.add(keras.layers.MaxPooling2D(pool_size=(2, 2), strides=(2, 2)))
	model.add(keras.layers.Flatten())
	model.add(keras.layers.Dense(units = 500, activation='sigmoid'))
	model.add(keras.layers.Dense(units = num_outputs, activation='softmax'))

	model.compile(loss = 'categorical_crossentropy',
		optimizer='adam',
		metrics=['accuracy'])

	return model


def fc_network(num_outputs = 3, input_shape = 4600):
	'''
	Will return a fully-connected network

	Keyword Arguments:
	num_outputs - The number of neurons in the output layer
	input_shape - The shape of the input data
	'''
	model = keras.models.Sequential()
	model.add(keras.layers.Dense(units = 128, activation='relu', input_dim = input_shape))
	model.add(keras.layers.Dense(units = num_outputs, activation='softmax'))

	model.compile(loss = 'categorical_crossentropy',
		optimizer=keras.optimizers.Adam(lr=0.001),
		metrics=['accuracy'])

	return model


def eeg_tea_network(num_outputs = 3, use_additive_pooling_processing = False):
	'''
	Will return a RANC compatable network trained using tea learning.

	Keyword Arguments:
	num_outputs: The number of neurons in the output layer
	'''
	model = keras.models.Sequential()

	model.add(Tea([64] * 16, [16, 16], [12, 12], activation = 'sigmoid'))
	model.add(Tea([64] * 4, 256, 256, activation = 'sigmoid'))
	model.add(Tea([(256 // num_outputs) * num_outputs], 256, 256, activation = 'sigmoid'))
	model.add(AdditivePooling(num_outputs, use_additive_pooling_processing = use_additive_pooling_processing, additive_pooling_processing_max = 128))
	model.add(keras.layers.Activation('softmax'))

	model.compile(loss = 'categorical_crossentropy',
		optimizer='adam', 
		metrics=['accuracy'])

	return model


def mnist_tea_network(num_outputs = 10, use_additive_pooling_processing = False):
	'''
	Will return a RANC compatable network trained using tea learning for the MNIST dataset.

	Keyword Arguments:
	num_outputs: The number of neurons in the output layer
	'''
	model = keras.models.Sequential()
	model.add(Tea([64, 64, 64, 64], [16, 16], [12, 12], activation = 'sigmoid'))
	model.add(Tea([(256 // num_outputs) * num_outputs], 256, 256, activation = 'sigmoid'))
	model.add(AdditivePooling(num_outputs, use_additive_pooling_processing = use_additive_pooling_processing, additive_pooling_processing_max = 25))
	model.add(keras.layers.Activation('softmax'))

	model.compile(loss = 'categorical_crossentropy',
		optimizer='adam', 
		metrics=['accuracy'])

	return model


def get_models(input_shape, num_outputs = 3, use_mnist = False, use_additive_pooling_processing = False, test_other_networks = False):
	'''
	Returns a dictionary containing the name and objects of all the models used on the data.

	Arguments:
	input_shape - The shape of the input

	Keyword Arguments:
	num_outputs - The number of neurons in the output layer
	use_mnist - Whether to create the mnist or eeg network
	'''
	if use_mnist:
		tea_network = mnist_tea_network(num_outputs = num_outputs, use_additive_pooling_processing = use_additive_pooling_processing)
	else:
		tea_network = eeg_tea_network(num_outputs = num_outputs, use_additive_pooling_processing = use_additive_pooling_processing)

	if test_other_networks:
		return {
			'tea_network': tea_network,
			'fc': fc_network(num_outputs = num_outputs, input_shape = input_shape[0] * input_shape[1]),
			'1d_conv': one_d_conv_network(num_outputs = num_outputs, input_shape = input_shape),
			'2d_conv': two_d_conv_network(num_outputs = num_outputs, input_shape = (input_shape[0], input_shape[1], 1))
		}
	else:
		return {
			'tea_network': tea_network
		}

# Taken from: Naureen Ghani "Neural coding":
# http://www.columbia.edu/cu/appliedneuroshp/Fall2017/neuralcoding.pdf
'''
TODO: Don't think this will work with the stochasticity, will need to rethink this. Just leaving it here for now.
'''
def poisson_spike_gen(fr, dt, t_sim):
	'''
	Generates a numpy array which represnts a poisson spike train. This spike train
	represents t_sim seconds where dt is a single time step. Another way to think
	about this is that t_sim / dt is the number of bins that we are using.
	'''
	n_bins = math.floor(t_sim / dt)
	return np.random.rand(n_bins) < fr * dt

'''
TODO: Don't think this will work with the stochasticity, will need to rethink this. Just leaving it here for now.
'''
def ranc_encode_poisson_spike_train(original_data, t_sim, dt=0.01, positive_strategy = 'exponential'):
	'''
	Returns data encoded compatable for RANC using a poisson spike train. It first moves all of the data to be positive.
	It then uses each pixel as a frequency to encode a Poisson spike train.

	Arguments:
	original_data - The data to be converted.
	t_sim - The amount of time that the input is applied to the network.

	Keyword Arguments:
	dt - The duration of a discrete time step. (Default: 0.001)
	positive_strategy - determines how we make all of the pixels positive. Options are 'exponential' or 'shift'. Default: 'exponential'
	'''

	'''
	Creating a new numpy array which will contain the encoded data
	'''
	if len(original_data.shape) != 2:
		print("ranc_encode_poisson_spike_train: Data must have a dimension of 2. Given dimension of {}. Exiting".format(original_data.shape))
		exit(1)

	encoded_data = np.zeros((original_data.shape[0], math.floor(t_sim / dt), original_data.shape[1]))

	'''
	Will iterate through every sample and make it positive
	'''
	for i in range(original_data.shape[0]):
		'''
		Using the min value to move every value to be non-negative, and then using the
		max value to normalize all data from 0 - 1
		'''
		if positive_strategy == 'shift':
			min_val = np.min(original_data[i, :])
			if min_val > 0:
				min_val = 0
			encoded_data[i, :] = original_data[i, :] - min_val
		elif positive_strategy == 'exponential':
			encoded_data[i, :] = np.exp(original_data[i, :] / 5)

	'''
	Will itereate through every pixel of every sample and create a poisson spike train.
	'''
	for i in range(original_data.shape[0]):
		for j in range(original_data.shape[1]):
			encoded_data[i, :, j] = poisson_spike_gen(encoded_data[i, 0, j], dt, t_sim)

	# TODO: Have the input shape get passed in as a parameter
	encoded_data = encoded_data.reshape(encoded_data.shape[0], math.floor(t_sim/dt), 46, 46)
	return encoded_data


def generate_rate_burst_code(pixel, num_bins):
	ranges = np.linspace(0, 1, num_bins + 2)
	num_spikes = np.sum(ranges[1:-1] < pixel)
	return [1]*num_spikes + [0]*(num_bins-num_spikes)


def positivify_data(original_data, n_bins):
	positive_data = np.zeros((original_data.shape[0], n_bins, original_data.shape[1]))

	'''
	Will iterate through every sample and make it positive
	'''
	for i in range(original_data.shape[0]):
		'''
		Using the min value to move every value to be non-negative, and then using the
		max value to normalize all data from 0 - 1
		'''
		min_val = np.min(original_data[i, :])
		if min_val > 0:
			min_val = 0
		max_val = np.max(original_data[i, :])
		positive_data[i, :] = (original_data[i, :] - min_val) / (max_val - min_val)
	
	return positive_data


def ranc_encode_burst_rate(original_data, n_bins, input_shape):
	'''
	Creating a new numpy array which will contain the encoded data
	'''
	if len(original_data.shape) != 2:
		print("ranc_encode_burst_rate: Data must have a dimension of 2. Given dimension of {}. Exiting".format(original_data.shape))
		exit(1)

	encoded_data = positivify_data(original_data, n_bins)

	'''
	Will itereate through every pixel of every sample and create a spike train.
	'''
	for i in range(original_data.shape[0]):
		for j in range(original_data.shape[1]):
			encoded_data[i, :, j] = generate_rate_burst_code(encoded_data[i, 0, j], n_bins)

	encoded_data = encoded_data.reshape(encoded_data.shape[0], n_bins, input_shape[0], input_shape[1])
	return encoded_data


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


def output_for_hardware(model, x_test, num_layers, labels, image_shape, increment_tick = False):
    connections, biases = get_connections_and_biases(model, num_layers)

    weights = []
    for layer in connections:
        w = []
        for partition in layer:
            w.append(tea_weight_initializer(partition.shape))
        weights.append(w)

    for layer_num, (layer_biases, layer_connections) in enumerate(zip(biases, connections)):
        for partition_num, (partition_biases, partition_connections) in enumerate(zip(layer_biases, layer_connections)):
            biases[layer_num][partition_num] = np.round(partition_biases).astype(int)
            connections[layer_num][partition_num] = np.clip(np.round(partition_connections), 0, 1).astype(int)

    cores = create_cores(connections, weights, biases, num_classes = 2)
    packets = create_packets(x_test, [16, 16], [12, 12], 1, image_shape, increment_tick = increment_tick)
    hardware_conversion(cores, packets=packets, labels=labels, create_binary_file = True)


def output_for_simulator(model, x_test, num_layers, labels, image_shape):
    connections, biases = get_connections_and_biases(model, num_layers)

    weights = []
    for layer in connections:
        w = []
        for partition in layer:
            w.append(tea_weight_initializer(partition.shape))
        weights.append(w)

    for layer_num, (layer_biases, layer_connections) in enumerate(zip(biases, connections)):
        for partition_num, (partition_biases, partition_connections) in enumerate(zip(layer_biases, layer_connections)):
            biases[layer_num][partition_num] = np.round(partition_biases).astype(int)
            connections[layer_num][partition_num] = np.clip(np.round(partition_connections), 0, 1).astype(int)

    cores = create_cores(connections, weights, biases)
    packets = create_packets(x_test, [16, 16], [12, 12], 1, image_shape)
    simulator_conversion(cores, packets=packets, labels=labels)


def get_eeg_data(file_path, patient_id):
	arrays = {}
	with h5py.File(file_path, 'r') as f:
		for k, v in f.items():
			arrays[k] = np.array(v)
	try:
		x = arrays['data_epochs_{}'.format(patient_id)]
		y = arrays['data_key_{}'.format(patient_id)] - 1
	except KeyError:
		print("{} is incorrectly formated. Check to see if the data is named correctly.".format(file_path))
		exit(1)
	
	return x, y

def rm_no_movement_class(x, y):
	mov_indx = np.where(y != 0)[0]
	x = x[mov_indx] - 1
	y = y[mov_indx] - 1
	
	return x, y


def resize_data_bilinear(x, input_shape):
	'''
	Iterates through every image, reshapes it to 46x100
	and then resize using bilinear interpolation to
	46x46 and then flattens the image again
	'''
	resized_x = np.zeros((x.shape[0], input_shape[0] * input_shape[1]))
	for i in range(x.shape[0]):
		two_d_arr = x[i, :].reshape(46, 100)
		im = Image.fromarray(two_d_arr)
		im = im.resize(input_shape, resample = Image.BILINEAR)
		resized_x[i, :] = np.array(im).reshape((input_shape[0] * input_shape[1]))
	
	return resized_x


def plot_channel_data(x, encoded_x, input_shape, path = 'images/'):

	plt.figure()
	plt.imshow(x[0, :].reshape(input_shape), cmap = 'gray')
	plt.savefig(path + "first_image.png")
	plt.close()

	total_channel_data = np.zeros((encoded_x.shape[2], encoded_x.shape[3]))
	for i in range(encoded_x.shape[1]):
		plt.figure()
		plt.imshow(encoded_x[0, i, :, :], cmap='gray')
		plt.savefig(path + "first_image_channel_{}.png".format(i))
		plt.close()

		total_channel_data = total_channel_data + encoded_x[0, i, :, :]

	plt.figure()
	plt.imshow(total_channel_data, cmap = 'gray')
	plt.savefig(path + "first_image_total_channel_data.png")
	plt.close()


'''
Creating command line arguments.
'''
@click.command()
@click.option('--patient_id', default = 'D', help = 'The ID of the patient analyzed (Default: D)')
@click.option('--num_epochs', default = 100, help = 'The number of epochs used to train the networks (Default: 100)')
@click.option('--rm_no_movement', default = False, help = 'Will remove data with no movement', is_flag = True)
@click.option('--resize_data', default = False, help = 'Will resize data from 46x100 to 46x46', is_flag = True)
@click.option('--print_stats', default = False, help = 'Will print statistics and create figures about data', is_flag = True)
@click.option('--encoding', default = 'br', help = 'The type of encoding to use. Options: p = poisson, burst-rate = br (Default: br)')
@click.option('--n_bins', default = 1, help = 'The number of bins when using burst-rate encoding (Default: 1)')
@click.option('--random_seed', default = -1, help = 'What to set the seed the numpy and tensorflow seed to. If set to -1 will not set the seed. (Default: -1)')
@click.option('--output_for_sim', default = False, help = 'Whether to output config files for the simulator', is_flag = True)
@click.option('--output_for_hw', default = False, help = 'Whether to output config files for the hardware', is_flag = True)
@click.option('--use_mnist', default = False, help = 'Whether to use MNIST data rather than EEG data. Used to verify with results we already have', is_flag = True)
@click.option('--use_additive_pooling_processing', default = False, help = 'Whether to add an additive_pooling_processing layer after the additive_pooling layer.', is_flag = True)
@click.option('--use_callbacks', default = False, help = 'Whether to use callbacks for tensorboard and connection image generation.', is_flag = True)
@click.option('--test_other_networks', default = False, help = 'Tests three conventional neural networks on the data.', is_flag = True)
def main(patient_id, num_epochs, rm_no_movement, resize_data, print_stats, encoding, n_bins, random_seed, output_for_sim, output_for_hw, use_mnist, use_additive_pooling_processing, use_callbacks, test_other_networks):

	if random_seed != -1:
		tf.set_random_seed(random_seed)
		np.random.seed(random_seed)

	if use_mnist:
		(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()
		x_train = x_train.astype('float32')
		x_test = x_test.astype('float32')
		x_train /= 255
		x_test /= 255
		x_train = np.array(x_train).reshape(len(x_train), 784)
		x_test = np.array(x_test).reshape(len(x_test), 784)
		num_outputs = 10
		input_shape = (28, 28)
	else:
		'''
		Reads the participant's data
		'''
		file_path = '../data/EEG_Participant{}.mat'.format(patient_id)
		x, y = get_eeg_data(file_path, patient_id)

		'''
		If user passes --rm_no_movement flag, remove all data where there is no movement (class 0).
		Also, need to keep track of the number of outputs so we can use that information to 
		define the output layers of the networks.
		'''
		if rm_no_movement:
			num_outputs = 2
			x, y = rm_no_movement_class(x, y)
		else:
			num_outputs = 3

		'''
		If user passes --resize_data flag, resize the data from 46x100 -> 46x46. Also
		need to keep track of the shape of the input so we can use that information
		to define the input shape of the networks. For the teanetwork we have to 
		resize the data.
		'''
		if resize_data:
			input_shape = (46, 46)
			x = resize_data_bilinear(x, input_shape)
		else:
			input_shape = (46, 100)

		'''
		Splits the training and testing data with a similar size used by Yepes et al.
		'''
		x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.145, shuffle = True)
	
	'''
	Need to keep track of the labels prior to one hot encoding when we put the network on the simulator
	'''
	labels = [int(label) for label in y_test]

	'''
	One-hot encode the labels
	'''
	y_train = keras.utils.to_categorical(y_train, num_outputs)
	y_test = keras.utils.to_categorical(y_test, num_outputs)

	'''
	If user passes --print_stats flags, print the stats of the data
	'''
	if print_stats:
		print_data_stats(x_train, x_test, y_train, y_test, input_shape, create_image_plot = True, create_stem_plot = False)

	'''
	Getting all of the models we are going to use
	'''
	models = get_models(input_shape, num_outputs = num_outputs, use_mnist = use_mnist, use_additive_pooling_processing = use_additive_pooling_processing, test_other_networks = test_other_networks)

	'''
	Iterate through every model and train/test on the data
	'''
	for model_name, model in models.items():
		print("Training {}".format(model_name))
		if 'tea' in model_name:
			if encoding == 'p':
				train_data = ranc_encode_poisson_spike_train(x_train, 0.64)
				test_data = ranc_encode_poisson_spike_train(x_test, 0.64)
			elif encoding == 'br':
				print("Encoding data using burst-rate encoding...")
				train_data = ranc_encode_burst_rate(x_train, n_bins, input_shape)
				test_data = ranc_encode_burst_rate(x_test, n_bins, input_shape)
				print("Done.")
				plot_channel_data(x_test, test_data, input_shape)
			else:
				print("Unknown encoding method given. Exiting")
				exit(1)
		else:
			train_data = x_train
			test_data = x_test

		callbacks = []
		cb = ConnectionHistory([(0, 0), (1, 0), (2, 0)], 'connections/', round_connections = True, make_gif = True)
		tensorboard = keras.callbacks.TensorBoard(log_dir = './logs', histogram_freq = 10, write_grads = True, write_images = True)
		if use_callbacks and ('tea' in model_name) and (not use_mnist):
			callbacks = [cb, tensorboard]
		else:
			callbacks = []
		history = model.fit(train_data, y_train, epochs=num_epochs, batch_size=32, verbose = 1, validation_data=(test_data, y_test), callbacks = callbacks)
		_, test_accuracy = model.evaluate(test_data, y_test)

		plot_history(history, filename = '{}_patient_{}.png'.format(model_name, patient_id), title = "Testing Accuracy: {}".format(test_accuracy))
		print("Testing accuracy: {}".format(test_accuracy))

	'''
	Taking the tea learning model and creating the configuration files for the simulator
	'''
	if output_for_sim:
		print("Creating simulator files...")
		output_for_simulator(
			models['tea_network'],
			ranc_encode_burst_rate(x_test, n_bins, input_shape),
			3,
			labels,
			input_shape
		)
		print("Done.")


	if output_for_hw:
		print("Creating hardware files...")
		output_for_hardware(
			models['tea_network'],
			ranc_encode_burst_rate(x_test, n_bins, input_shape),
			3,
			labels,
			input_shape,
			increment_tick = True
		)
		print("Done.")


if __name__ == '__main__':
	main()

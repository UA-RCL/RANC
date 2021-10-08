from tealayer2 import Tea, AdditivePooling
from tensorflow.keras.layers import Flatten, Activation, Input, Lambda, concatenate
from tensorflow.keras.datasets import mnist
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.utils import to_categorical
from tensorflow.keras import Model
import numpy as np
import argparse
import tensorflow as tf

def train_model(config_num, save_dest, num_epochs, num_test_samples):
    (x_train, y_train), (x_test, y_test) = mnist.load_data()
    x_train = x_train.astype('float32')
    x_test = x_test.astype('float32')
    x_train /= 255
    x_test /= 255
                        
    y_train = to_categorical(y_train, 10)
    y_test = to_categorical(y_test, 10)

    inputs = Input(shape=(28,28,1))

    flattened_inputs = Flatten()(inputs)

    if config_num == 1:
        # Default from Spencer's example.py
        # Also from Experiments -> neuron_axon_sweep -> 256.py
        core0 = Lambda(lambda x : x[:, :256])(flattened_inputs)
        core1 = Lambda(lambda x : x[:, 176:432])(flattened_inputs)
        core2 = Lambda(lambda x : x[:, 352:608])(flattened_inputs)
        core3 = Lambda(lambda x : x[:, 528:])(flattened_inputs)

        core0 = Tea(units=64, name='tea_1_1')(core0)
        core1 = Tea(units=64, name='tea_1_2')(core1)
        core2 = Tea(units=64, name='tea_1_3')(core2)
        core3 = Tea(units=64, name='tea_1_4')(core3)

        network = concatenate([core0, core1, core2, core3])

        network = Tea(units=250, name='tea_2')(network)
    elif config_num == 2:
        # Configuration from Experiments -> neuron_axon_sweep -> 128.py
        strided_inputs = []
        input_layers = []
        for i in range(8):
            strided_inputs.append(
                Lambda(lambda x: x[:, 82*i:82*i+128])(flattened_inputs))
            input_layers.append(Tea(units=32, name=f"tea_1_{i}")(strided_inputs[i]))

        x0 = concatenate(input_layers[:4])
        x1 = concatenate(input_layers[4:])
        x0 = Tea(units=64, name='tea_2_1')(x0)
        x1 = Tea(units=64, name='tea_2_2')(x1)
        network = concatenate([x0, x1])
        network = Tea(units=120, name='tea_3')(network)
    elif config_num == 3:
        # Configuration from Experiments -> neuron_axon_sweep -> 128axons512neurons.py
        strided_inputs = []
        input_layers = []
        for i in range(8):
            strided_inputs.append(
                Lambda(lambda x: x[:, 82*i:82*i+128])(flattened_inputs))
            input_layers.append(Tea(units=32, name=f"tea_1_{i}")(strided_inputs[i]))

        x0 = concatenate(input_layers[:4])
        x1 = concatenate(input_layers[4:])
        x0 = Tea(units=510, name="tea_2_1")(x0)
        x1 = Tea(units=510, name="tea_2_2")(x1)
        network = concatenate([x0, x1])
    elif config_num == 4:
        # Configuration from Experiments -> neuron_axon_sweep -> 512.py
        x0 = Lambda(lambda x: x[:, :512])(flattened_inputs)
        x1 = Lambda(lambda x: x[:, 272:])(flattened_inputs)
        x0 = Tea(units=256, name="tea_1_1")(x0)
        x1 = Tea(units=256, name="tea_1_2")(x1)
        # Concatenate output of first layer to send into next
        network = concatenate([x0, x1])
        network = Tea(units=510, name="tea_2")(network)
    elif config_num == 5:
        x0 = Lambda(lambda x : x[:,:512])(flattened_inputs)
        x1 = Lambda(lambda x : x[:,272:])(flattened_inputs)
        x0 = Tea(units=128, name="tea_1_1")(x0)
        x1 = Tea(units=128, name="tea_1_2")(x1)
        # Concatenate output of first layer to send into next
        network = concatenate([x0, x1])
        network = Tea(units=120, name="tea_2")(network)
    else:
        print("Unrecognized config number! Saw: {}".format(config_num))
        return

    network = AdditivePooling(10)(network)

    predictions = Activation('softmax')(network)

    model = Model(inputs=inputs, outputs=predictions)

    model.compile(loss='categorical_crossentropy', optimizer=Adam(), metrics=['accuracy'])

    x_train = x_train.reshape(-1, 28, 28, 1)
    x_test = x_test.reshape(-1, 28, 28, 1)

    model.fit(x_train, y_train, batch_size=128, epochs=num_epochs, verbose=1, validation_split=0.2)

    score = model.evaluate(x_test, y_test, verbose=0)

    test_predictions = model.predict(x_test)

    print("Test Loss: ", score[0])
    print("Test Accuracy: ", score[1])

    #tf.keras.models.save_model(model, save_dest + "/model_{}.hdf5".format(config_num), save_format='h5')
    from rancutils.teaconversion import create_cores, create_packets, Packet
    from rancutils.output_bus import OutputBus
    from rancutils.serialization import save

    x_test_flat = x_test.reshape((10000, 784))
    partitioned_packets = []

    if num_test_samples > x_test_flat.shape[0]:
        num_test_samples = x_test_flat.shape[0]

    if config_num == 1:
        cores_sim = create_cores(model, 2, neuron_reset_type=0) # Use absolute/hard reset
        partitioned_packets.append(x_test_flat[:num_test_samples, :256])
        partitioned_packets.append(x_test_flat[:num_test_samples, 176:432])
        partitioned_packets.append(x_test_flat[:num_test_samples, 352:608])
        partitioned_packets.append(x_test_flat[:num_test_samples, 528:])
        packets_sim = create_packets(partitioned_packets)
        output_bus_sim = OutputBus((0, 2), num_outputs=250)

    elif config_num == 2:
        cores_sim = create_cores(model, 3, neuron_reset_type=0) # Use absolute/hard reset
        for i in range(8):
            partitioned_packets.append(x_test_flat[:num_test_samples, 82*i:82*i+128])
        packets_sim = create_packets(partitioned_packets)
        output_bus_sim = OutputBus((0, 3), num_outputs=120)

    elif config_num == 3:
        cores_sim = create_cores(model, 2, neuron_reset_type=0) # Use absolute/hard reset
        for i in range(8):
            partitioned_packets.append(x_test_flat[:num_test_samples, 82*i:82*i+128])
        packets_sim = create_packets(partitioned_packets)
        output_bus_sim = OutputBus((0, 2), num_outputs=1020)

    elif config_num == 4:
        cores_sim = create_cores(model, 2, neuron_reset_type=0) # Use absolute/hard reset
        partitioned_packets.append(x_test_flat[:num_test_samples, :512])
        partitioned_packets.append(x_test_flat[:num_test_samples, 272:])
        packets_sim = create_packets(partitioned_packets)
        output_bus_sim = OutputBus((0, 2), num_outputs=510)

    elif config_num == 5:
        cores_sim = create_cores(model, 2, neuron_reset_type=0) # Use absolute/hard reset
        partitioned_packets.append(x_test_flat[:num_test_samples, :512])
        partitioned_packets.append(x_test_flat[:num_test_samples, 272:])
        packets_sim = create_packets(partitioned_packets)
        output_bus_sim = OutputBus((0, 2), num_outputs=120)

    save(f"{save_dest}/mnist_config_{config_num}.json", cores_sim, packets_sim, output_bus_sim, indent=2)
    np.save(f"{save_dest}/mnist_config_{config_num}_tf_preds.txt", test_predictions)
    np.save(f"{save_dest}/mnist_config_{config_num}_correct_preds.txt", y_test)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Train an MNIST model")
    parser.add_argument('config_num', type=int, help="Which configuration to train")
    parser.add_argument('save_dest', type=str, help="Where to save the output model")
    parser.add_argument('--num_epochs', dest='num_epochs', type=int, required=False, 
                        default=10, help="Number of epochs to run while training")
    parser.add_argument('--num_test_samples', dest='num_test_samples', type=int, required=False,
                        default=100, help="Number of testing samples to include in generated simulator output")
    args = parser.parse_args()

    train_model(args.config_num, args.save_dest, args.num_epochs, args.num_test_samples)

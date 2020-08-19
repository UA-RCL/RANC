"""Contains the code for a tea layer for use in TeaLearning."""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import tensorflow as tf
import numpy as np
from keras import backend as K
from keras.engine.topology import Layer
from keras import activations
from keras import initializers
from keras import regularizers
from keras import constraints

@tf.RegisterGradient("CustomRound")
def _const_round_grad(unused_op, grad):
    """Connections are rounded during the feedforward, so the round funciton
    needs a gradient defined. The gradient is just defined as "1" so as to not
    have an effect on the backpropogation."""
    return grad

class Tea(Layer):
    """An implementation of a layer to be used for IBM's TeaLearning training
    method used for deployment onto RANC and RANC-emulations of TrueNorth. 
    In order to be compatable with the TrueNorth architecture, some 
    irregular constraints and functionalities are implemented.

    Each layer contains statically initialized `weights`, which are
    multiplied by trainable `connections`. `Connections` are floating point
    values which represent the `connections` in the TrueNorth architecture.
    When feeding forward, `connections` are normally constrained to 1 if their
    floating point value is greater than 0.5, and 0 otherwise. In this way,
    feeding forward represents actual computation on a TrueNorth chip, but
    connections can still be trained when backpropogating.

    Additionally, the inputs to the TrueNorth layer can beconstrained to
    spikes by setting them to 1 if their floating point value is greater than
    0.5, and to 0 otherwise.

    Lastly, the outputs of the layer are constrained during validation and
    testing. After the weighted input is calculated, each value is set to 1 if
    it is greater than or equal to 0, and 0 otherwise. During training, this
    is estimated by a sigmoid activation function."""

    def __init__(self,
                 units,
                 activation='sigmoid',
                 use_bias=True,
                 weight_initializer=None,
                 bias_initializer='zeros',
                 connection_initializer=None,
                 connection_regularizer=None,
                 connection_constraint=None,
                 round_input=True,
                 round_connections=True,
                 clip_connections=True,
                 round_bias=True,
                 constrain_outputs_after_trianing=True,
                 **kwargs):
        """Initializes a new TeaLayer.

        Arguments:
            units -- The number of neurons to use for this layer.

        Keyword Arguments:
            activation -- The type of activaiton function to use to estimate
                          spiking during training. Note that the sigmoid
                          activation function was specifically chosen to most
                          accurately represent spiking, so this value sohuld
                          probably be left at its default.
                          (default: {'sigmoid'})
            use_bias -- Whether or not to use biases. (default: {True})
            weight_initializer -- The initializer to use to initialize the
                                  weights. If `None`, the
                                  `tea_weight_initializer` is used, which
                                  initializes the weights as alternating
                                  values of 1 and -1, as outlined in IBM's
                                  TeaLearning literature. (default: {None})
            bias_initializer -- The initializer to use to intiailze the biases.
                                (default: {'zeros'})
            connection_initializer -- The initializer to use for the
                                      connection values. Note that connections
                                      should be initialized as a probability
                                      distribution. By default, they are
                                      sampled from a normal distribution around
                                      0.5. (default: {None})
            connection_regularizer -- A regularizer to use on the connection
                                      values. (default: {None})
            connection_constraint -- A constraint to apply to the connections.
                                     (default: {None})
            round_input -- Whether or not to round input values when feeding
                           forward (so that they can be represented as spikes.)
                           (default: {True})
            round_connections -- Whether or not to round connections when
                                 feeding forward. (default: {True})
            clip_connections -- Whether or not to clip connections between 0 and
                                1 when feeding forward. (default: {True})
            round_bias -- Whether or not to round the biases when feeding forward
                          (default: {True})
            constrain_outputs_after_training -- Whether or not to constrain
                                                outputs as spikes after training
                                                is done. (default: {True})"""
        self.units = units
        self.activation = activations.get(activation)
        self.use_bias = use_bias
        if connection_initializer:
            self.connection_initializer = connection_initializer
        else:
            self.connection_initializer = initializers.TruncatedNormal(mean=0.5)
        if weight_initializer:
            self.weight_initializer = weight_initializer
        else:
            self.weight_initializer = tea_weight_initializer
        self.bias_initializer = bias_initializer
        self.connection_regularizer = regularizers.get(connection_regularizer)
        self.connection_constraint = constraints.get(connection_constraint)
        self.input_width = None
        self.round_input = round_input
        self.round_connections = round_connections
        self.clip_connections = clip_connections
        self.round_bias = round_bias
        self.constrain_outputs_after_trianing = \
            constrain_outputs_after_trianing
        # Needs to be set to `True` to use the `K.in_train_phase` function.
        self.uses_learning_phase = True
        super(Tea, self).__init__(**kwargs)

    def build(self, input_shape):
        print(input_shape)
        assert len(input_shape) >= 2
        shape = (input_shape[-1], self.units)
        self.static_weights = self.add_weight(
            name='weights',
            shape=shape,
            initializer=self.weight_initializer,
            trainable=False)
        self.connections = self.add_weight(
            name='connections',
            shape=shape,
            initializer=self.connection_initializer,
            regularizer=self.connection_regularizer,
            constraint=self.connection_constraint)
        if self.use_bias:
            self.biases = self.add_weight(
                name='biases',
                shape=(self.units,),
                initializer=self.bias_initializer)
        super(Tea, self).build(input_shape)

    def call(self, x):
        with tf.get_default_graph().gradient_override_map(
            {"Round":"CustomRound"}):
            # Constrain input
            if self.round_input:
                x = tf.round(x)
            else:
                x = K.in_train_phase(
                        x,
                        tf.round(x)
                        )
            # Constrain connections
            connections = self.connections
            if self.round_connections:
                connections = tf.round(connections)
            else:
                connections = K.in_train_phase(
                        connections,
                        tf.round(connections)
                        )
            if self.clip_connections:
                connections = K.clip(connections, 0, 1)
            else:
                connections = K.in_train_phase(
                        connections,
                        K.clip(connections, 0, 1)
                        )
            # Multiply connections with weights
            weighted_connections = connections * self.static_weights
            # Dot input with weighted connections
            output = K.dot(x, weighted_connections)
            # Add biases if they're being used
            if self.use_bias:
                # Constrain biases
                if self.round_bias:
                    biases = tf.round(self.biases)
                else:
                    biases = K.in_train_phase(
                            self.biases,
                            tf.round(self.biases)
                            )
                output = K.bias_add(
                    output,
                    biases,
                    data_format='channels_last'
                )
            # Apply activation / spike
            output = K.in_train_phase(
                self.activation(output),
                tf.cast(tf.greater_equal(output, 0.0), tf.float32)
            )
        return output

    def compute_output_shape(self, input_shape):
        assert input_shape and len(input_shape) >= 2
        assert input_shape[-1]
        output_shape = list(input_shape)
        output_shape[-1] = self.units
        return tuple(output_shape)

def tea_weight_initializer(shape, dtype=np.float32):
    """Returns a tensor of alternating 1s and -1s, which is (kind of like)
    how IBM initializes their weight matrix in their TeaLearning
    literature.

    Arguments:
        shape -- The shape of the weights to intialize.

    Keyword Arguments:
        dtype -- The data type to use to initialize the weights.
                 (default: {np.float32})"""
    num_axons = shape[0]
    num_neurons = shape[1]
    ret_array = np.zeros((int(num_axons), int(num_neurons)), dtype=dtype)
    for axon_num, axon in enumerate(ret_array):
        if axon_num % 2 == 0:
            for i in range(len(axon)):
                ret_array[axon_num][i] = 1
        else:
            for i in range(len(axon)):
                ret_array[axon_num][i] = -1
    return tf.convert_to_tensor(ret_array)

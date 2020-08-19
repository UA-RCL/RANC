# Contains the Code for Tea Layer for use in TeaLarning and TensorFlow 2.0


# Future Imports:
from __future__ import absolute_import, division, print_function

# General Imports:
import tensorflow as tf
import numpy as np

# From Imports:
from tensorflow.keras import layers, activations, initializers, regularizers, constraints
#from tensorflow.keras import backend as K
# Custom Round Gradient:
# In a TeaLayer the connections are rounded during the feedforward process.
# We need a custom rounding function to implement this.
# For this function the gradient is treated as a [ 1 ] so as not to effect backprop.
@tf.RegisterGradient("CustomRound")
def _const_round_grad(unused_op, grad):
    return grad
######################################################################################################################################
class Tea(layers.Layer):
    """
    The following is an implementation of a TeaLayer used to implement IBM's TeaLarning Training
        method for RANC-based TrueNorth deployment.

    For this to be compatable with the TrueNorth architecture, some irregular constraints and 
        functionalities must be implemented.

    Each layer contains stastically initialized [ weights ], which are multiplied by trainable
        [ connections ]. [ Connections ] are floating point values which represent the
        probablity that a [ connection ] exists. When feeding-forward [ connections ] are normally
        constrained to the values of 1, if >= 0.5, and 0, else. 

        This method allows for feed-forward to represent actual TrueNorth computations, but still
        allows connections to be trained during backprop.

    Additionally, inputs into the TrueNorth layer must be constrained to binary spikes of 1 or 0.
        Input data is normalized between 0 and 1, then if the value is 0.5 or greater it is represented
        as a spike (1), otherwise it is represented as a non-spike (0).

    Finally, outputs of the layer must be constrained during validation and testing. After weighted
        inputs are calculated, each value is set to 1 if it is greater than or equal to 0, and 0 otherwise.

        During training, this is estimated by a sigmoid activation function.
    """

    """
    New TeaLayer Initialization:
    Arguments:
        units -- The number of neurons to use for this layer.

    Keyword Arguments:
        activation -- The type of activation function to use to estimate spiking during training.
                      Note: Sigmoid activation function is specifically chosen to most accurately
                        represent spiking. This value [should] be left as the default.
                      DEFAULT: [sigmoid]

        use_bias   -- To use biases or not.
                      DEFAULT: [True]

        weight_initializer -- The initializer to use when initializing the weights. If [None], then
                              the function [tea_weight_initializer] is used. This function sets all
                              weights to be -1 or 1 as outlined by IBM's TeaLarning Literature.
                              DEFAULT: [None]

        bias_initalizer -- The initializer to use when initializing biases.
                           DEFAULT: [zeros]

        connection_initializer -- The initializer to use when initializing connection values.
                                  Note: Connections should be initialized as a [probability distribution].
                                  By default they are sampled from a normal distrubtion with a mean of 0.5
                                  DEFAULT: [None]

        connection_regularizer -- A regularizer to use on the connection values, if any.
                                  DEFAULT: [None]
        
        connection_constraint -- A constraint to apply to the connections, if any.
                                 DEFAULT: [None]

        round_input -- When feeding-forward this option dictates to round the input values or not to. This should
                       be set to [True] to maintain spiking simulation.
                       DEFAULT: [True]
        
        round_connections -- When feeding-forward this option dictates to round the connection values or not.
                             DEFAULT: [True]

        clip_connection -- This option dictates if connection values should be clipped between 0 and 1 when feeding-forward.
                           DEFAULT: [True]

        round_bias -- This option dictates if biases should be rounded when feeding-forward.
                      DEFAULT: [True]

        constrain_after_train -- This option dictates if outputs should be constrained to spikes (0 or 1) when training is completed.
                                 DEFAULT: [True]

    """
    ##################################################################################################################################
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
                 constrain_after_train=True,
                 **kwargs):
        super(Tea, self).__init__(**kwargs)
        
        self.units=units
        
        self.activation=activations.get(activation)
        
        self.use_bias=use_bias

        if connection_initializer:
            self.connection_initializer=connection_initializer
        else:
            self.connection_initializer=initializers.TruncatedNormal(mean=0.5)

        if weight_initializer:
            self.weight_initializer=weight_initializer
        else:
            self.weight_initializer=tea_weight_initializer

        self.bias_initializer=bias_initializer

        self.connection_regularizer=connection_regularizer
        
        self.connection_constraint=connection_constraint

        self.input_width=None

        self.round_input=round_input

        self.round_connections=round_connections
        
        self.clip_connections=clip_connections

        self.round_bias=round_bias

        self.constrain_after_train=constrain_after_train

        self.uses_learning_phase=True
    ##################################################################################################################################
    def build(self, input_shape):
        assert len(input_shape) >= 2

        super(Tea,self).build(input_shape)

        shape = (input_shape[-1], self.units)

        self.static_weights = self.add_weight(name='weights',
                                              shape=shape,
                                              initializer=self.weight_initializer,
                                              trainable=False)

        self.connections = self.add_weight(name='connections',
                                           shape=shape,
                                           initializer=self.connection_initializer,
                                           regularizer=self.connection_regularizer,
                                           constraint=self.connection_constraint)

        if self.use_bias:
            self.biases = self.add_weight(name='bias',
                                          shape=(self.units,),
                                          initializer=self.bias_initializer)
    ##################################################################################################################################
    def call(self, inputs):
        # FIXME: tf.compat.v1 will not be around forever. Need to remake this into the new way, but for now this will do.
        with tf.compat.v1.get_default_graph().gradient_override_map({"Round":"CustomRound"}):
            # Constrain the Input:
            if self.round_input:
                inputs = tf.keras.backend.round(inputs)
            else:
                inputs = tf.keras.backend.in_train_phase(inputs, tf.keras.backend.round(inputs))

            # Connection Constraints:
            connections = self.connections

            if self.round_connections:
                connections = tf.keras.backend.round(connections)
            else:
                connections = tf.keras.backend.in_train_phase(connections, tf.keras.backend.round(connections))

            if self.clip_connections:
                connections = tf.keras.backend.clip(connections, 0, 1)
            else:
                connections = tf.keras.backend.in_train_phase(connections, tf.keras.backend.clip(connections, 0, 1))

            # Multiply Connections with Weights:
            weighted_connections = connections * self.static_weights

            # Dot Product the Input with the Weighted Connections
            output = tf.keras.backend.dot(inputs, weighted_connections)

            # Add biases if they are being used:
            if self.use_bias:
                
                # Constrain the biases first:
                if self.round_bias:
                    biases = tf.keras.backend.round(self.biases)
                else:
                    biases = tf.keras.backend.in_train_phase(self.biases, tf.keras.backend.round(self.biases))

                output = tf.keras.backend.bias_add(output, biases, data_format='channels_last')

            # Apply activation / Spike(s)
            output = tf.keras.backend.in_train_phase(self.activation(output), 
                                                     tf.dtypes.cast(tf.math.greater_equal(output, 0.0), tf.float32))

        return output
    ##################################################################################################################################
    def compute_output_shape(self, input_shape):
        assert input_shape and len(input_shape) >= 2
        assert input_shape[-1]

        output_shape = list(input_shape)

        output_shape[-1] = self.units

        return tuple(output_shape)
    ##################################################################################################################################
# END CLASS : TEA
"""
This function returns a tensor of alternating 1s and -1s. This is a basic re-implementation of IBM's own weight matrix initializations.

Argument:
    shape -- The shape of the weights to be initialized.

Keyword Arguments:
    dtype -- The data type to be used when initializing the weights.
             DEFAULT : [np.float32]
"""
def tea_weight_initializer(shape, dtype=np.float32):
    num_axons = shape[0]
    num_neurons = shape[1]
    if dtype == 'float32':
        dtype = np.float32
    ret_array = np.zeros((int(num_axons), int(num_neurons)), dtype=dtype)

    for axon_num, axon in enumerate(ret_array):
        if axon_num % 2 == 0:
            for neuron in range(len(axon)):
                ret_array[axon_num][neuron] = 1
        else:
            for neuron in range(len(axon)):
                ret_array[axon_num][neuron] = -1

    return tf.convert_to_tensor(ret_array)

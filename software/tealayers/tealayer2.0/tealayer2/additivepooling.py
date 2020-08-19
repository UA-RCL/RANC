# Contains the code for the additive pooling layer required by a Tea Layer when using TeaLearning.
#
#
#
#

# Future Calls:
from __future__ import absolute_import, division, print_function

# Imports:
import tensorflow as tf
import numpy as np

# From Imports:
from tensorflow.keras import layers

"""
Additive Pooling Class:
    A helper layer designed to format data for output during the TeaLarning process.

    If the input data to the layer has multiple spikers per classification, then for each
    tick the spikes must be summed up. Then, once all neurons that correspond to a certain class
    have finished spiking, their sums will dictate the results for each class.

    Neurons are assumed to be arracnged such that each [num_class] represents a guess for each
    of the classes.

    For example:
        If we have 10 classes, and we are using 250 neurons. Then we would have something like:
        neuron_number: 0    1   2   3   4   5   6   7   8   9   10  11  12  13  ...
        class:         0    1   2   3   4   5   6   7   8   9   0   1   2   3   ...
"""
######################################################################################################################################
class AdditivePooling(layers.Layer):
    """
    Initializer for new AdditivePooling Layer.

    Arguments:
        num_classes -- The number of classes to be output'd
    """
    ##################################################################################################################################
    def __init__(self,
                 num_classes,
                 use_additive_pooling_processing=False,
                 add_pool_process_max=128,
                 **kwargs):
        super(AdditivePooling, self).__init__(**kwargs)

        self.num_classes=num_classes
        
        self.num_inputs=None
        
        self.use_additive_pooling_processing=use_additive_pooling_processing
        
        self.add_pool_process_max=add_pool_process_max
    ##################################################################################################################################
    def build(self, input_shape):
        assert len(input_shape) >= 2

        # The number of neurons must be collapsable into the number of classes.
        # i.e if we have 10 classes, the number of neurons must be a divisor of 10.
        assert input_shape[-1] % self.num_classes == 0

        self.num_inputs = input_shape[-1]
    ##################################################################################################################################
    def call(self, inputs):
        if len(inputs.shape) >= 3:
            output = tf.keras.backend.sum(inputs, axis=1)
        else:
            output = inputs

        # Reshape the outputs:
        output = tf.reshape(output, [-1, int(self.num_inputs/self.num_classes), self.num_classes])

        # Sum up the neurons
        output = tf.math.reduce_sum(output, 1)

        if self.use_additive_pooling_processing:
            # Scale the ouputs between 0 and add_pool_process_max:
            max_val = tf.constant(self.add_pool_process_max, dtype=tf.float32)
            max_output = tf.stack([tf.reduce_max(output,1) for i in range(self.num_classes)], axis=1)
            max_output = tf.math.divide(max_val, max_output)
            output = tf.math.multiply(output, max_output)

            # Convert any NaN's to 0:
            output = tf.where(tf.math.is_nan(output), tf.zeros_like(output), output)

        return output
    ##################################################################################################################################
    def computer_output_shape(self, input_shape):
        output_shape = list(input_shape)

        # Last dimension will be number of classes:
        output_shape[-1] = self.num_classes

        # Ticks were summed, so delete tick dimension if they exist:
        if len(output_shape) >= 3:
            del output_shape[1]

        return tuple(output_shape)

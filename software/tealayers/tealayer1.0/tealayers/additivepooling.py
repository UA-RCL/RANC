"""Contains the code for a tea layer for use in TeaLearning."""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import tensorflow as tf
from keras import backend as K
from keras.engine.topology import Layer

class AdditivePooling(Layer):
    """A helper layer designed to format data for output during TeaLearning.
    If the data input to the layer has multiple spikes per classification, the
    spikes for each tick are summed up. Then, all neurons that correspond to a
    certain class are summed up so that the output is the number of spikes for
    each class. Neurons are assumed to be arranged such that each
    `num_classes` neurons represent a guess for each of the classes. For
    example, if the guesses correspond to number from 0 to 9, the nuerons are
    arranged as such:

        neuron_num: 0  1  2  3  4  5  6  7  8  9  10 11 12  ...
        guess:      0  1  2  3  4  5  6  7  8  9  0  1  2   ..."""

    def __init__(self,
                 num_classes,
                 use_additive_pooling_processing = False,
                 additive_pooling_processing_max = 128,
                 **kwargs):
        """Initializes a new `AdditivePooling` layer.

        Arguments:
            num_classes -- The number of classes to output.
        """
        self.num_classes = num_classes
        self.num_inputs = None
        self.use_additive_pooling_processing = use_additive_pooling_processing
        self.additive_pooling_processing_max = additive_pooling_processing_max
        super(AdditivePooling, self).__init__(**kwargs)

    def build(self, input_shape):
        assert len(input_shape) >= 2
        # The number of neurons must be collapsable into the number of classes
        assert input_shape[-1] % self.num_classes == 0
        self.num_inputs = input_shape[-1]

    def call(self, x):
        # Sum up ticks if there are ticks
        if len(x.shape) >= 3:
            output = K.sum(x, axis=1)
        else:
            output = x
        # Reshape output
        output = tf.reshape(
            output,
            [-1, int(self.num_inputs / self.num_classes), self.num_classes]
        )
        # Sum up neurons
        output = tf.reduce_sum(output, 1)

        if self.use_additive_pooling_processing:
            # Scaling the outputs between 0 - additive_pooling_processing_max.
            max_val = tf.constant(self.additive_pooling_processing_max, dtype=tf.float32)
            max_output = tf.stack([tf.reduce_max(output, 1) for i in range(self.num_classes)], axis = 1)
            max_output = tf.divide(max_val, max_output)
            output = tf.multiply(output, max_output)
            # Converting any NaN's (0 / 0) to 0
            output = tf.where(tf.is_nan(output), tf.zeros_like(output), output)
        
        return output

    def compute_output_shape(self, input_shape):
        output_shape = list(input_shape)
        # Last dimension will be number of classes
        output_shape[-1] = self.num_classes
        # Ticks were summed, so delete tick dimension if exists
        if len(output_shape) >= 3:
            del output_shape[1]
        return tuple(output_shape)

#
#
#
#
############################################################################
# Imports Required for Functionality:
import pathlib
from PIL import Image
import numpy as np
import math
############################################################################
# Helper Functions:
#
############################################################################
"""
    Create Training Data:
        Arguements: 
        - data          ->      Empty list that will be filled with JPG images.
        - classnames    ->      List of class names. These will become encoded as numeric values.
        - paths         ->      List of pathlib.Path paths. These should be the training/testing pathways to the data.
        - num           ->      What path in the list to use.

    This function takes in an empty list, a list of classes, a list of data paths, and what path list number to use.
    It then acquires all JPG images from this path, for each class, and populates the data list with [data, class] pairs.
    This list is then returned once populated.
"""
def create_training_data(data, classnames, paths, num):
    for category in range(len(classnames)):
        images = paths[num].glob(classnames[category] + '/*.JPG')

        for img_path in images:
            try:
                img_array = np.array(Image.open(img_path))
                data.append([img_array, category])
            except Exception as e:
                print("EXCEPTION[{e}] : Failed to open Image Path.".format(e=e))
                return
                
    return data
############################################################################
"""
    Encode Dataset:
        Arguments:
        - data          ->  A numpy array of the training/testing data.
        - ticks         ->  Time interval. How many ticks shall be used in the encoding scheme.
        - method        ->  What encoding scheme to use? [ rate encoding, burst-rate encoding, time-to-spike encoding ]
                                Do not need to specifiy encoding when calling this function. It will work with just [ rate, burst-rate, time-to-spike ]
        - train         ->  Should spikes be written in [forward] or [reverse] implementation. So if we have 2 spikes, and they are to be written in forward implementation, the resulting
                                spike train would be [0,1]. If it was [reverse] implementation, then it would be [14,15].

    This functon takes in a numpy array with 2 dimensions (# of items, size of items) and returns an encoded dataset of 3 diemensions (# of items, ticks, size of items).
    For example, if we are using the MNIST dataset, then each image is normally 28x28. When normally loaded the training set is a numpy array that is (60000, 28, 28). This needs
    to be resized to a 2-d array of size (60000, 28*28). If we wer using 16 ticks for our encoding scheme, then we would have a numpy array of (60000, 16, 28*28) after this function is done.

    Encoding Schemes:
        -Rate Encoding: For rate encoding of floating-point numbers, it is quite simple. The pixel value is simply divided across the number of ticks. So, if we have a pixel value of say 64, and
            we want to rate encode this across 16 ticks, then we simply have 64/16 = 4. So in each tick array we'll have a value of 4.
                        For rate encoding of spikes however, this changes up a bit. We take the value and divide by the number of ticks as normal, so with 64/16 we get 4. However, this means that
                        the value of 64 is encoded as 4 spikes. These spikes are then evenly distributed across the tick array. So we'd have a spike at [0,4,8,12] or [3,7,11,15] depending on if we want spike
                        first or last priority.

        -Burst-Rate Encoding: For Burst Rate encoding we do exactly as we do for rate encoding. The difference, is when the information is presented. For floating-point numbers it would function essentially just
                              like floating-point numbers for rate encoding as we are evenly distributing the information across the ticks.
                              For spikes however, rather than distributing the spikes across the number of ticks evenly, we send then one after the other. So, for 64/16=4 spikes we'd have spieks at [0,1,2,3] or 
                              [12,13,14,15] if we are doing spikes forwards or backwards.

        -Time-to-Spike Encoding: For time-to-spike encoding, again for floating point it will work just like rate encoding. But, for spikes we calculate as we would for burst-rate encoding. However, we only send out the
                                 last spike in the train. So, again for 65/16=4 spikes we'd have a single spike at [3] or [15] depending on if we are doing spikes forwards or backwards.
"""
def encode_dataset(data, ticks=16, method='rate encoding', train='forward'):
    new_data = np.zeros((data.shape[0], ticks, data.shape[1]))
    
    for item in range(len(data)):
        for pixel in range(len(data[item])):
            if 'rate' in method and 'burst' not in method:
                new_data[item, :, pixel] = rate_encode(data[item][pixel], ticks, train)
            elif 'rate' in method and 'burst' in method:
                new_data[item, :, pixel] = burst_encode(data[item][pixel], ticks, train)
            elif 'time' in method:
                new_data[item, :, pixel] = time_to_spike_encode(data[item][pixel], ticks, train)
            else:
                new_data[item, :, pixel] = burst_encode(data[item][pixel], ticks, train)
    return new_data

############################################################################


############################################################################
"""
    Spike Encoding Schemes:
    All encoding schemes must be given the same three basic arguments:
        1) pixel -> A pixel value that has already been normalized between 0 and 1.
        2) ticks -> The number of time intervals to encode across (default is [16]).
        3) train -> Method of spike placement, either forward or reverse (default is [forward]).
"""
def burst_encode(pixel, ticks=16, train='forward'):
    spikes = int(round(pixel*ticks))

    if 'forward' in train:
        return [1]*spikes + [0]*(ticks-spikes)
    else:
        return [0]*(ticks-spikes) + [1]*spikes
############################################################################

def rate_encode(pixel, ticks=16, train='forward'):
    temp = np.zeros((ticks))

    spikes = int(round(pixel*ticks))

    if 'forward' in train:
        for i in range(ticks):
            if spikes != 0 and i % spikes == 0:
                temp[i] = 1
    else:
        for i in range(ticks):
            if spikes != 0 and i % (spikes) == 0 and i != 0:
                temp[i-1] = 1
    return temp
############################################################################

def time_to_spike_encode(pixel, ticks=16, train='forward'):
    temp = np.zeros((ticks))

    spikes = int(round(pixel*ticks))

    if 'forward' in train:
        temp[spikes-1] = 1
    else:
        if ticks-spikes-1 < 0:
            temp[0] = 1
        else:
            temp[ticks-spikes-1] = 1
    return temp
############################################################################

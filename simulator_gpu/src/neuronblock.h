/// neuronblock.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef NEURONBLOCK_H
#define NEURONBLOCK_H

#include "config.hpp"

/**
 * @brief Performs the leaky integrate and fire operation for a neuron.
 * 
 */
enum reset_types{
    asymetric_reset,
    symetric_reset
};

enum reset_modes{
    absolute_reset,
    linear_reset
};

class NeuronBlock {
	public:
		// Constructors:
		__device__ __host__ NeuronBlock();
		__device__ __host__ NeuronBlock(int reset_type);
		__device__ __host__ NeuronBlock(int reset_type, int current_potential);

		// NeuronBlock Methods:
		__device__ __host__ void integrate(int synaptic_weights[NUM_WEIGHTS], int neuron_instruction);
		__device__ __host__ void leak(int leak);
		__device__ __host__ bool spikes(int positive_threshold);
		__device__ __host__ int output_potential(int positive_threshold, int negative_threshold, int reset_potential, int reset_mode);

		// NeuronBlock Variables:
		int current_potential;
		int reset_type;
};

#endif
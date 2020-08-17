/// neuronblock.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef NEURONBLOCK_H
#define NEURONBLOCK_H

#include <vector>

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
                NeuronBlock();
                NeuronBlock(int reset_type);
                NeuronBlock(int reset_type, int current_potential);

                // NeuronBlock Methods:
		void integrate(std::vector<int> synaptic_weights, int neuron_instruction);
		void leak(int leak);
		bool spikes(int positive_threshold);
		int output_potential(int positive_threshold, int negative_threshold, int reset_potential, int reset_mode);

                // NeuronBlock Variables:
		int current_potential;
                int reset_type;
};

#endif

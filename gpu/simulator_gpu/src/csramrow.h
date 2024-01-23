/// csramrow.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef CSRAMROW_H
#define CSRAMROW_H

#include <vector>
#include <string>

#include "config.hpp"

/**
 * @brief A single CSRAM Row corresponding to one neuron
 * 
 * Holds all parameters for one neuron. Current parameters are:
 * 	- connections
 * 	- current_potential
 * 	- reset_potential
 * 	- leak
 * 	- positive_threhsold
 * 	- negative threshold
 * 	- weights
 */
class CSRAMRow {
	public:
		__host__ CSRAMRow();

		__host__ CSRAMRow(const CSRAMRow& rhs);
		
		__host__ CSRAMRow(std::vector<bool> connections, int current_potential, int reset_potential, int leak, int positive_threshold, int negative_threshold, std::vector<int> weights, int dx, int dy, int destination_tick, int destination_axon, int reset_mode);

		__host__ std::string to_string(bool hex);

		bool connections[NUM_AXONS];
        int current_potential;
		int reset_potential;
		int leak;
		int positive_threshold;
		int negative_threshold;
		int weights[NUM_WEIGHTS];
		int dx, dy;
		int destination_tick;
		int destination_axon;
		int reset_mode;
};

#endif // CSRAMROW_H
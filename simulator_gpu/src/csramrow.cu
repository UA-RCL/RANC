/// csramrow.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <sstream>

#include "csramrow.h"
#include "config.hpp"

__host__ CSRAMRow::CSRAMRow() {
	for (int i = 0; i < NUM_AXONS; i++) {
		this->connections[i] = 0;
	}
	this->current_potential = 0;
	this->reset_potential = 0;
	this->leak = 0;
	this->positive_threshold = 1;
	this->negative_threshold = 0;
	for (int i = 0; i < NUM_WEIGHTS; i++) {
		this->weights[i] = 0;
	}
	this->dx = 0;
	this->dy = 0;
	this->destination_tick = 0;
	this->destination_axon = 0;
	this->reset_mode = 0;
}

__host__ CSRAMRow::CSRAMRow(std::vector<bool> connections, int current_potential, int reset_potential, int leak, int positive_threshold, int negative_threshold, std::vector<int> weights, int dx, int dy, int destination_tick, int destination_axon, int reset_mode) {
	for (int i = 0; i < NUM_AXONS; i++) {
		this->connections[i] = connections[i];
	}
	this->current_potential = current_potential;
	this->reset_potential = reset_potential;
	this->leak = leak;
	this->positive_threshold = positive_threshold;
	this->negative_threshold = negative_threshold;
	for (int i = 0; i < NUM_WEIGHTS; i++) {
		this->weights[i] = weights[i];
	}
	this->dx = dx;
	this->dy = dy;
	this->destination_tick = destination_tick;
	this->destination_axon = destination_axon;
	this->reset_mode = reset_mode;
}

__host__ std::string CSRAMRow::to_string(bool hex) {
	std::ostringstream s;
	// TODO: Implement hex to_string
	if (hex) {
		s << "[WARNING] CSRAMRow to_string hex not implemented.";
	} else {
		s << "connections: [";
		for (auto connection : connections) {
			s << connection;
		}
		s << "], current potential: " << current_potential;
		s << ", reset potential: " << reset_potential;
		s << ", leak: " << leak;
		s << ", positive threshold: " << positive_threshold;
		s << ", negative threshold: " << negative_threshold;
		s << ", weights: [";
		for (auto weight : weights) {
			s << weight;
		}
		s << "], dx: " << dx << ", dy: " << dy;
		s << ", destination axon: " << destination_axon;
		s << ", destination tick: " << destination_tick;
		s << ", reset mode: " << reset_mode;  
	}
	return s.str();
}

__host__ CSRAMRow::CSRAMRow(const CSRAMRow& rhs) {
	for (int i = 0; i < NUM_AXONS; i++) {
		this->connections[i] = rhs.connections[i];
	}
	this->current_potential = rhs.current_potential;
	this->reset_potential = rhs.reset_potential;
	this->leak = rhs.leak;
	this->positive_threshold = rhs.positive_threshold;
	this->negative_threshold = rhs.negative_threshold;
	for (int i = 0; i < NUM_WEIGHTS; i++) {
		this->weights[i] = rhs.weights[i];
	}
	this->dx = rhs.dx;
	this->dy = rhs.dy;
	this->destination_tick = rhs.destination_tick;
	this->destination_axon = rhs.destination_axon;
	this->reset_mode = rhs.reset_mode;
}
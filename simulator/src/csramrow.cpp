/// csramrow.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <sstream>

#include "csramrow.h"
#include "config.hpp"

CSRAMRow::CSRAMRow() {
	this->connections = std::vector<bool>(Config::parameters["num_axons"].GetInt());
	this->current_potential = 0;
	this->reset_potential = 0;
	this->leak = 0;
	this->positive_threshold = 1;
	this->negative_threshold = 0;
	this->weights = std::vector<int>(Config::parameters["num_weights"].GetInt());;
	this->dx = 0;
	this->dy = 0;
	this->destination_tick = 0;
	this->destination_axon = 0;
	this->reset_mode = 0;
}

CSRAMRow::CSRAMRow(std::vector<bool> connections, int current_potential, int reset_potential, int leak, int positive_threshold, int negative_threshold, std::vector<int> weights, int dx, int dy, int destination_tick, int destination_axon, int reset_mode) {
	this->connections = connections;
	this->current_potential = current_potential;
	this->reset_potential = reset_potential;
	this->leak = leak;
	this->positive_threshold = positive_threshold;
	this->negative_threshold = negative_threshold;
	this->weights = weights;
	this->dx = dx;
	this->dy = dy;
	this->destination_tick = destination_tick;
	this->destination_axon = destination_axon;
	this->reset_mode = reset_mode;
}

std::string CSRAMRow::to_string(bool hex) {
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
/// corecontroller.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <iostream>
#include <sstream>
#include <bitset>
#include <chrono>
using namespace std::chrono;

#include <plog/Log.h>

#include "corecontroller.h"
#include "packet.h"
#include "config.hpp"


CoreController::CoreController(Core* parent, Router* router, Scheduler* scheduler, NeuronBlock* neuron_block, std::vector<CSRAMRow*> csram, std::vector<int> neuron_instructions) {
	this->parent = parent;
	this->router = router;
	this->scheduler = scheduler;
	this->neuron_block = neuron_block;
	this->csram = csram;

	this->neuron_instructions = neuron_instructions;
	
	for (int i = 0; i < NUM_NEURONS; i++) {
		csram_dereferenced[i] = *csram[i];
	}
	
	for (int i = 0; i < NUM_AXONS; i++) {
		neuron_instructions_dereferenced[i] = neuron_instructions[i];
	}

	this->routerPercentage = 0;
}

CoreController::~CoreController() {

}

std::string CoreController::getSpikes() {
	std::string str;
	std::stringstream sstream;
	char *pEnd = NULL;
	for (int i = 0; i < Config::parameters["num_axons"].GetInt(); i += 4) {
		str = "";
		for (int j = 0; j < 4; j++) {
			str += std::to_string(spikes[i+j]);
		}
		int temp = (int)std::strtol(str.c_str(), &pEnd, 2);
		sstream << std::hex << temp;
	}
	
	return sstream.str();
}	
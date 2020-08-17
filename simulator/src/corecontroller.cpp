/// corecontroller.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <iostream>
#include <sstream>
#include <bitset>

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

void CoreController::run() {
	std::vector<int> active_connection_indices;
	int neuron_block_trace_verbosity = Config::parameters["neuron_block_trace_verbosity"].GetInt();
	
	// Fetch the current spikes from the sram
	spikes = scheduler->getSpikes();

	if (Config::parameters["core_controller_trace_verbosity"].GetInt()) {
		std::ostringstream sstream;
		sstream << "++++++ Core Controller (" << parent->x << ", " << parent->y << ") running. Fetched spikes ";
		std::ostringstream spike_stream;
		for (auto bit : spikes) {
			spike_stream << std::to_string(bit);
		}
		if (Config::parameters["core_controller_trace_verbosity"] == tc_trace_spikes) {
			sstream << spike_stream.str();
		}
		// TODO: Include outputting in hex
		LOG_DEBUG_(1) << sstream.str();
	} else if (neuron_block_trace_verbosity) {
		LOG_DEBUG_(1) << "++++++ Core Controller (" << parent->x << ", " << parent->y << ") running. ++++++";
	}

	// So that we only print cores whose neurons have spikes
	bool wrote_core = false;

	// Iterate through each neuron
	for (auto csram_row = csram.begin(); csram_row != csram.end(); csram_row++) {

		neuron_block->current_potential = (*csram_row)->current_potential;
		// Get active connecitons (where there is both a spike and connection)
		active_connection_indices = activeConnectionIndices((*csram_row)->connections, spikes);

		if (neuron_block_trace_verbosity == nb_trace_spikes) {
			std::ostringstream sstream;
			sstream << "Neuron " << csram_row - csram.begin() << " received spikes at axons ";
			for (auto active_connection_index : active_connection_indices) {
				sstream << active_connection_index << " ";
			}
			LOG_DEBUG_(1) << sstream.str();
		}

		if (neuron_block_trace_verbosity == nb_trace_potentials) {
			LOG_DEBUG_(1) << "Neuron " << csram_row - csram.begin() << " integration";
			LOG_DEBUG_(1) << "\tStarting potential: " << neuron_block->current_potential;
		}

		// Integrate spikes
		for (auto active_connection_index : active_connection_indices) {
			neuron_block->integrate((*csram_row)->weights, neuron_instructions[active_connection_index]);

			if (neuron_block_trace_verbosity == nb_trace_potentials) {
				LOG_DEBUG_(1) << "\tIntegrated spike from axon " << active_connection_index << " with weight " << (*csram_row)->weights[neuron_instructions[active_connection_index]] << ". Current potential: " << neuron_block->current_potential;
			}
		}
		
		// Apply leak
		neuron_block->leak((*csram_row)->leak);

		if (neuron_block_trace_verbosity == nb_trace_potentials) {
			LOG_DEBUG_(1) << "\tApplied leak of: " << (*csram_row)->leak << ". Current potential: " << neuron_block->current_potential;
		}

		// Check for spike
		if (neuron_block->spikes((*csram_row)->positive_threshold)) {
			// Log core if necessary
			if (!wrote_core) {
				// LOG_INFO_(0) << "\tCore (" << parent->x << ", " << parent->y << "):";
				wrote_core = true;
			}
			// Log neuron to output
			// LOG_INFO_(0) << "\t\tNeuron " << csram_row - csram.begin();
			if (neuron_block_trace_verbosity == nb_trace_potentials) {
				LOG_DEBUG_(1) << "\tNeuron spikes.";
			}

			router->receiveLocal(Packet((*csram_row)->dx, (*csram_row)->dy, (*csram_row)->destination_tick, (*csram_row)->destination_axon));
		}

		// Send potential back to csram
		(*csram_row)->current_potential  = neuron_block->output_potential((*csram_row)->positive_threshold, (*csram_row)->negative_threshold, (*csram_row)->reset_potential, (*csram_row)->reset_mode);
		
		if (neuron_block_trace_verbosity == nb_trace_potentials) {
			LOG_DEBUG_(1) << "\tNeuron ends at potential: " << (*csram_row)->current_potential;
		}
	}

	// Clear SRAM after processing
	scheduler->clear();
}

std::vector<int> CoreController::activeConnectionIndices(std::vector<bool> connections, std::vector<bool> spikes) {
	std::vector<int> indices;
	for (int i = 0; i < connections.size(); i++) {
		if (connections.at(i) && spikes.at(i)) {
			indices.push_back(i);
		}
	}
	return indices;
}

/// RANC.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <iostream>

#include <plog/Log.h>

#include "config.hpp"
#include "rancgrid.h"
#include "router.h"
#include "scheduler.h"
#include "neuronblock.h"
#include "csramrow.h"
#include "corecontroller.h"

RANCGrid::RANCGrid(std::vector<std::vector<Packet>> input_packets, std::vector<Component*> components) {
	this->components = components;
	this->input_packets = input_packets;
}

void RANCGrid::beginActivity(int num_ticks, int report_frequency) {
	std::cout << "Starting simulation with " << num_ticks << " ticks." << std::endl;
	
	if (Config::traceSpecified()) {
		LOG_DEBUG_(1) << "Starting simulation with " << num_ticks << " ticks.";
	}

	// FIXME: max_tick_offset of 16 will actually correspond to a max of 15 ticks in the future being able to be specified. We need error checking for this as well.

	// Send in first round of packets in before first tick to match emulation	
	for (auto packet_iter: input_packets[0]) {
		components.front()->router->receiveLocal(packet_iter);
	}

	// Iterate through each tick
	for (unsigned int tick = 1; tick <= num_ticks; tick++) {
		if (tick % report_frequency == 0) {
			std::cout << "Tick " << tick << " started" << std::endl;
		}

		if (Config::traceSpecified()) {
			LOG_DEBUG_(1) << "-------------------- Tick " << tick << " begins --------------------";
		}

		for (auto component_iter: components) {
			component_iter->prepare();
		}

		// Receive all input spike packets destined for this tick (if there are any)
		if (input_packets.size() > tick) {
			for (auto packet_iter: input_packets[tick]) {
				components.front()->router->receiveLocal(packet_iter);
			}
		}
		
		// Next loop through all cores, simulating a tick. Performs all neuron block operations
		for (auto component_iter: components) {
			component_iter->run();
		}
	}	
}

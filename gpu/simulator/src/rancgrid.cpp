/// RANC.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <iostream>

#include <plog/Log.h>
#include <chrono>
using namespace std::chrono;

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
	
	long int schedulerTime = 0;
	long int neuronBlockTime = 0;
	long int routerTime = 0;
	int* outputTimes = (int*)malloc(sizeof(int)*components.size());
	
	auto clock = high_resolution_clock::now();
	
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
		
		clock = high_resolution_clock::now();
		for (auto component_iter: components) {
			auto clock2 = high_resolution_clock::now();
			component_iter->prepare();
			outputTimes[component_iter->x + component_iter->y * Config::parameters["num_cores_x"].GetInt()] = duration_cast<microseconds>(high_resolution_clock::now() - clock2).count();
		}
		schedulerTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();

		
		clock = high_resolution_clock::now();
		// Receive all input spike packets destined for this tick (if there are any)
		if (input_packets.size() > tick) {
			for (auto packet_iter: input_packets[tick]) {
				components.front()->router->receiveLocal(packet_iter);
			}
		}
		routerTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();
		
		clock = high_resolution_clock::now();
		// Next loop through all cores, simulating a tick. Performs all neuron block operations
		for (auto component_iter: components) {
			component_iter->run();
		}
		neuronBlockTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();

	}
	
	int outputTime = 0;
	for (auto core : components) {
		if (outputTimes[core->x + core->y * Config::parameters["num_cores_x"].GetInt()] > outputTime) {
			outputTime = outputTimes[core->x + core->y * Config::parameters["num_cores_x"].GetInt()];
		}
	}
	outputTime = outputTime * num_ticks;
	
	neuronBlockTime = neuronBlockTime*1.0*(components[0]->neuronBlockTime)/(components[0]->totalTime);
	schedulerTime += neuronBlockTime*1.0*(components[0]->schedulerTime)/(components[0]->totalTime);
	schedulerTime -=outputTime;
	routerTime += neuronBlockTime*1.0*(components[0]->routerTime)/(components[0]->totalTime);
	
	std::cout << "cumulative scheduler operations took " << schedulerTime << " microseconds" << std::endl;
	std::cout << "cumulative neuronBlock operations took " << neuronBlockTime << " microseconds" << std::endl;
	std::cout << "cumulative router operations took " << routerTime << " microseconds" << std::endl;
	std::cout << "cumulative serial/output operations took " << outputTime << " microseconds" << std::endl;
	

}

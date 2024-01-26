/// outputbus.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <iostream>
#include <string>
#include <sstream>

#include <plog/Log.h>

#include "outputbus.h"
#include "router.h"
#include "config.hpp"
#include "core.h"

OutputBus::OutputBus() : Core() {
	this->router = new Router(this, NULL, NULL, NULL, NULL);
	this->x = 0;
	this->y = 0;
    this->num_outputs = 0;
    this->spikes = std::vector<bool>();
}

OutputBus::OutputBus(Core *north, Core *south, Core *west, Core *east, int num_outputs, int x, int y) : Core() {
	this->router = new Router(this, north != NULL ? north->router : NULL, south != NULL ? south->router : NULL, west != NULL ? west->router : NULL, east != NULL ? east->router : NULL);
	this->x = x;
	this->y = y;
    this->num_outputs = num_outputs;
    this->spikes = std::vector<bool>(num_outputs, false);
}

void OutputBus::receivePacket(Packet packet) {
    if (!spikes[packet.destination_axon]) {
        spikes[packet.destination_axon] = 1;
    } else {
        if (Config::traceSpecified()) {
			LOG_DEBUG_(1) << "[WARNING] Multiple spikes received for output bus axon " << packet.destination_axon << std::endl;
		}
		std::cout << "[WARNING] Multiple spikes received for output bus axon " << packet.destination_axon << std::endl;
    }
}

void OutputBus::prepare() {
    std::stringstream ss;

    for (auto spike: spikes) {
        ss << spike << " ";
    }

    LOG_INFO_(0) << ss.str();
    std::fill(spikes.begin(), spikes.end(), 0);
}

void OutputBus::run() {
    return;
}

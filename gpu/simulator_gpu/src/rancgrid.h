/// RANCGrid.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef RANCGRID_H
#define RANCGRID_H

#include <vector>
#include <string>

#include "component.h"
#include "outputbus.h"
#include "packet.h"
#include "core.h"

class RANCGrid{
	public:
		RANCGrid(std::vector<std::vector<Packet>> input_packets, std::vector<Core*> components, OutputBus* output_bus);

		void beginActivity(int num_ticks, int report_frequency);
	private:
		std::vector<std::vector<Packet>> input_packets; 
		std::vector<Core*> components;
		OutputBus* output_bus;
};

#endif

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
#include "packet.h"

class RANCGrid{
	public:
		RANCGrid(std::vector<std::vector<Packet>> input_packets, std::vector<Component*> components);

		void beginActivity(int num_ticks, int report_frequency);
	private:
		std::vector<std::vector<Packet>> input_packets; 
		std::vector<Component*> components;		
};

#endif

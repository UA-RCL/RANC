/// core.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef CORE_H
#define CORE_H

class Router;
class Scheduler;
class CoreController;

#include <string>
#include <vector>

#include "component.h"
#include "packet.h"
#include "csramrow.h"
#include "neuronblock.h"

class Core {
	public:
		// Constructors:
		Core();
		Core(Core *north, Core *south, Core *west, Core *east, std::vector<CSRAMRow*> csram, std::vector<int> neuron_instructions, int x, int y);
		Core(Core *north, Core *south, Core *west, Core *east, std::vector<CSRAMRow*> csram, std::vector<int> neuron_instructions, int x, int y, int neuron_reset_type);
		Core(Core *north, Core *south, Core *west, Core *east, std::vector<CSRAMRow*> csram, std::vector<int> neuron_instructions, int x, int y, int neuron_reset_type, int neuron_current_potential);
		
		// Core Methods:
		void prepare();
		void run();
		void receivePacket(Packet packet);
		std::string to_string();

		// Core Components
		Scheduler *scheduler;
		NeuronBlock *neuron_block;
		std::vector<CSRAMRow*> csram;
		CoreController *core_controller;
		Router *router;
		
		int x, y;
		int num_outputs; // Just used for output bus printing
};

#endif // CORE_H

/// corecontroller.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef CORECONTROLLER_H
#define CORECONTROLLER_H

#include <string>
#include <vector>

#include "core.h"
#include "router.h"
#include "csramrow.h"
#include "scheduler.h"
#include "neuronblock.h"

class CoreController {
	public:		
		// Default Constructor
		CoreController(Core* parent, Router* router, Scheduler* scheduler, NeuronBlock* neuron_block, std::vector<CSRAMRow*> csram, std::vector<int> neuron_instructions);		

		// Setters
		void setAxonType(int idx, int type);

		// Computation Functions
		void run();

		// Debug Functions
		std::string getSpikes();

		std::vector<int> neuron_instructions;

		// The core's components
		std::vector<CSRAMRow*> csram;
		Scheduler* scheduler;
		Router* router;		
		NeuronBlock* neuron_block;

		// The x, y location of the core
		Core* parent;
		// int x, y;

	private:
		std::vector<int> activeConnectionIndices(std::vector<bool> connections, std::vector<bool> spikes);
		// Vector of which axon's are active
		std::vector<bool> spikes;
};

#endif //CORECONTROLLER_H

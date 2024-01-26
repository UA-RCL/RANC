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
#include "config.hpp"



class CoreController {
	public:		
		// Default Constructor
		CoreController(Core* parent, Router* router, Scheduler* scheduler, NeuronBlock* neuron_block, std::vector<CSRAMRow*> csram, std::vector<int> neuron_instructions);		
		~CoreController();
		
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
		float routerPercentage;
		
		std::vector<int> activeConnectionIndices(bool* connections, std::vector<bool> spikes);
		// Vector of which axon's are active
		bool* spikes;
		
		// gpu compatability data structures: host (dereferenced so they're in a linear data structure)
		CSRAMRow csram_dereferenced[NUM_NEURONS];
		bool spikes_dereferenced[NUM_AXONS];
		int neuron_instructions_dereferenced[NUM_AXONS];
		bool output_spikes[NUM_NEURONS];
		int output_potentials[NUM_NEURONS];
		
		/*// gpu compatability data structures: device
		CSRAMRow* csram_device;
		bool* spikes_device;
		int* neuron_instructions_device;
		bool* output_spikes_device;
		int* output_potentials_device;*/
};

#endif //CORECONTROLLER_H

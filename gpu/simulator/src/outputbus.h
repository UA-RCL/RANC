/// outputbus.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef OUTPUTBUS_H
#define OUTPUTBUS_H

class Router;

#include <vector>

#include "component.h"
#include "packet.h"

class OutputBus: public Component {
	public:
		OutputBus();
		OutputBus(Component *north, Component *south, Component *west, Component *east, int num_outputs, int x, int y);

        void prepare();
        void run();
        void receivePacket(Packet packet);

        void logOutputs();

        int num_outputs;
        std::vector<bool> spikes;
};

#endif // OUTPUTBUS_H
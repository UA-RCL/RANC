/// component.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef COMPONENT_H
#define COMPONENT_H

class Router;

#include "packet.h"

class Component {
	public:
        // Called before input spikes are sent into network: can be used to prepare component to recieve spikes before running.
        virtual void prepare() = 0; 
        // Called after input spikes are sent into network: do all processing required for this tick
        virtual void run() = 0;
        // Called every time the router receives a packet meant for this component.
        virtual void receivePacket(Packet packet) = 0;

		Router *router;
		int x, y;
		
		long int schedulerTime = 0;
		long int routerTime = 0;
		long int neuronBlockTime = 0;
		long int totalTime = 0;
};

#endif // COMPONENT_H
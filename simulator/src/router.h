/// router.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef ROUTER_H
#define ROUTER_H

class Component;

// User Defined Headers
#include"packet.h"

/**
 * @brief Routes packets between cores.
 * 
 */
class Router{
	public:
		Router(Component* parent, Router* north, Router* south, Router* west, Router* east);		

		// Receive Functions
		void receiveLocal(Packet packet);
		void receiveWest(Packet packet);
		void receiveEast(Packet packet);
		void receiveSouth(Packet packet);
		void receiveNorth(Packet packet);

		void receiveLocalOrEast(Packet packet);
		void receiveLocalOrWest(Packet packet);

		// Forward Functions
		void forwardEast(Packet packet);
		void forwardWest(Packet packet);
		void forwardNorth(Packet packet);
		void forwardSouth(Packet packet);
		void forwardLocal(Packet packet);

		void forwardSouthOrLocal(Packet packet);
		void forwardNorthOrLocal(Packet packet);

		std::string to_string();

		// The Core that this router belongs to
		Component *parent;		
		
		// The routers north, south, east, and west of this core.
		Router *north;
		Router *south;
		Router *east;
		Router *west;
};
#endif

/// rsouter.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include "router.h"
#include "component.h"
#include "scheduler.h"

// TODO: I can't think of a use for this now, but it may be useful at some point to have trace output for the router.

Router::Router(Component* parent, Router* north, Router* south, Router* west, Router* east) {
	this->parent = parent;
	this->north = north;
	this->south = south;
	this->west = west;
	this->east = east;
}

void Router::receiveLocal(Packet packet) {
	if (packet.dx < 0) {
		receiveLocalOrEast(packet);
	} else {
		receiveLocalOrWest(packet);
	}
}

void Router::receiveWest(Packet packet) {
	receiveLocalOrWest(packet);
}

void Router::receiveEast(Packet packet) {
	receiveLocalOrEast(packet);
}

void Router::receiveSouth(Packet packet) {
	forwardNorthOrLocal(packet);
}

void Router::receiveNorth(Packet packet) {
	forwardSouthOrLocal(packet);
}

void Router::receiveLocalOrEast(Packet packet) {
	if (packet.dx == 0) {
		if (packet.dy < 0) {
			forwardSouthOrLocal(packet);
		} else {
			forwardNorthOrLocal(packet);
		}
	} else {
		packet.incrementDx();
		forwardWest(packet);
	}	
}

void Router::receiveLocalOrWest(Packet packet) {
	if (packet.dx == 0) {
		if (packet.dy < 0) {
			forwardSouthOrLocal(packet);
		} else {
			forwardNorthOrLocal(packet);
		}
	} else {
		packet.decrementDx();
		forwardEast(packet);
	}
}

void Router::forwardLocal(Packet packet) {
	parent->receivePacket(packet);
}

void Router::forwardEast(Packet packet){
	east->receiveWest(packet);
}

void Router::forwardWest(Packet packet) {
	west->receiveEast(packet);
}

void Router::forwardNorth(Packet packet) {
	north->receiveSouth(packet);
}

void Router::forwardSouth(Packet packet) {
	south->receiveNorth(packet);
}

void Router::forwardSouthOrLocal(Packet packet) {
	if (packet.dy == 0) {
		forwardLocal(packet);
	} else {
		packet.incrementDy();
		forwardSouth(packet);
	}
}

void Router::forwardNorthOrLocal(Packet packet) {
	if (packet.dy == 0) {
		forwardLocal(packet);
	} else {
		packet.decrementDy();
		forwardNorth(packet);
	}
}

std::string Router::to_string() {
	return "coordinates: (" + std::to_string(parent->x) + ", " + std::to_string(parent->y) + ")";
}

/// packet.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef PACKET_H
#define PACKET_H

#include <string>

class Packet {
	public:
		int dx, dy;
		int delivery_tick;
		int destination_axon;

		Packet(int dx, int dy, int delivery_tick, int destination_axon);

		void incrementDx();
		void decrementDx();
		void incrementDy();
		void decrementDy();

		std::string to_string();
};


#endif

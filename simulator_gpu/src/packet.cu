/// packet.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include "packet.h"

Packet::Packet(int dx, int dy, int delivery_tick, int destination_axon){
	this->dx = dx;
	this->dy = dy;
	this->delivery_tick = delivery_tick;
	this->destination_axon = destination_axon;
}

void Packet::incrementDx(){
	dx += 1;
}

void Packet::decrementDx(){
	dx -= 1;
}

void Packet::incrementDy(){
	dy += 1;
}

void Packet::decrementDy(){
	dy -= 1;
}

std::string Packet::to_string(){
	return "dx: " + std::to_string(dx) + ", dy: " + std::to_string(dy) + ", delivery_tick: " + std::to_string(delivery_tick) + 
			", destination_axon: " + std::to_string(destination_axon);
}
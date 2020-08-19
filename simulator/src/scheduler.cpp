/// scheduler.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include "scheduler.h"
#include "schedulersram.h"

Scheduler::Scheduler(Core* parent) {
	this->parent = parent;
	this->sram = new SchedulerSRAM(this);
}

// Receives a packet and writes it to the `sram`.
void Scheduler::receivePacket(Packet packet) {
	sram->write(packet.delivery_tick , packet.destination_axon); 
}

// Returns the spikes from the `sram` for the current word.
std::vector<bool> Scheduler::getSpikes() {	
	return sram->getCurrentWord();
}

// Clears the `sram`.
void Scheduler::clear() {
	sram->clearCurrentWord();
}

// Updates the current word in the `sram`.
void Scheduler::updateCurrentWord(){
	sram->updateCurrentWord();
}

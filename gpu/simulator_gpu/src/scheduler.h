/// scheduler.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef SCHEDULER_H
#define SCHEDULER_H

class SchedulerSRAM;

#include "packet.h"
#include "core.h"

class Scheduler {
	public:
		Scheduler(Core* parent);

		void receivePacket(Packet packet);
		void clear();
		void updateCurrentWord();
		bool* getSpikes();
		std::string printCurrentSpikes();
		Core* parent;

		SchedulerSRAM* sram;
};

#endif // SCHEDULER_H

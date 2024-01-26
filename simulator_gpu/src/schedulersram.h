/// schedulersram.h
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#ifndef SCHEDULERSRAM_H
#define SCHEDULERSRAM_H

#include <vector>
#include <string>

#include "scheduler.h"

class SchedulerSRAM{
	public:
		// Default Constructor
		SchedulerSRAM(Scheduler* scheduler);

		void write(int word, int bit);

		bool* getCurrentWord();
		void clearCurrentWord();
		void updateCurrentWord();

		std::string to_string();

		//std::vector<std::vector<bool>> data;
		bool* data;
		int curr_word_index;
		Scheduler* scheduler;
		
		
};

#endif

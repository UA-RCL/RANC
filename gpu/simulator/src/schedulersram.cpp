/// schedulersram.cpps
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <iostream>
#include <sstream>

#include <plog/Log.h>

#include "schedulersram.h"
#include "config.hpp"

SchedulerSRAM::SchedulerSRAM(Scheduler* scheduler){
	this->scheduler = scheduler;
	data = std::vector<std::vector<bool> >(Config::parameters["max_tick_offset"].GetInt(), std::vector<bool>(Config::parameters["num_axons"].GetInt(),0));
	curr_word_index = Config::parameters["max_tick_offset"].GetInt() - 1;
}

std::vector<bool> SchedulerSRAM::getCurrentWord(){
	return data[curr_word_index];
}

void SchedulerSRAM::write(int word, int bit) {
	// Increment word so that it is not written to current timestep
	word++;
	// Offset by current word
	if (word + curr_word_index >= Config::parameters["max_tick_offset"].GetInt()) {
		word += curr_word_index - Config::parameters["max_tick_offset"].GetInt();
	} else {
		word += curr_word_index;
	}

	if (word == curr_word_index) {
		if (Config::traceSpecified()) {
			LOG_DEBUG_(1) << "[WARNING] Packet tried to write to current word in scheduler (core (" << scheduler->parent->x << ", " << scheduler->parent->y << ")" << ", word " << word << ")" << std::endl;
		}
		std::cout << "[WARNING] Packet tried to write to current word in scheduler (core (" << scheduler->parent->x << ", " << scheduler->parent->y << ")" << ", word " << word << ")" << std::endl;
	} else if (data[word][bit] == 1) {
		if (Config::traceSpecified()) {
			LOG_DEBUG_(1) << "[WARNING] Scheduler received duplicate spike in same time tick (core (" << scheduler->parent->x << ", " << scheduler->parent->y << ") word " << word << ").";
		}
		std::cout << "[WARNING] Scheduler received duplicate spike in same time tick (core (" << scheduler->parent->x << ", " << scheduler->parent->y << "),  word " << word << ").";
	} else {
		if (Config::parameters["scheduler_trace_verbosity"].GetInt() == sched_trace_words) {
			LOG_DEBUG_(1) << "~~~ Scheduler (" << scheduler->parent->x << ", " << scheduler->parent->y << ") writes to word " << word << ", bit " << bit << " ~~~";
		}
		data[word][bit] = 1;
	}
}

void SchedulerSRAM::clearCurrentWord() {
	std::fill(data[curr_word_index].begin(), data[curr_word_index].end(), 0);
}

void SchedulerSRAM::updateCurrentWord() {
	if (curr_word_index == Config::parameters["max_tick_offset"].GetInt() - 1) {
		curr_word_index = 0;
	} else {
		curr_word_index++;
	}

	if (Config::parameters["scheduler_trace_verbosity"].GetInt()) {
		std::ostringstream temp;
		for (auto bit : data[curr_word_index]) {
			temp << std::to_string(bit);
		}
		LOG_DEBUG_(1) << "~~~ Scheduler (" << scheduler->parent->x << ", " << scheduler->parent->y << ") updates current word to " << curr_word_index << ". Current line: " << temp.str();
	}
}

std::string SchedulerSRAM::to_string() {
	// TODO: This function isn't going to work for large sram words. Stoi will throw an error because the line won't fit in to an int
	std::stringstream sstream;

	for (auto row : data) {
		std::ostringstream temp;
		for (auto bit : row) {
			temp << std::to_string(bit);
		}
		sstream << std::hex << std::stoi(temp.str(), nullptr, 2);
		sstream << std::endl;
	}

	return sstream.str();
}

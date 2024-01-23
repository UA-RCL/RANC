/// RANC.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <iostream>

#include <plog/Log.h>
#include <chrono>
using namespace std::chrono;

#include "config.hpp"
#include "rancgrid.h"
#include "router.h"
#include "scheduler.h"
#include "neuronblock.h"
#include "csramrow.h"
#include "corecontroller.h"
#include "schedulersram.h"

#define NEURONBLOCK_VERSION 2
#define BLOCK_SIZE 128

RANCGrid::RANCGrid(std::vector<std::vector<Packet>> input_packets, std::vector<Core*> components, OutputBus* output_bus) {
	this->components = components;
	this->input_packets = input_packets;
	this->output_bus = output_bus;
};

void print_array(int * a, int size);

__global__ void neuronBlockCore(CSRAMRow* csram, bool* srams, int* curr_word_index, int* neuron_instructions, bool* chip_output_spikes, int reset_type, int core, int sram_size, int num_axons, int num_neurons) {
	
	bool* input_spikes = srams + core*sram_size;
	input_spikes += curr_word_index[core]*num_axons;
	
	int i = threadIdx.x+blockIdx.x*blockDim.x;
	if (i >= num_neurons) return;
	
	CSRAMRow* csram_row = &csram[core*num_neurons+i];
	int current_potential = csram_row->current_potential;

	// Get active connecitons (where there is both a spike and connection)
	for (int axon = 0; axon < num_axons; axon++) {
		if (csram_row->connections[axon] && input_spikes[axon]) {
			current_potential += csram_row->weights[neuron_instructions[core*num_axons+axon]];
		}
	}
	
	// Apply leak
	current_potential += csram_row->leak;


	// Check for spike
	if (current_potential >= csram_row->positive_threshold) {
		chip_output_spikes[core*num_neurons+i] = true;
	}
	else {
		chip_output_spikes[core*num_neurons+i] = false;
	}

	// Send potential back to csram
	int positive_threshold = csram_row->positive_threshold;
	int negative_threshold = csram_row->negative_threshold;
	int reset_potential = csram_row->reset_potential;
	int reset_mode = csram_row->reset_mode;
	
	switch(reset_type){
		case asymetric_reset:
			if( current_potential >= positive_threshold){
				switch (reset_mode){
					case absolute_reset:
						csram_row->current_potential =  reset_potential;
						return;
					case linear_reset:
						csram_row->current_potential =  current_potential - positive_threshold;
						return;
					default:
						printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
						return;
				}
			} else if( current_potential < negative_threshold){
				switch(reset_mode){
					case absolute_reset:
						csram_row->current_potential =  -reset_potential;
						return;
					case linear_reset:
						csram_row->current_potential =  current_potential - negative_threshold;
						return;
					default:
						printf( "[ERROR] Reset mode out range of acceptable reset modes.");
						return;
				}
			} else {
				csram_row->current_potential =  current_potential;
				return;
			}
			break;
		//-----------------------------------------------------------//
		case symetric_reset:
			if( current_potential >= positive_threshold){
				switch(reset_mode){
					case absolute_reset:
						csram_row->current_potential =  reset_potential;
						return;
					case linear_reset:
						csram_row->current_potential =  current_potential - positive_threshold;
						return;
					default:
						printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
						return;
				}

			}else if( current_potential <= negative_threshold){
				switch(reset_mode){
					case absolute_reset:
						csram_row->current_potential =  -reset_potential;
						return;
					case linear_reset:
						csram_row->current_potential =  current_potential - negative_threshold;
						return;
					default:
						printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
						return;
				}
			}else{
				csram_row->current_potential =  current_potential;
				return;
			}
			break;
		//-----------------------------------------------------------//
		default:
			printf( "[ERROR] Reset Type not accepted at this time.");
			return;
	}
		
	/*if (neuron_block_trace_verbosity == nb_trace_potentials) {
		LOG_DEBUG_(1) << "\tNeuron ends at potential: " << (*csram_row)->current_potential;
	}*/
	
	
}

__global__ void neuronBlockGrid(CSRAMRow* csram, bool* srams, int curr_word_index, int* neuron_instructions, bool* output_spikes, int reset_type, int chip_neuron_count, int num_axons, int num_neurons, int max_tick_offset) {
	// TODO: Shared and constant memory utilization
	int threadID = threadIdx.x+blockIdx.x*blockDim.x;
	if (threadID >= chip_neuron_count) return;

	CSRAMRow* csram_row = &csram[threadID];
	int current_potential = csram_row->current_potential;
	int neuron_instructions_offset = (threadID / num_neurons) * num_axons;
	int axons_offset = (threadID / num_neurons) * num_axons * max_tick_offset + curr_word_index * num_axons;

	// Get active connections (where there is both a spike and connection)
	for (int i = 0; i < num_axons; i++) {
		current_potential += (csram_row->weights[neuron_instructions[neuron_instructions_offset + i]] * csram_row->connections[i] * srams[axons_offset + i]);
	}

	// Apply leak
	current_potential += csram_row->leak;

	// Check for spike
	if (current_potential >= csram_row->positive_threshold) {
		output_spikes[threadID] = true;
	}
	else {
		output_spikes[threadID] = false;
	}

	// Send potential back to csram
	int positive_threshold = csram_row->positive_threshold;
	int negative_threshold = csram_row->negative_threshold;
	int reset_potential = csram_row->reset_potential;
	int reset_mode = csram_row->reset_mode;

	switch(reset_type){
		case asymetric_reset:
			if( current_potential >= positive_threshold){
				switch (reset_mode){
					case absolute_reset:
						csram_row->current_potential =  reset_potential;
						return;
					case linear_reset:
						csram_row->current_potential =  current_potential - positive_threshold;
						return;
					default:
						printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
						return;
				}
			} else if( current_potential < negative_threshold){
				switch(reset_mode){
					case absolute_reset:
						csram_row->current_potential =  -reset_potential;
						return;
					case linear_reset:
						csram_row->current_potential =  current_potential - negative_threshold;
						return;
					default:
						printf( "[ERROR] Reset mode out range of acceptable reset modes.");
						return;
				}
			} else {
				csram_row->current_potential =  current_potential;
				return;
			}
			break;
		//-----------------------------------------------------------//
		case symetric_reset:
			if( current_potential >= positive_threshold){
				switch(reset_mode){
					case absolute_reset:
						csram_row->current_potential =  reset_potential;
						return;
					case linear_reset:
						csram_row->current_potential =  current_potential - positive_threshold;
						return;
					default:
						printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
						return;
				}

			}else if( current_potential <= negative_threshold){
				switch(reset_mode){
					case absolute_reset:
						csram_row->current_potential =  -reset_potential;
						return;
					case linear_reset:
						csram_row->current_potential =  current_potential - negative_threshold;
						return;
					default:
						printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
						return;
				}
			}else{
				csram_row->current_potential =  current_potential;
				return;
			}
			break;
		//-----------------------------------------------------------//
		default:
			printf( "[ERROR] Reset Type not accepted at this time.");
			return;
	}

}

__global__ void neuronBlockSynpse(CSRAMRow* csram, bool* srams, int curr_word_index, int* neuron_instructions, bool* output_spikes, int reset_type, int chip_neuron_count, int num_axons, int num_neurons, int max_tick_offset) {
	// TODO: Shared and constant memory utilization for input_spikes
	int threadID = threadIdx.x+blockIdx.x*blockDim.x;
	if (threadID >= chip_neuron_count*num_axons/2) return;

	int axons_offset = blockIdx.x/num_neurons * num_axons * max_tick_offset + curr_word_index * num_axons;
	
	CSRAMRow* csram_row = &csram[blockIdx.x];
	extern __shared__ int current_potential[];	

	/********************** Shared Memory phase **********************/
    int tmp1 = int(csram_row->connections[threadIdx.x]) * int(srams[axons_offset + threadIdx.x]);
    int tmp2 = int(csram_row->connections[threadIdx.x+blockDim.x]) * int(srams[axons_offset + threadIdx.x + blockDim.x]);
    current_potential[threadIdx.x] = tmp1 * csram_row->weights[neuron_instructions[((blockIdx.x/num_neurons) * num_axons) + threadIdx.x]]
                                    + tmp2 * csram_row->weights[neuron_instructions[((blockIdx.x/num_neurons) * num_axons) + threadIdx.x + blockDim.x]];
    __syncthreads();

	/********************** Reduction Tree ****************************/
    for(unsigned int stride = blockDim.x/ 2; stride > 0; stride >>= 1){
        if(threadIdx.x < stride){
            current_potential[threadIdx.x] = current_potential[threadIdx.x] + current_potential[threadIdx.x+stride];
        }
        __syncthreads();
    }

	/*********************** Neuron update *****************************/
    if (threadIdx.x == 0) {
        int current_potential_local;
        current_potential_local = current_potential[0] + csram_row->current_potential;

        // Apply leak
        current_potential_local += csram_row->leak;

        // Check for spike
        if (current_potential_local >= csram_row->positive_threshold) {
            output_spikes[blockIdx.x] = true;
            //router->receiveLocal(Packet((*csram_row)->dx, (*csram_row)->dy, (*csram_row)->destination_tick, (*csram_row)->destination_axon));
        } else {
            output_spikes[blockIdx.x] = false;
        }

        // Send potential back to csram
        int positive_threshold = csram_row->positive_threshold;
        int negative_threshold = csram_row->negative_threshold;
        int reset_potential = csram_row->reset_potential;
        int reset_mode = csram_row->reset_mode;

        switch (reset_type) {
            case asymetric_reset:
                if (current_potential_local >= positive_threshold) {
                    switch (reset_mode) {
                        case absolute_reset:
                            csram_row->current_potential = reset_potential;
                            return;
                        case linear_reset:
                            csram_row->current_potential = current_potential_local - positive_threshold;
                            return;
                        default:
                            printf("[ERROR] Reset mode out of range of acceptable reset modes.");
                            return;
                    }
                } else if (current_potential_local < negative_threshold) {
                    switch (reset_mode) {
                        case absolute_reset:
                            csram_row->current_potential = -reset_potential;
                            return;
                        case linear_reset:
                            csram_row->current_potential = current_potential_local - negative_threshold;
                            return;
                        default:
                            printf("[ERROR] Reset mode out range of acceptable reset modes.");
                            return;
                    }
                } else {
                    csram_row->current_potential = current_potential_local;
                    return;
                }
                break;
                //-----------------------------------------------------------//
            case symetric_reset:
                if (current_potential_local >= positive_threshold) {
                    switch (reset_mode) {
                        case absolute_reset:
                            csram_row->current_potential = reset_potential;
                            return;
                        case linear_reset:
                            csram_row->current_potential = current_potential_local - positive_threshold;
                            return;
                        default:
                            printf("[ERROR] Reset mode out of range of acceptable reset modes.");
                            return;
                    }

                } else if (current_potential_local <= negative_threshold) {
                    switch (reset_mode) {
                        case absolute_reset:
                            csram_row->current_potential = -reset_potential;
                            return;
                        case linear_reset:
                            csram_row->current_potential = current_potential_local - negative_threshold;
                            return;
                        default:
                            printf("[ERROR] Reset mode out of range of acceptable reset modes.");
                            return;
                    }
                } else {
                    csram_row->current_potential = current_potential_local;
                    return;
                }
                break;
                //-----------------------------------------------------------//
            default:
                printf("[ERROR] Reset Type not accepted at this time.");
                return;
        }

        /*if (neuron_block_trace_verbosity == nb_trace_potentials) {
            LOG_DEBUG_(1) << "\tNeuron ends at potential: " << (*csram_row)->current_potential;
        }*/

    }

}

__global__ void schedulerKernel(bool* srams, int* curr_word_indexes, int max_tick_offset, int num_axons, int num_cores) {
	int i = threadIdx.x + blockIdx.x*blockDim.x;
	int core = i / num_axons;
	int axon = i % num_axons;

	int core_starting_index = core*(num_axons*max_tick_offset);
	
	srams[core_starting_index + curr_word_indexes[core]*num_axons + axon] = 0;
	
	if (i < num_cores) {
		if (curr_word_indexes[i] == max_tick_offset - 1) {
			curr_word_indexes[i] = 0;
		} else {
			curr_word_indexes[i]++;
		}
	}
	
}

__global__ void packetKernel(Packet* packets, int num_packets, bool* srams, int* curr_word_indexes, int num_axons, int num_neurons, int max_tick_offset, int width_cores, int num_cores) {
	
	int i = threadIdx.x + blockIdx.x * blockDim.x;
	
	if (i >= num_packets) return;
	
	int coreNum = packets[i].dx + packets[i].dy * width_cores;
		
	if (coreNum >= num_cores) {
		printf("[ERROR] Input packet tried to leave the grid to core %d (there are %d cores)\n", coreNum, gridDim.x*blockDim.x/num_neurons);
	}
	
	int word = packets[i].delivery_tick + 1;
	int axon = packets[i].destination_axon;
	
	// Increment word so that it is not written to current timestep

	// Offset by current word
	if (word + curr_word_indexes[coreNum] >= max_tick_offset) {
		word += curr_word_indexes[coreNum] - max_tick_offset;
	} else {
		word += curr_word_indexes[coreNum];
	}
	
	if (word == curr_word_indexes[coreNum]) {
		printf("[WARNING] Packet tried to write to current word in scheduler (core (%d, %d), word %d)", coreNum % width_cores, coreNum / width_cores, word);
	} else if (srams[coreNum*(num_axons*max_tick_offset)+word*num_axons+axon] == 1) {
		printf("[WARNING] Scheduler received duplicate external spike in same time tick (core (%d, %d), word %d)", coreNum % width_cores, coreNum / width_cores, word);
	} else {
		srams[coreNum*(num_axons*max_tick_offset)+word*num_axons+axon] = 1;
	}
	
}

__global__ void routerKernel(CSRAMRow* csrams, bool* chip_output_spikes, bool* srams, int* curr_word_indexes, int num_axons, int num_neurons, int max_tick_offset, int width_cores, int num_cores) {
	int i = threadIdx.x + blockIdx.x * blockDim.x;
	int core = i / num_neurons;
	int neuron = i % num_neurons;
	
	if (!chip_output_spikes[core*num_neurons+neuron]) return;
		
	int coreNum = core + csrams[core*num_neurons+neuron].dx + csrams[core*num_neurons+neuron].dy * width_cores;
	
	if (coreNum >= num_cores) {
		printf("[ERROR] Generated packet tried to leave the grid\n");
	}
	
	int word = csrams[core*num_neurons+neuron].destination_tick + 1;
	int axon = csrams[core*num_neurons+neuron].destination_axon;
	
	// Increment word so that it is not written to current timestep

	// Offset by current word
	if (word + curr_word_indexes[coreNum] >= max_tick_offset) {
		word += curr_word_indexes[coreNum] - max_tick_offset;
	} else {
		word += curr_word_indexes[coreNum];
	}
	
	if (word == curr_word_indexes[coreNum]) {
		printf("[WARNING] Packet tried to write to current word in scheduler (core (%d, %d), word %d)\n", coreNum % width_cores, coreNum / width_cores, word);
	} else if (srams[coreNum*(num_axons*max_tick_offset)+word*num_axons+axon] == 1) {
		printf("[WARNING] Scheduler received duplicate internal spike in same time tick (core (%d, %d), word %d)\n", coreNum % width_cores, coreNum / width_cores, word);
	} else {
		srams[coreNum*(num_axons*max_tick_offset)+word*num_axons+axon] = 1;
	}
	
}

void dump_sram(bool* srams_device, bool* srams, int num_cores, int num_axons, int max_tick_offset, int curr_word_index){
	cudaError_t err = cudaMemcpy(srams, srams_device, num_cores*num_axons*max_tick_offset*sizeof(bool), cudaMemcpyDeviceToHost);
	if (err != cudaSuccess) printf("%s\n", cudaGetErrorString(err));
	
	for (int i = 0; i < num_cores; i++) {
		for (int j = 0; j < num_axons; j++) {
			std::cout << srams[i*num_axons*max_tick_offset+curr_word_index*num_axons+j];
		}
		std::cout << std::endl;
	}
}

void print_array(int * a, int size){
	printf("\n##############################Array##############################\n");
	for(int i = 0; i < size; i++){
	printf("%d ", a[i]);
	}
	printf("\n##############################End of Array##############################\n\n");
	return;
}

void RANCGrid::beginActivity(int num_ticks, int report_frequency) {
	
	long int schedulerTime = 0;
	long int neuronBlockTime = 0;
	long int routerTime = 0;
	long int outputTime = 0;
	long int GPULoadTime = 0;
	
	cudaError_t err;
	int gridDimension;
	int blockDimension;

	// save some parameters for easier use
	int num_cores = Config::parameters["num_cores_x"].GetInt()*Config::parameters["num_cores_y"].GetInt();
	int num_neurons = Config::parameters["num_neurons"].GetInt();
	int num_axons = Config::parameters["num_axons"].GetInt();
	int total_neurons = num_cores*num_neurons;
	int max_tick_offset = Config::parameters["max_tick_offset"].GetInt();
	int curr_word_index = Config::parameters["max_tick_offset"].GetInt() - 1;;
	int output_core = output_bus->x + output_bus->y*Config::parameters["num_cores_x"].GetInt();
	int sram_size = sizeof(bool)*Config::parameters["max_tick_offset"].GetInt()*Config::parameters["num_axons"].GetInt();
	
	std::cout << "Input file parsing done, now initializing GPU memory." << std::endl;
	
	auto clock = high_resolution_clock::now();
	
	// BEGIN ----- Scheduler, Router, Packet variables -----
	
	// sram CPU copy
	bool* srams = (bool*)malloc(num_cores*sram_size);
	if (srams == NULL) std::cout << "[ERROR] Memory allocation for SRAM failed, simulation will fail";
	
	// sram GPU copy
	bool* srams_device;
	err = cudaMalloc((void **) &srams_device, num_cores*sram_size);
	if (err != cudaSuccess) printf("%s\n", cudaGetErrorString(err));

	// curr_word_indexes CPU&GPU copy
	int* curr_word_indexes = (int*)malloc(num_cores*sizeof(int));
	int* curr_word_indexes_device;
	err = cudaMalloc((void **) &curr_word_indexes_device, num_cores*sizeof(int));
	if (err != cudaSuccess) printf("%s\n", cudaGetErrorString(err));
	
	// populate CPU sram and curr_word_indexes data from serialized data
	for (int core = 0; core < num_cores; core++) {
		for (int tick = 0; tick < Config::parameters["max_tick_offset"].GetInt(); tick++) {
			for (int axon = 0; axon < Config::parameters["num_axons"].GetInt(); axon++) {
				srams[core*sram_size + tick*Config::parameters["num_axons"].GetInt() + axon] = components[core]->scheduler->sram->data[tick*Config::parameters["num_axons"].GetInt()+axon];
			}
		}
		curr_word_indexes[core] = components[core]->scheduler->sram->curr_word_index;
	}
	
	// copy sram and curr_word_indexes data to GPU
	err = cudaMemcpy(srams_device, srams, num_cores*sram_size, cudaMemcpyHostToDevice);
	if (err != cudaSuccess) printf("%s\n", cudaGetErrorString(err));
	err = cudaMemcpy(curr_word_indexes_device, curr_word_indexes, num_cores*sizeof(int), cudaMemcpyHostToDevice);
	if (err != cudaSuccess) printf("%s\n", cudaGetErrorString(err));
	
	Packet* packets_device;
	
	
	// END ----- Scheduler, Router, Packet variables -----
	
	
	
	
	// BEGIN ----- NeuronBlock variables -----
	
	// Create CSRAM GPU data copy
	int ranc_num_cores = Config::parameters["num_cores_x"].GetInt() * Config::parameters["num_cores_y"].GetInt();
	CSRAMRow *chip_csram_host;
	CSRAMRow *chip_csram_device;
    int *chip_neuron_instructions_host;
    int *chip_neuron_instructions_device;
    chip_csram_host = (CSRAMRow *)calloc(ranc_num_cores * num_neurons, sizeof(CSRAMRow));
    chip_neuron_instructions_host = (int *)calloc(ranc_num_cores * NUM_AXONS, sizeof(int));

    if (cudaMalloc((void**) &chip_csram_device, ranc_num_cores * num_neurons * sizeof(CSRAMRow)) != cudaSuccess){
        printf("Failed to allocate memory for Chip level CSRAM on GPU\n");
    }
    if (cudaMalloc((void**) &chip_neuron_instructions_device, ranc_num_cores * NUM_AXONS * sizeof(int)) != cudaSuccess){
        printf("Failed to allocate memory for Chip level Neuron Instructions on GPU\n");
    }

    // Copy values from cores into chip level csram and neuron instructions
    int neuron_offset = 0;
    int axon_offset = 0;
    for(auto core: components){
        for (int i=0; i < num_neurons; i++){
            chip_csram_host[neuron_offset + i] = core->core_controller->csram_dereferenced[i];
        }
        neuron_offset += num_neurons;

        for (int i = 0; i < NUM_AXONS; i++){
            chip_neuron_instructions_host[axon_offset + i] = core->core_controller->neuron_instructions_dereferenced[i];
        }
        axon_offset += NUM_AXONS;
    }
    // Copy values to device
    if (cudaMemcpy(chip_csram_device, chip_csram_host, ranc_num_cores * num_neurons * sizeof(CSRAMRow), cudaMemcpyHostToDevice) != cudaSuccess){
        printf("Failed to copy Chip level CSRAM to device\n");
    }
    if (cudaMemcpy(chip_neuron_instructions_device, chip_neuron_instructions_host, ranc_num_cores * NUM_AXONS * sizeof(int), cudaMemcpyHostToDevice) != cudaSuccess){
        printf("Failed to copy Chip level Neuron Instructions to device\n");
    }

    // Allocate chip level output spike array
    bool *chip_output_spikes_device;
    bool *chip_output_spikes_host = (bool *)calloc(ranc_num_cores * num_neurons, sizeof(bool));
    if (cudaMalloc((void **)&chip_output_spikes_device, ranc_num_cores * num_neurons * sizeof(bool)) != cudaSuccess){
        printf("Failed to allocate device memory for chip level output spikes\n");
    }
	
	
	// END ----- NeuronBlock variables -----
	
	GPULoadTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();
	std::cout << "Done allocating and copying GPU memory, cumulative overhead of " << GPULoadTime << " microseconds." << std::endl;
	
	
	std::cout << "Starting simulation with " << num_ticks << " ticks." << std::endl;
	
	if (Config::traceSpecified()) {
		LOG_DEBUG_(1) << "Starting simulation with " << num_ticks << " ticks.";
	}

	// FIXME: max_tick_offset of 16 will actually correspond to a max of 15 ticks in the future being able to be specified. We need error checking for this as well.	
	if (input_packets.size() > 0) {
		int numPackets = input_packets[0].size();
		if (numPackets != 0) {
			gridDimension = (numPackets + BLOCK_SIZE - 1) / BLOCK_SIZE;
			blockDimension = min(numPackets, BLOCK_SIZE);
			
			err = cudaMalloc((void **) &packets_device, numPackets*sizeof(Packet));
			if (err != cudaSuccess) printf("Error in prerouting: %s\n", cudaGetErrorString(err));
			
			err = cudaMemcpy(packets_device, &(input_packets[0][0]), sizeof(Packet)*(numPackets), cudaMemcpyHostToDevice);
			if (err != cudaSuccess) printf("Error in prerouting: %s\n", cudaGetErrorString(err));
			
			packetKernel<<<gridDimension, blockDimension>>>(packets_device, numPackets, srams_device, curr_word_indexes_device, num_axons, num_neurons, max_tick_offset, Config::parameters["num_cores_x"].GetInt(), num_cores);
			err = cudaGetLastError();
			if (err != cudaSuccess) printf("Error in prerouting: %s\n", cudaGetErrorString(err));
			err = cudaDeviceSynchronize();
			if (err != cudaSuccess) printf("Error in prerouting: %s\n", cudaGetErrorString(err));
		}
	}
	
	// Iterate through each tick
	for (unsigned int tick = 1; tick <= num_ticks; tick++) {		
		
		if (tick % report_frequency == 0) {
			std::cout << "Tick " << tick << " started" << std::endl;
		}

		if (Config::traceSpecified()) {
			LOG_DEBUG_(1) << "-------------------- Tick " << tick << " begins --------------------";
		}
		
		// KERNEL BEGIN: Scheduler
		clock = high_resolution_clock::now();
		
		int total_axons = num_cores * num_axons;
		gridDimension = (total_axons + BLOCK_SIZE - 1) / BLOCK_SIZE;
		blockDimension = min(total_axons, BLOCK_SIZE);
		
		schedulerKernel<<<gridDimension, blockDimension>>>(srams_device, curr_word_indexes_device, max_tick_offset, num_axons, num_cores);
		err = cudaGetLastError();
		if (err != cudaSuccess) printf("Error in scheduler: %s\n", cudaGetErrorString(err));
		
		err = cudaDeviceSynchronize();
		if (err != cudaSuccess) printf("Error in scheduler: %s\n", cudaGetErrorString(err));
			
		schedulerTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();
		// KERNEL END: Scheduler
		
		
		
		
		
		
		if (curr_word_index == Config::parameters["max_tick_offset"].GetInt() - 1) {
			curr_word_index = 0;
		} else {
			curr_word_index++;
		}
		
		
		
		// KERNEL BEGIN: Packet
		clock = high_resolution_clock::now();
		
		if (input_packets.size() > tick) {

			int numPackets = input_packets[tick].size();
			if (numPackets != 0) {
				gridDimension = (numPackets + BLOCK_SIZE - 1) / BLOCK_SIZE;
				blockDimension = min(numPackets, BLOCK_SIZE);
				
				err = cudaMalloc((void **) &packets_device, numPackets*sizeof(Packet));
				if (err != cudaSuccess) printf("Error in packet: %s\n", cudaGetErrorString(err));
				
				err = cudaMemcpy(packets_device, &(input_packets[tick][0]), sizeof(Packet)*(numPackets), cudaMemcpyHostToDevice);
				if (err != cudaSuccess) printf("Error in packet: %s\n", cudaGetErrorString(err));
				
				packetKernel<<<gridDimension, blockDimension>>>(packets_device, numPackets, srams_device, curr_word_indexes_device, num_axons, num_neurons, max_tick_offset, Config::parameters["num_cores_x"].GetInt(), num_cores);
				err = cudaGetLastError();
				if (err != cudaSuccess) printf("Error in packet: %s\n", cudaGetErrorString(err));
				
				err = cudaDeviceSynchronize();
				if (err != cudaSuccess) printf("Error in packet: %s\n", cudaGetErrorString(err));
		
				cudaFree(packets_device);
			}

		}
	
		routerTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();
		// KERNEL END: Packet
		
		
		
		// KERNEL BEGIN: NeuronBlock
		clock = high_resolution_clock::now();
		
		if (cudaMemcpy(chip_output_spikes_device, chip_output_spikes_host, ranc_num_cores * num_neurons * sizeof(bool), cudaMemcpyHostToDevice) != cudaSuccess){
			printf("Failed to copy device memory from chip level output spikes\n");
		}
		/*if (cudaMemset(chip_output_spikes_device, 0, ranc_num_cores * num_neurons * sizeof(bool)) != cudaSuccess){
			printf("Failed to wipe device chip level output spikes\n");
		}*/
		
		
		// Original core-level parallelism kernel (thread->neuron)
		if (NEURONBLOCK_VERSION == 0) {
			for (int core = 0; core < num_cores; core++) {
			
				gridDimension = (num_neurons + BLOCK_SIZE - 1) / BLOCK_SIZE;
				blockDimension = min(num_neurons, BLOCK_SIZE);
								
				neuronBlockCore<<<gridDimension, blockDimension>>>(chip_csram_device,
																srams_device,
																curr_word_indexes_device,
																chip_neuron_instructions_device,
																chip_output_spikes_device,
																Config::parameters["neuron_reset_type"].GetInt(),
																core,
																sram_size,
																num_axons,
																num_neurons);
				err = cudaGetLastError();
				if (err != cudaSuccess) printf("Error in neuronBlock: %s\n", cudaGetErrorString(err));
				
			}

		}
		
		// Sahil's grid-level parallelism kernel (thread->neuron)
		else if (NEURONBLOCK_VERSION == 1) {

			gridDimension = ceil(total_neurons/(float)blockDimension);
			blockDimension = min(total_neurons, BLOCK_SIZE);
			
			neuronBlockGrid<<<gridDimension, blockDimension>>>(chip_csram_device,
														   srams_device,
														   curr_word_index,
														   chip_neuron_instructions_device,
														   chip_output_spikes_device,
														   Config::parameters["neuron_reset_type"].GetInt(),
														   ranc_num_cores*num_axons,
														   num_axons,
														   num_neurons,
														   max_tick_offset);
			err = cudaGetLastError();
			if (err != cudaSuccess) printf("[cudaKernelLaunch]: %s\n", cudaGetErrorString(err));
			
		}
		
		//Ilkin's grid-synapse-level kernel (thread->axon)
		else if (NEURONBLOCK_VERSION == 2) {
			
			blockDimension = num_axons/2;
			gridDimension = ranc_num_cores * num_neurons;
			
			neuronBlockSynpse<<<gridDimension, blockDimension, sizeof(int)*num_axons/2>>>(chip_csram_device,
														   srams_device,
														   curr_word_index,
														   chip_neuron_instructions_device,
														   chip_output_spikes_device,
														   Config::parameters["neuron_reset_type"].GetInt(),
														   ranc_num_cores*num_axons,
														   num_axons,
														   num_neurons,
														   max_tick_offset);
			err = cudaGetLastError();
			if (err != cudaSuccess) printf("[cudaKernelLaunch]: %s\n", cudaGetErrorString(err));
		}
		
		else {
			std::cout << "ERROR: Invalid neuronblock kernel version selected. Simulation will fail." << std::endl;
			return;
		}
		
		err = cudaDeviceSynchronize();
		if (err != cudaSuccess) printf("Error in neuronBlock: %s\n", cudaGetErrorString(err));
		
		// Need to copy back the output core's spikes, regardless of neruonBlock version
		bool* output_core_spikes_device = srams_device + output_core*sram_size + curr_word_index*num_axons;

		err = cudaMemcpy(&components[output_core]->scheduler->sram->data[curr_word_index*num_axons], output_core_spikes_device, num_axons*sizeof(bool), cudaMemcpyDeviceToHost);
		if (err != cudaSuccess) printf("Error in neuronblock/output copyback: %s\n", cudaGetErrorString(err));
		

		neuronBlockTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();
		// KERNEL END: NeuronBlock
		
		
		
		
		// SERIAL BEGIN: write output_bus output spikes to output
		clock = high_resolution_clock::now();
		
		output_bus->scheduler->sram->curr_word_index = curr_word_index;
		LOG_INFO_(0) << output_bus->scheduler->printCurrentSpikes();
		
		outputTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();
		// SERIAL END: end write output_bus output spikes to output
		
		
		

		// KERNEL BEGIN: Router
		clock = high_resolution_clock::now();
		
		int numCoresX = Config::parameters["num_cores_x"].GetInt(); //Equivalent to Width
		gridDimension = (total_neurons + BLOCK_SIZE - 1) / BLOCK_SIZE;
		blockDimension = min(total_neurons, BLOCK_SIZE);
		
		routerKernel<<<gridDimension, blockDimension>>>(chip_csram_device, chip_output_spikes_device, srams_device, curr_word_indexes_device, num_axons, num_neurons, max_tick_offset, numCoresX, num_cores);
		err = cudaGetLastError();
		if (err != cudaSuccess) printf("Error in router execution: %s\n", cudaGetErrorString(err));

		err = cudaDeviceSynchronize();
		if (err != cudaSuccess) printf("Error in router synchronize: %s\n", cudaGetErrorString(err));
			
		routerTime += duration_cast<microseconds>(high_resolution_clock::now() - clock).count();
		// KERNEL BEGIN: Router
	}
	
	std::cout << "cumulative scheduler operations took " << schedulerTime << " microseconds" << std::endl;
	std::cout << "cumulative neuronBlock operations took " << neuronBlockTime << " microseconds" << std::endl;
	std::cout << "cumulative router operations took " << routerTime << " microseconds" << std::endl;
	std::cout << "cumulative output operations took " << outputTime << " microseconds" << std::endl;
	
	// FIXME: Please free the cuda memories
	cudaFree(srams_device);
	cudaFree(curr_word_indexes_device);
	
	cudaFree(chip_csram_device);
	cudaFree(chip_neuron_instructions_device);
	cudaFree(chip_output_spikes_device);
	
}
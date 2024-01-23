/// neuronblock.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include<cuda.h>
#include <stdio.h>

#include "neuronblock.h"


__device__ __host__ NeuronBlock::NeuronBlock(){
    this->current_potential = 0;
    this->reset_type = 1;
}

__device__ __host__ NeuronBlock::NeuronBlock(int reset_type){
    this->current_potential = 0;
    this->reset_type = reset_type;
}

__device__ __host__ NeuronBlock::NeuronBlock(int reset_type, int current_potential){
    this->current_potential = current_potential;
    this->reset_type = reset_type;
}

__device__ __host__ void NeuronBlock::integrate(int synaptic_weights[NUM_WEIGHTS], int neuron_instruction) {
	current_potential += synaptic_weights[neuron_instruction];
}

__device__ __host__ void NeuronBlock::leak(int leak){
	current_potential += leak;
}

__device__ __host__ bool NeuronBlock::spikes(int positive_threshold){
	return current_potential >= positive_threshold;
}

__device__ __host__ int NeuronBlock::output_potential(int positive_threshold, int negative_threshold, int reset_potential, int reset_mode) {
	
	switch(reset_type){
            case asymetric_reset:
                if( current_potential >= positive_threshold){
                    switch (reset_mode){
                        case absolute_reset:
                            return reset_potential;
                        
                        case linear_reset:
                            return current_potential - positive_threshold;

                        default:
                            printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
                    }
                } else if( current_potential < negative_threshold){
                    switch(reset_mode){
                        case absolute_reset:
                            return -reset_potential;

                        case linear_reset:
                            return current_potential - negative_threshold;

                        default:
                            printf( "[ERROR] Reset mode out range of acceptable reset modes.");
                    }
                } else {
                    return current_potential;
                }
                break;
            //-----------------------------------------------------------//
            case symetric_reset:
                if( current_potential >= positive_threshold){
                    switch(reset_mode){
                        case absolute_reset:
                            return reset_potential;

                        case linear_reset:
                            return current_potential - positive_threshold;

                        default:
                            printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
                    }

                }else if( current_potential <= negative_threshold){
                    switch(reset_mode){
                        case absolute_reset:
                            return -reset_potential;

                        case linear_reset:
                            return current_potential - negative_threshold;

                        default:
                            printf( "[ERROR] Reset mode out of range of acceptable reset modes.");
                    }
                }else{
                    return current_potential;
                }
                break;
            //-----------------------------------------------------------//
            default:
                printf( "[ERROR] Reset Type not accepted at this time.");
        }
	printf( "[ERROR] Reset Type not accepted at this time.");
	return 0;
}

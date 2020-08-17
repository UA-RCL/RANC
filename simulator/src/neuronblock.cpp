/// neuronblock.cpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///
///

#include <string>

#include "neuronblock.h"

NeuronBlock::NeuronBlock(){
    this->current_potential = 0;
    this->reset_type = 1;
}

NeuronBlock::NeuronBlock(int reset_type){
    this->current_potential = 0;
    this->reset_type = reset_type;
}

NeuronBlock::NeuronBlock(int reset_type, int current_potential){
    this->current_potential = current_potential;
    this->reset_type = reset_type;
}

void NeuronBlock::integrate(std::vector<int> synaptic_weights, int neuron_instruction) {
	current_potential += synaptic_weights[neuron_instruction];
}

void NeuronBlock::leak(int leak){
	current_potential += leak;
}

bool NeuronBlock::spikes(int positive_threshold){
	return current_potential >= positive_threshold;
}

int NeuronBlock::output_potential(int positive_threshold, int negative_threshold, int reset_potential, int reset_mode) {
	switch(reset_type){
            case asymetric_reset:
                if( current_potential >= positive_threshold){
                    switch (reset_mode){
                        case absolute_reset:
                            return reset_potential;
                        
                        case linear_reset:
                            return current_potential - positive_threshold;

                        default:
                            throw "[ERROR] Reset mode of " + std::to_string(reset_mode) + " out of range of acceptable reset modes.";
                    }
                } else if( current_potential < negative_threshold){
                    switch(reset_mode){
                        case absolute_reset:
                            return -reset_potential;

                        case linear_reset:
                            return current_potential - negative_threshold;

                        default:
                            throw "[ERROR] Reset mode of " + std::to_string(reset_mode) + " out of range of acceptable reset modes.";
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
                            throw "[ERROR] Reset mode of " + std::to_string(reset_mode) + " out of range of acceptable reset modes.";
                    }

                }else if( current_potential <= negative_threshold){
                    switch(reset_mode){
                        case absolute_reset:
                            return -reset_potential;

                        case linear_reset:
                            return current_potential - negative_threshold;

                        default:
                            throw "[ERROR] Reset mode of " + std::to_string(reset_mode) + " out of range of acceptable reset modes.";
                    }
                }else{
                    return current_potential;
                }
                break;
            //-----------------------------------------------------------//
            default:
                throw "[ERROR] Reset Type of " + std::to_string(reset_type) + " not accepted at this time.";
        }
}

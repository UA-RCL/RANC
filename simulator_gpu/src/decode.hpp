/// decode.hpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///

#ifndef DECODE_H
#define DECODE_H

#include <vector>
#include <string>
#include <iostream>
#include <algorithm>

#include <rapidjson/document.h>
#include <rapidjson/filereadstream.h>

#include "config.hpp"
#include "outputbus.h"
#include "csramrow.h"
#include "corecontroller.h"
#include "packet.h"
#include "core.h"


// FIXME: This could probably all be way cleaner with generics or just a more thought out error throwing strategy. Maybe the rapidjson error throwing is clear enough and we don't need to do any of this lol.

namespace Decode {

    class InputDecodingException : public std::exception {
        
        public:
            std::string message;

            InputDecodingException(std::string message) {
                this->message = message;
            }

            virtual const char* what() const throw () {
                return message.c_str();
            }
    };
    
    std::vector<int> parsePacketDestinationCore(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("destination_core")) {
            throw InputDecodingException("Packet object does not have a destination_core member.");
        }
        if (!(*itr)["destination_core"].IsArray()) {
            throw InputDecodingException("Packet destination_core object could not be parsed as an array.");
        }
        if ((*itr)["destination_core"].Size() != 2) {
            throw InputDecodingException("Packet destination_core array does not have two values.");
        }
        if (!(*itr)["destination_core"][0].IsInt() || !(*itr)["destination_core"][1].IsInt()) {
            throw InputDecodingException("Packet destination_core array value is not an integer.");
        }
        if ((*itr)["destination_core"][0].GetInt() >= Config::parameters["num_cores_x"].GetInt() || (*itr)["destination_core"][1].GetInt() >= Config::parameters["num_cores_y"].GetInt()) {
            throw InputDecodingException("Packet destination_core is out of range of num_cores_x or num_cores_y.");
        }
        return std::vector<int>{(*itr)["destination_core"][0].GetInt(), (*itr)["destination_core"][1].GetInt()};
    }
    
    int parsePacketDestinationAxon(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("destination_axon")) {
            throw InputDecodingException("Packet object does not have a destination_axon member.");
        }
        if (!(*itr)["destination_axon"].IsInt()) {
            throw InputDecodingException("Packet destination_axon object could not be parsed as an integer.");
        }
        if ((*itr)["destination_axon"].GetInt() >= Config::parameters["num_axons"].GetInt()) {
            throw InputDecodingException("Packet destination_axon is >= num_axons.");
        }
        return(*itr)["destination_axon"].GetInt();
    }
    
    int parsePacketDestinationTick(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("destination_tick")) {
            throw InputDecodingException("Packet object does not have a destination_tick member.");
        }
        if (!(*itr)["destination_tick"].IsInt()) {
            throw InputDecodingException("Packet destination_tick object could not be parsed as an integer.");
        }
        if ((*itr)["destination_tick"].GetInt() >= Config::parameters["max_tick_offset"].GetInt()) {
            throw InputDecodingException("Packet destination_tick is >= max_tick_offset.");
        }
        return(*itr)["destination_tick"].GetInt();
    }
    
    std::vector<std::vector<Packet>> parseInputPackets(std::string file_name, int num_ticks) {

        // FIXME: Input packets should probably be parsed tick by tick to save memory?
        std::vector<std::vector<Packet>> packets(num_ticks);
        
        FILE* fp = std::fopen(file_name.c_str(), "r");
        // FIXME: Is this size going to matter?
        char readBuffer[65536];
        rapidjson::FileReadStream is(fp, readBuffer, sizeof(readBuffer));
        
        rapidjson::Document document;
        
        if (document.ParseStream(is).HasParseError()) {
            throw InputDecodingException("Could not parse input JSON");
        }
        
        const rapidjson::Value& packets_json = document["packets"];
        
        if (!packets_json.IsArray()) {
            throw InputDecodingException("Packet json could not be parsed as an array object.");
        }
        
        int i = 0;
        
        for (rapidjson::Value::ConstValueIterator tick_itr = packets_json.Begin(); tick_itr != packets_json.End(); tick_itr++) {
            if (!tick_itr->IsArray()) {
                throw InputDecodingException("Inner array of packet json could not be parsed as an array object.");
            }
            std::vector<Packet> temp;
            for (rapidjson::Value::ConstValueIterator packet_itr = tick_itr->Begin(); packet_itr != tick_itr->End(); packet_itr++) {
                std::vector<int> destination_core = parsePacketDestinationCore(packet_itr);
                int destination_tick = parsePacketDestinationTick(packet_itr);
                int destination_axon = parsePacketDestinationAxon(packet_itr);
                
                temp.push_back(Packet(destination_core[0], destination_core[1], destination_tick, destination_axon));
            }
            
            packets[i++] = temp;
            if (i == num_ticks) {
                break;
            }
        }
        
        return packets;
    }
    
    std::vector<int> parseCoreCoordinates(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("coordinates")) {
            throw InputDecodingException("Core object does not have a coordinates member.");
        }
        if (!(*itr)["coordinates"].IsArray()) {
            throw InputDecodingException("Core coordinates object could not be parsed as an array.");
        }
        if ((*itr)["coordinates"].Size() != 2) {
            throw InputDecodingException("Core coordinates array does not have two values.");
        }
        if (!(*itr)["coordinates"][0].IsInt() || !(*itr)["coordinates"][1].IsInt()) {
            throw InputDecodingException("Core coordinates array value is not an integer.");
        }
        if ((*itr)["coordinates"][0].GetInt() >= Config::parameters["num_cores_x"].GetInt() || (*itr)["coordinates"][1].GetInt() >= Config::parameters["num_cores_y"].GetInt()) {
            throw InputDecodingException("Core coordinates (" + std::to_string((*itr)["coordinates"][0].GetInt()) + ", " + std::to_string((*itr)["coordinates"][1].GetInt()) + ") is out of range of num_cores_x or num_cores_y.");
        }
        return std::vector<int>{(*itr)["coordinates"][0].GetInt(), (*itr)["coordinates"][1].GetInt()};
    }
    
    const rapidjson::Value& parseCoreNeurons(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("neurons")) {
            throw InputDecodingException("Core object does not have a neurons member.");
        }
        if (!(*itr)["neurons"].IsArray()) {
            throw InputDecodingException("Core neurons object could not be parsed as an array.");
        }
        if ((*itr)["neurons"].Size() > Config::parameters["num_neurons"].GetInt()) {
            throw InputDecodingException("Size of core neurons array is >= num_neurons.");
        }
        return (*itr)["neurons"];
    }
    
    void parseCoreConnections(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("connections")) {
            throw InputDecodingException("Core object does not have a connections member.");
        }
        if (!(*itr)["connections"].IsArray()) {
            throw InputDecodingException("Neuron connections object could not be parsed as an array.");
        }
        if ((*itr)["connections"].Size() > Config::parameters["num_neurons"].GetInt()) {
            throw InputDecodingException("Neuron connections array size [" + std::to_string((*itr)["connections"].Size()) + "] is >= num_neurons.");
        }
    }
    
    std::vector<int> parseCoreNeuronInstructions(rapidjson::Value::ConstValueIterator itr) {
        std::vector<int> neuron_instructions(Config::parameters["num_axons"].GetInt());
        
        if (!itr->HasMember("axons")) {
            throw InputDecodingException("Core object does not have an axons member.");
        }
        
        if (!(*itr)["axons"].IsArray()) {
            throw InputDecodingException("Core object axons member cannot be parsed as an array.");
        }
        
        if ((*itr)["axons"].Size() > Config::parameters["num_axons"].GetInt()) {
            throw InputDecodingException("Axons array for core (" + std::to_string((*itr)["coordinates"][0].GetInt()) + ", " + std::to_string((*itr)["coordinates"][1].GetInt()) + ") is >= num_axons");
        }
        for (rapidjson::Value::ConstValueIterator inst_itr = (*itr)["axons"].Begin(); inst_itr != (*itr)["axons"].End(); inst_itr++) {
            if (!(*inst_itr).IsInt()) {
                throw InputDecodingException("Could not parse neuron isntruction as integer.");
            }
            if ((*inst_itr).GetInt() >= Config::parameters["num_weights"].GetInt() || (*inst_itr).GetInt() < 0) {
                throw InputDecodingException("Neuron instruction is not within the range of num_weights");
            }
            neuron_instructions[inst_itr - (*itr)["axons"].Begin()] = (*inst_itr).GetInt();
        }
        
        return neuron_instructions;
    }
    
    std::vector<bool> parseNeuronConnections(rapidjson::Value::ConstValueIterator itr, int neuron_num) {
        std::vector<bool> connections(Config::parameters["num_axons"].GetInt());
        
        if ((*itr)["connections"][neuron_num].Size() > Config::parameters["num_axons"].GetInt()) {
            throw InputDecodingException("Connections array for neuron " + std::to_string(neuron_num) + " [" + std::to_string((*itr)["connections"][neuron_num].Size()) + "] is >= num_axons");
        }
        for (int i = 0; i < (*itr)["connections"][neuron_num].Size(); i++) {
            if (!(*itr)["connections"][neuron_num][i].IsInt() || (*itr)["connections"][neuron_num][i].GetInt() > 1 || (*itr)["connections"][neuron_num][i].GetInt() < 0) {
                throw InputDecodingException("Could not parse connections value as a boolean");
            }
            connections[i] = (*itr)["connections"][neuron_num][i].GetInt();
        }
        
        return connections;
    }
    
    std::vector<int> parseNeuronWeights(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("weights")) {
            throw InputDecodingException("Neuron object does not have a weights member.");
        }
        if (!(*itr)["weights"].IsArray()) {
            throw InputDecodingException("Neuron weights object could not be parsed as an array.");
        }
        if ((*itr)["weights"].Size() > Config::parameters["num_weights"].GetInt()) {
            throw InputDecodingException("Neuron weights array size [" + std::to_string((*itr)["weights"].Size()) + "] is >= num_weights.");
        }
        
        std::vector<int> weights(Config::parameters["num_weights"].GetInt());
        for (rapidjson::Value::ConstValueIterator weight_itr = (*itr)["weights"].Begin(); weight_itr != (*itr)["weights"].End(); weight_itr++) {
            if (!weight_itr->IsInt()) {
                throw InputDecodingException("Neuron weights array value cannot be parsed as an integer.");
            }
            weights[weight_itr - (*itr)["weights"].Begin()] = weight_itr->GetInt();
        }
	
        return weights;
    }
    
    std::vector<int> parseNeuronDestinationCore(rapidjson::Value::ConstValueIterator itr, int x, int y) {
        if (!itr->HasMember("destination_core_offset")) {
            throw InputDecodingException("Neuron object does not have a destination_core member.");
        }
        if (!(*itr)["destination_core_offset"].IsArray()) {
            throw InputDecodingException("Neuron destination_core object could not be parsed as an array.");
        }
        if ((*itr)["destination_core_offset"].Size() != 2) {
            throw InputDecodingException("Neuron destination_core array does not have two values.");
        }
        if (!(*itr)["destination_core_offset"][0].IsInt() || !(*itr)["destination_core_offset"][1].IsInt()) {
            throw InputDecodingException("Neuron destination_core array value is not an integer.");
        }
        if ((*itr)["destination_core_offset"][0].GetInt() + x >= Config::parameters["num_cores_x"].GetInt() || (*itr)["destination_core_offset"][1].GetInt() +y >= Config::parameters["num_cores_y"].GetInt()) {
            throw InputDecodingException("Neuron destination_core is out of range of num_cores_x or num_cores_y.");
        }
        return std::vector<int>{(*itr)["destination_core_offset"][0].GetInt(), (*itr)["destination_core_offset"][1].GetInt()};
    }
    
    int parseNeuronDestinationAxon(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("destination_axon")) {
            throw InputDecodingException("Neuron object does not have a destination_axon member.");
        }
        if (!(*itr)["destination_axon"].IsInt()) {
            throw InputDecodingException("Neuron destination_axon object could not be parsed as an integer.");
        }
        if ((*itr)["destination_axon"].GetInt() >= Config::parameters["num_axons"].GetInt()) {
            throw InputDecodingException("Neuron destination_axon is >= num_axons.");
        }
        return(*itr)["destination_axon"].GetInt();
    }

    int parseNeuronDestinationAxonOutputBus(rapidjson::Value::ConstValueIterator itr, int max_outputs) {
        if (!itr->HasMember("destination_axon")) {
            throw InputDecodingException("Neuron object does not have a destination_axon member.");
        }
        if (!(*itr)["destination_axon"].IsInt()) {
            throw InputDecodingException("Neuron destination_axon object could not be parsed as an integer.");
        }
        if ((*itr)["destination_axon"].GetInt() >= max_outputs) {
            throw InputDecodingException("Neuron destination_axon is >= the number of outputs on the output bus.");
        }
        return(*itr)["destination_axon"].GetInt();
    }
    
    int parseNeuronDestinationTick(rapidjson::Value::ConstValueIterator itr) {
        if (!itr->HasMember("destination_tick")) {
            throw InputDecodingException("Neuron object does not have a destination_tick member.");
        }
        if (!(*itr)["destination_tick"].IsInt()) {
            throw InputDecodingException("Neuron destination_tick object could not be parsed as an integer.");
        }
        if ((*itr)["destination_tick"].GetInt() >= Config::parameters["max_tick_offset"].GetInt()) {
            throw InputDecodingException("Neuron destination_tick is >= max_tick_offset.");
        }
        return(*itr)["destination_tick"].GetInt();
    }
    
    int parseNeuronParameter(rapidjson::Value::ConstValueIterator itr, std::string name) {
        if (!itr->HasMember(name.c_str())) {
            throw InputDecodingException("Core object does not have a " + name + " member.");
        }
        if (!(*itr)[name.c_str()].IsInt()) {
            throw InputDecodingException("Neuron " + name + " object could not be parsed as an integer.");
        }
        return (*itr)[name.c_str()].GetInt();
    }

    OutputBus* parseOutputBus(std::string file_name) {
        FILE* fp = std::fopen(file_name.c_str(), "r");

        char readBuffer[65536];
        rapidjson::FileReadStream is(fp, readBuffer, sizeof(readBuffer));
        
        rapidjson::Document document;
        
        if (document.ParseStream(is).HasParseError()) {
            throw InputDecodingException("Could not parse input JSON");
        }

        if (!document.HasMember("output_bus")) {
            throw InputDecodingException("Output bus not found in input json.");
        }
        
        const rapidjson::Value& output_bus_json = document["output_bus"];
        
        // Parse coordinates
        if (!output_bus_json.HasMember("coordinates")) {
            throw InputDecodingException("Output bus object does not have a coordinates member.");
        }
        if (!output_bus_json["coordinates"].IsArray()) {
            throw InputDecodingException("Output bus coordinates object could not be parsed as an array.");
        }
        if (output_bus_json["coordinates"].Size() != 2) {
            throw InputDecodingException("Output bus coordinates array does not have two values.");
        }
        if (!output_bus_json["coordinates"][0].IsInt() || !output_bus_json["coordinates"][1].IsInt()) {
            throw InputDecodingException("Output bus coordinates array value is not an integer.");
        }
        if (output_bus_json["coordinates"][0].GetInt() >= Config::parameters["num_cores_x"].GetInt() || output_bus_json["coordinates"][1].GetInt() >= Config::parameters["num_cores_y"].GetInt()) {
            throw InputDecodingException("Output bus coordinates (" + std::to_string(output_bus_json["coordinates"][0].GetInt()) + ", " + std::to_string(output_bus_json["coordinates"][1].GetInt()) + ") is out of range of num_cores_x or num_cores_y.");
        }
        std::vector<int> coords{output_bus_json["coordinates"][0].GetInt(), output_bus_json["coordinates"][1].GetInt()};

        // Parse num outputs
        if (!output_bus_json.HasMember("num_outputs")) {
            throw InputDecodingException("Output bus object does not have a num_outputs member.");
        }
        if (!output_bus_json["num_outputs"].IsInt()) {
            throw InputDecodingException("Output bus object could not be parsed as an integer.");
        }
        int num_outputs = output_bus_json["num_outputs"].GetInt();

        return new OutputBus(NULL, NULL, NULL, NULL, num_outputs, coords[0], coords[1]);
    }

    std::vector<Core*> parseCores(std::string file_name) {
        int num_cores_x = Config::parameters["num_cores_x"].GetInt();
        int num_cores_y = Config::parameters["num_cores_y"].GetInt();
        int neuron_reset_type = Config::parameters["neuron_reset_type"].GetInt();
        
        std::vector<Core*> components(num_cores_x*num_cores_y);
        std::vector<int> coordinates(2);
        
        // FIXME: Could probably initialize these as Components
        for (int i = 0; i < num_cores_x*num_cores_y; i++) {
            components[i] = new Core();
        }
        
        FILE* fp = std::fopen(file_name.c_str(), "r");
        // FIXME: Is this size going to matter?
        char readBuffer[65536];
        rapidjson::FileReadStream is(fp, readBuffer, sizeof(readBuffer));
        
        rapidjson::Document document;
        
        if (document.ParseStream(is).HasParseError()) {
            throw InputDecodingException("Could not parse input JSON");
        }
        
        const rapidjson::Value& cores_json = document["cores"];
        
        if (!cores_json.IsArray()) {
            throw InputDecodingException("Cores json could not be parsed as an array object.");
        }

        // Parse outputbus
        OutputBus* output_bus = parseOutputBus(file_name);
        
        // Parse cores
        for (rapidjson::Value::ConstValueIterator core_itr = cores_json.Begin(); core_itr != cores_json.End(); core_itr++) {
            coordinates = parseCoreCoordinates(core_itr);
            std::vector<CSRAMRow*> csram(Config::parameters["num_neurons"].GetInt(), new CSRAMRow());
            const rapidjson::Value& neurons = parseCoreNeurons(core_itr);
            
            // Ensure connections are correct
            parseCoreConnections(core_itr);
            
            // Parse neurons
            for (rapidjson::Value::ConstValueIterator neuron_itr = neurons.Begin(); neuron_itr != neurons.End(); neuron_itr++) {
                std::vector<bool> connections = parseNeuronConnections(core_itr, neuron_itr - neurons.Begin());
                std::vector<int> weights(Config::parameters["num_weights"].GetInt());
                weights = parseNeuronWeights(neuron_itr); 
                std::vector<int> destination_core_offset = parseNeuronDestinationCore(neuron_itr, coordinates[0], coordinates[1]);
                // If this neuron is going to the output bus, check against output bus outputs instead of axons per core
                int destination_axon;
                if (coordinates[0] + destination_core_offset[0] == output_bus->x && coordinates[1] + destination_core_offset[1] == output_bus->y) {
                    destination_axon = parseNeuronDestinationAxonOutputBus(neuron_itr, output_bus->num_outputs);
                } else {
                    destination_axon = parseNeuronDestinationAxon(neuron_itr);
                }
                
                int destination_tick = parseNeuronDestinationTick(neuron_itr);
                
                csram[neuron_itr - neurons.Begin()] = new CSRAMRow(connections, parseNeuronParameter(neuron_itr, "current_potential"), parseNeuronParameter(neuron_itr, "reset_potential"), parseNeuronParameter(neuron_itr, "leak"), parseNeuronParameter(neuron_itr, "positive_threshold"), parseNeuronParameter(neuron_itr, "negative_threshold"), weights, destination_core_offset[0], destination_core_offset[1], destination_tick, destination_axon, parseNeuronParameter(neuron_itr, "reset_mode"));
            }
            
            std::vector<int> neuron_instructions = parseCoreNeuronInstructions(core_itr);
            
            components[coordinates[0] + num_cores_x * coordinates[1]] = new Core(NULL, NULL, NULL, NULL, csram, neuron_instructions, coordinates[0], coordinates[1], neuron_reset_type);
        }

        // Add output bus to components
        //components[output_bus->x + num_cores_x*output_bus->y] = output_bus;

        // Link cores
        Core* curr;
        for (int y = 0; y < num_cores_y; y++) {
            for (int x = 0; x < num_cores_x; x++) {
                int curr_index = x + y*num_cores_x;
                curr = components[curr_index];
                // Update core paraemters
                components[curr_index]->x = x;
                curr->y = y;
                // Link to other cores
                if (x > 0) {
                    curr->router->west = components[curr_index - 1]->router;
                }
                if (x < num_cores_x - 1) {
                    curr->router->east = components[curr_index + 1]->router;
                }
                if (y > 0) {
                    curr->router->south = components[curr_index - num_cores_x]->router;
                }
                if (y < num_cores_y - 1) {
                    curr->router->north = components[curr_index + num_cores_x]->router;
                }
            }
        }
        components.push_back(components[output_bus->x + num_cores_x*output_bus->y]);
		components[output_bus->x + num_cores_x*output_bus->y]->num_outputs = output_bus->num_outputs;
        return components;
    }
}

#endif // DECODE_HPP

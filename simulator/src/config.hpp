/// config.hpp
/// 
/// Created for the University of Arizona Reconfigurable Computing Lab
///

#ifndef CONFIG_H
#define CONFIG_H

#include <fstream>
#include <string>
#include <assert.h>

#include <rapidjson/document.h>
#include <rapidjson/filereadstream.h>

// Used to create assert statements with error messages
#define m_assert(expr, msg) assert(( (void)(msg), (expr) ))
#define MIN 0

enum neuron_block_trace {
    nb_trace_off,
    nb_trace_potentials,
    nb_trace_spikes
};

enum core_controller_trace {
    tc_trace_off,
    tc_trace_spikes
};

enum scheduler_trace{
    sched_trace_off,
    sched_trace_lines,
    sched_trace_words
};

enum neuron_block_reset {
    nb_reset_absolute,
    nb_reset_linear
};

class ConfigDecodingException : public std::exception {
        
    public:
        const char* message;

        ConfigDecodingException(std::string message) {
            this->message = message.c_str();
        }

        virtual const char* what() const throw () {
            return message;
        }
};

class Config {
    public:
        static rapidjson::Document parameters;

        static void setParameters(std::string file_name) {

            FILE* fp = std::fopen(file_name.c_str(), "r");
            // FIXME: Is this size going to matter?
            char readBuffer[65536];
            rapidjson::FileReadStream is(fp, readBuffer, sizeof(readBuffer));
            
            if (parameters.ParseStream(is).HasParseError()) {
                throw ConfigDecodingException("Could not parse input JSON");
            }
        }

        static bool traceSpecified() {
            return parameters["neuron_block_trace_verbosity"].GetInt() || parameters["core_controller_trace_verbosity"].GetInt() || parameters["scheduler_trace_verbosity"].GetInt();
        }
    private:
        static void validateIntParameterMinMax(std::string name, int min_val, int max_val) {
            if (!parameters.HasMember(name.c_str())) {
                throw ConfigDecodingException("Configuration file does not have parameter " + name + ".");
            }
            if (!parameters[name.c_str()].IsInt()) {
                throw ConfigDecodingException("Configuration parameter " + name + " could not be parsed as integer.");
            }
            if (parameters[name.c_str()].GetInt() < min_val) {
                throw ConfigDecodingException("Configuration parameter " + name + " must be >= " + std::to_string(min_val));
            }
            if (parameters[name.c_str()].GetInt() > max_val) {
                throw ConfigDecodingException("Configuration parameter " + name + " must be <= " + std::to_string(min_val));
            }
        }

        static void validateIntParameterMin(std::string name, int min_val) {
            if (!parameters.HasMember(name.c_str())) {
                throw ConfigDecodingException("Configuration file does not have parameter " + name + ".");
            }
            if (!parameters[name.c_str()].IsInt()) {
                throw ConfigDecodingException("Configuration parameter " + name + " could not be parsed as integer.");
            }
            if (parameters[name.c_str()].GetInt() < min_val) {
                throw ConfigDecodingException("Configuration parameter " + name + " must be >= " + std::to_string(min_val));
            }
        }

        static void validateIntParameterMax(std::string name, int min_val, int max_val) {
            if (!parameters.HasMember(name.c_str())) {
                throw ConfigDecodingException("Configuration file does not have parameter " + name + ".");
            }
            if (!parameters[name.c_str()].IsInt()) {
                throw ConfigDecodingException("Configuration parameter " + name + " could not be parsed as integer.");
            }
            if (parameters[name.c_str()].GetInt() > max_val) {
                throw ConfigDecodingException("Configuration parameter " + name + " must be <= " + std::to_string(min_val));
            }
        }

        static void validateParameters() {
            validateIntParameterMin("num_neurons", MIN);
            validateIntParameterMin("num_axons", MIN);
            validateIntParameterMin("num_cores_x", MIN);
            validateIntParameterMin("num_cores_y", MIN);
            validateIntParameterMin("num_weights", MIN);
            validateIntParameterMin("max_tick_offset", MIN);
            validateIntParameterMinMax("neuron_block_trace_verbosity", nb_trace_off, nb_trace_spikes);
            validateIntParameterMinMax("core_controller_trace_verbosity", tc_trace_off, tc_trace_spikes);
            validateIntParameterMinMax("scheduler_trace_verbosity", sched_trace_off, sched_trace_words);
            validateIntParameterMinMax("neuron_reset_type", nb_reset_absolute, nb_reset_linear);
            //validateIntParameterMinMax("neruon_current_potential", -256, 256);
        }
};

#endif // CONFIG_H

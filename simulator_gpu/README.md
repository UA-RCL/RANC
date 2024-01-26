# University of Arizona RANC Simulator

This is a software simulation for the RANC neuromorphic architecture created by Dr. Akoglu's Reconfigurable Computing Lab at the University of Arizona.

## Getting Started

The simulator can be built using [CMake](https://cmake.org/install/). In order to build on a Unix systems can be done, clone this repository, enter the repository, and run the following commands:

```
mkdir build
cd build
cmake ..
make
```

This will create an executable called `ranc_sim` which can be used to run simulations.

## Running Simulations

A simple help statement for the simulator can be found by running `./ranc_sim -h`:

```
A software simulation of the RANC architecture.
Usage:
  RANCSimulator [OPTION...] INPUT_FILE_NAME, OUTPUT_FILE_NAME, CONFIGURATION_FILE_NAME, NUM_TICKS

  -i, --input arg        Input file
  -o, --output arg       Output file
  -c, --config arg       Config file
      --ticks arg        Number of ticks to run simulation for
  -t, --trace arg        Trace file
  -r, --report_freq arg  Report frequency (default: 1)
  -h, --help             Print help
```

Two files are necessary to begin a simulation: an input file and a configuration file.

### Input Files

The input file is a JSON file that contains both packets to send in to the simulator and parameters for the cores and neurons to use in the simulation. Example input can be found in `data/example/input.json`.

Packets should be specified as a two dimensional array with with the key `packets` where the `ith` inner array contains the packets for the `ith` tick. A `packet` object has the following keys:

```
{
  "destination_core": an array with two integer elements specifying the coordinates of the destination core,
  "destination_axon": a integer representing the index of the destination axon to send the spike to on the destination core,
  "destination_tick": a integer representing the number of the destination tick of the packet
}
```

Next, the `output_bus` must be specified. The `output_bus` is used to route packets out of RANC. In the simulation enviornment, the neurons in the `output_bus` are the ones for which spikes get reported in the output file. An `output_bus` object has the following keys:

```
{
  "coordinates": an array with two integer elements specifying the coordinates of the output bus.
  "num_outputs": the number of neurons held in the output bus.
}
```

After the `output_bus` is specified, neurons can send their output to the output bus using the `coordinates` specified for the `output_bus`. The number of axons available on the `output_bus` is specified by `num_outputs`. Neurons can send output to these axons similar to any other core. The output file will consist of a binary matrix with each column representing an output and each row representing a tick. A 1 in the `ith` row and `jth` column represents a spike on the `jth` output on the `ith` tick.

Along with the packets and output bus should be a list of core objects which represent the cores to use in the simulation. Cores should be specified as a one dimensional array with the key `cores`. A `core` object has the following keys:

```
{
  "axons": an array of integers representing the neuron instructions for each axon,
  "neurons": an array of neuron objects which will be explained below,
  "connections": a two dimensional array of 1s and 0s representing the synaptic crossbar. The `ith` inner array should contain the connections for the `ith` neuron,
  "coordinates": an array with two integer elements specifying the coordinates of the core
}
```

Neuron objects contain the neuron parameters for a single neuron. A `neuron` object has the following keys:

```
{
  "reset_potential": an integer representing the reset potential for the neuron,
  "weights": an array of integers containing the weights for the neuron,
  "leak": an integer representing the leak for the neuron,
  "positive_threshold": an integer representing the positive threshold for the neuron,
  "negative_threshold": an integer representing the negative threshold for the neuron,
  "destination_core_offset": an array with two integer elements specifying the dx, dy offset for the target core with respect to this core. Negative coordinates are acceptable. Coordinates of [0, 0] will send the output to the same core that the neuron resides in,
  "destination_axon": an integer representing the index of the destination axon for this neuron's output spikes,
  "destination_tick": an integer representing the index of the destination tick for this neuron's output spikes,
  "current_potential": an integer representing the starting potential for the neuron,
  "reset_mode": an integer representing the desired reset value for the neuron. Reset modes are explained below
}
```

Currently, we have two reset modes implemented:
- 0: Absolute Reset - If the current potential is greater than or equal to the postivie threshold, it resets to the reset potential. If the current potential is less than the negative threshold, it resets to the negative of the reset potential.
- 1: Linear Reset - If the current potential is greater than or equal to the postivie threshold, the positive threshold gets subtracted from the current potential. If the current potential is less than the negative threshold, the negative threhsold is added to the current potential.

### Configuration Files

A configuration file is another json file which stores the high level for the simulation. The following is a list configuration parameters:

```
{
    "num_neurons": the number of neurons per core,
    "num_axons": the number of axons per core,
    "num_cores_x": the number of cores to simulate in the x direction,
    "num_cores_y": the number of cores to simulate in the y direction
    "num_weights": the number of weights per neuron,
    "max_tick_offset": the number of ticks in the future for which a packet can be delivered. This corresponds to the number of rows in the scheduler sram. Note that since ticks are offset by 1, the actual value max value that can be given to a destination tick is max_tick_offset-1,
    "neuron_block_trace_verbosity": explained below,
    "core_controller_trace_verbosity": explained below,
    "scheduler_trace_verbosity": explained below
}
```

Note that a total number of `num_cores_x`*`num_cores_y` cores will be instantiated for the simulation. Cores not specified in the input file will be given no connections and neurons with a threshold of 1, meaning that neurons on these cores will never spike. 

An example configuration can be found in `config.json`.

### Output Files

The output file which the simulation generates indicates which neurons in each core spike for each tick. Cores which have no spiking neurons for a particular tick will not be printed for that tick.

### Trace Files

In order to help show what is occuring in the simulation, trace files can be generated which provide information about various occurances in the simulation.
In an effort to keep trace files readable, the configuration file offers multiple parameters to control the verbosity of the trace file for certain parts of the simulation. The following is a list of what values will result in what kind of output for specific trace configurations:

* `neuron_block_trace_verbosity`:
  - 1: Logs the leaky-integrate-and-fire operation for each specified neuron at each tick.
  - 2: Logs the axons at which there is a connection and a spike is received for each specified neuron at each tick.
* `core_controller_trace_verbosity`:
  - 1: Logs the spikes received for each specified core at each tick as a binary value.
* `scheduler_trace_verbosity`:
  - 1: Logs the current sram word each time the sram current word is updated.
  - 2: Logs (1) as well as the word and bit being written to every time a write occurs.

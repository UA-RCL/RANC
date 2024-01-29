# RANC

RANC is a full featured environment for experimentation with neuromorphic architectures. See https://ua-rcl.github.io/projects/ranc for more details.

## About GPU-RANC

Open-source simulation tools play a crucial role for neuromorphic application engineers and hardware architects to investigate performance bottlenecks and explore design optimizations before committing to silicon. 
Reconfigurable Architecture for Neuromorphic Computing (RANC) is one such tool that offers ability to execute pre-trained Spiking Neural Network (SNN) models within a unified ecosystem through both software-based simulation and FPGA-based emulation. 
RANC has been utilized by the community with its flexible and highly parameterized design to study implementation bottlenecks, tune architectural parameters or modify neuron behavior based on application insights and study the trade space on hardware performance and network accuracy. 
In designing architectures for use in neuromorphic computing, there are an incredibly large number of configuration parameters such as number and precision of weights per neuron, neuron and axon counts per core, network topology, and neuron behavior. 
To accelerate such studies and provide users with a streamlined productive design space exploration, in this paper we introduce the GPU-based implementation of RANC. 
We summarize our parallelization approach and quantify the speedup gains achieved with GPU-based tick-accurate simulations across various use cases. 
We demonstrate up to 780 times speedup compared to serial version of the RANC simulator based on a 512 neuromorphic core MNIST inference application. 
We believe that the RANC ecosystem now provides a much more feasible avenue in the research of exploring different optimizations for accelerating SNNs and performing richer studies by enabling rapid convergence to optimized neuromorphic architectures.

## Sub-projects:

- [test\_case](test_case): this directory contains folders for individual example experiments in the RANC ecosystem
- [simulator](simulator): this directory contains the CPU-based serial RANC software simulator
- [simulator\_gpu](simulator_gpu): this directory contains the GPU-based RANC software simulator
- [software](software): this directory contains a set of software utilities including the RANC Tensorflow environment and utilities for creating various simulation/emulation input files



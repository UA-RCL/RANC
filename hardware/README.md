# RANC - Hardware

This folder contains sources for a Vivado project that generates the RANC network IP. Get started by sourcing `rancnetwork.tcl` in the Vivado TCL console and the project will be generated in the `vivado_project` directory.

Optionally, unit tests that utilize [MyHDL](https://github.com/myhdl/myhdl) testbenches coupled with [iverilog](https://github.com/steveicarus/iverilog) can be executed by running `pytest` from `./src/simulations/tests` or `./src/simulations/networks`
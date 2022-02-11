`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NeuronBlock.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Performs the leaky integrate and fire operation for each core.
//////////////////////////////////////////////////////////////////////////////////

module NeuronBlock #(
    parameter LEAK_WIDTH = 9,
    parameter WEIGHT_WIDTH = 9,
    parameter THRESHOLD_WIDTH = 9,
    parameter POTENTIAL_WIDTH = 9,
    parameter NUM_WEIGHTS = 4
)(
    input [LEAK_WIDTH-1:0] leak,
    input [WEIGHT_WIDTH-1:0] weight_0,
    input [WEIGHT_WIDTH-1:0] weight_1,
    input [WEIGHT_WIDTH-1:0] weight_2,
    input [WEIGHT_WIDTH-1:0] weight_3,
    input [THRESHOLD_WIDTH-1:0] threshold,
    input [THRESHOLD_WIDTH-1:0] floor,
    input [POTENTIAL_WIDTH-1:0] reset_potential,
    input [POTENTIAL_WIDTH-1:0] current_potential,
    input [$clog2(NUM_WEIGHTS)-1:0] neuron_instruction,
    input leak_en,
    input next_neuron,
    input clk,
    input integrator_reg_en,
    output [POTENTIAL_WIDTH-1:0] write_potential,
    output spike_out
);
   
    wire [WEIGHT_WIDTH-1:0] weight;
    wire [THRESHOLD_WIDTH-1:0] integrator_potential;
   
    Mux4to1 #(
        .DATA_WIDTH(WEIGHT_WIDTH)
    ) SynapseUnit (
        .a(weight_0),
        .b(weight_1),
        .c(weight_2),
        .d(weight_3),
        .sel(neuron_instruction),
        .out(weight)
    );
   
    IntegratorUnit #(
        .LEAK_WIDTH(LEAK_WIDTH),
        .WEIGHT_WIDTH(WEIGHT_WIDTH),
        .POTENTIAL_WIDTH(POTENTIAL_WIDTH)
    ) IntegratorUnit (
        .leak(leak),
        .leak_en(leak_en),
        .clk(clk),
        .next_neuron(next_neuron),
        .integrator_reg_en(integrator_reg_en),
        .weight(weight),
        .current_potential(current_potential),
        .integrator_potential(integrator_potential)
    );
    
    ThresholdResetUnit ThresholdResetUnit( 
        .integrator_potential(integrator_potential),
        .threshold(threshold),
        .floor(floor),
        .reset_potential(reset_potential),
        .threshold_potential(write_potential),
        .spike(spike_out)
    );

endmodule
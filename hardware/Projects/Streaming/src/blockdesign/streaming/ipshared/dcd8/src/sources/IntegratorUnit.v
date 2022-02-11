`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// IntegratorUnit.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Performs an integration operation.
//////////////////////////////////////////////////////////////////////////////////

module IntegratorUnit #(
    parameter LEAK_WIDTH = 9,
    parameter WEIGHT_WIDTH = 9,
    parameter POTENTIAL_WIDTH = 9
)(
    input [LEAK_WIDTH-1:0] leak,
    input leak_en,
    input clk,
    input next_neuron,
    input integrator_reg_en,
    input [WEIGHT_WIDTH-1:0] weight,
    input [POTENTIAL_WIDTH-1:0] current_potential,
    output [POTENTIAL_WIDTH-1:0] integrator_potential
);
    
    wire [POTENTIAL_WIDTH-1:0] add_1;
    wire [POTENTIAL_WIDTH-1:0] add_2;
    wire [POTENTIAL_WIDTH-1:0] add_3;
    
    // FIXME: This mux cannot handle a difference in widths between the leak and weight.
    Mux2to1 #(
        .DATA_WIDTH(WEIGHT_WIDTH)
    ) LeakWeightMux(
        .a(weight),
        .b(leak),
        .sel(leak_en),
        .out(add_1)
    );
    
    Mux2to1 #(
        .DATA_WIDTH(POTENTIAL_WIDTH)
    ) PotentialMux(
        .a(integrator_potential),
        .b(current_potential),
        .sel(next_neuron),
        .out(add_2)
    );
    
    // FIXME: This adder cannot handle a difference in widths between the leak, weight, and potential
    Adder #(
        .DATA_WIDTH(POTENTIAL_WIDTH)
    ) Adder(
        .a(add_1),
        .b(add_2),
        .out(add_3)
    );
    
    EnReg #(
        .DATA_WIDTH(POTENTIAL_WIDTH)
    ) EnReg(
        .en(integrator_reg_en),
        .clk(clk),
        .d(add_3),
        .q(integrator_potential)
    );
       
endmodule

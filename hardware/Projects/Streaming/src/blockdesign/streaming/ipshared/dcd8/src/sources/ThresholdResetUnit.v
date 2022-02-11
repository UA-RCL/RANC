`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ThresholdResetUnit.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Resets a neuron's threshold if necessary
//////////////////////////////////////////////////////////////////////////////////

module ThresholdResetUnit #(
    parameter THRESHOLD_WIDTH = 9,
    parameter POTENTIAL_WIDTH = 9
)(
    input [POTENTIAL_WIDTH-1:0] integrator_potential,
    input [THRESHOLD_WIDTH-1:0] threshold,
    input [THRESHOLD_WIDTH-1:0] floor,
    input [POTENTIAL_WIDTH-1:0] reset_potential,
    output [THRESHOLD_WIDTH-1:0] threshold_potential,
    output spike
);
    
    wire no_spike, min_reset;
    wire [THRESHOLD_WIDTH-1:0] threshold_1;
        
    assign spike = ~no_spike;
    
    Mux2to1 #(
        .DATA_WIDTH(POTENTIAL_WIDTH)
    ) Mux2to1(
        .a(integrator_potential),
        .b(reset_potential),
        .sel(spike),
        .out(threshold_1)
    );
    
    // FIXME: This mux cannot handle a difference in potential and threhsold widths.
    Mux2to1 #(
        .DATA_WIDTH(THRESHOLD_WIDTH)
    ) Min_Mux2to1(
        .a(threshold_1),
        .b(reset_potential),
        .sel(min_reset),
        .out(threshold_potential)
    );
    
    // FIXME: This comparator cannot handle a difference in potential and threhsold widths.
    Comp #(
        .DATA_WIDTH(POTENTIAL_WIDTH)
    ) Comp(
        .a(integrator_potential),
        .b(threshold),
        .gt(),
        .eq(),
        .lt(no_spike)
     );
     
     // FIXME: This comparator cannot handle a difference in potential and threhsold widths.
     Comp #(
        .DATA_WIDTH(POTENTIAL_WIDTH)
     ) Min_Comp(
        .a(integrator_potential),
        .b(floor),
        .gt(),
        .eq(),
        .lt(min_reset)
     );
     
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Adder.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// A simple adder.
//////////////////////////////////////////////////////////////////////////////////

module Adder #(
    parameter DATA_WIDTH_A = 8,
    parameter DATA_WIDTH_B = 8,
    parameter DATA_WIDTH_OUT = 8
)(
    input signed [DATA_WIDTH_A-1:0] a,
    input signed [DATA_WIDTH_B-1:0] b,
    output reg signed [DATA_WIDTH_OUT-1:0] out
);
    
    initial begin
        out = 0;
    end
    
    always@(*) begin
        out = a + b;
    end
endmodule

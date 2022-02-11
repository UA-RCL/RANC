`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mux2to1.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// A simple adder.
//////////////////////////////////////////////////////////////////////////////////

module Adder #(
    parameter DATA_WIDTH = 8
)(
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    output reg [DATA_WIDTH-1:0] out
);
    
    initial begin
        out = 0;
    end
    
    always@(*) begin
        out = a + b;
    end
endmodule

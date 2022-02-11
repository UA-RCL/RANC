`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mux2to1.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// A simple 2 to 1 mux.
//////////////////////////////////////////////////////////////////////////////////

module Mux2to1 #(
    parameter DATA_WIDTH = 8
)(
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    input sel,
    output reg [DATA_WIDTH-1:0] out
);
    
    initial begin
        out = 0;
    end
    always@(*) begin
        case(sel)
            0: out = a;
            1: out = b;
        endcase
    end
    
endmodule

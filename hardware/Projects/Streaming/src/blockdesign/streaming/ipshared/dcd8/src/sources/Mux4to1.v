`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Mux4to1.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// A simple four to one mux.
//////////////////////////////////////////////////////////////////////////////////

module Mux4to1 #(
    parameter DATA_WIDTH = 8
)(
    a,
    b,
    c,
    d,
    sel,
    out
);
    
    input [DATA_WIDTH-1:0] a;
    input [DATA_WIDTH-1:0] b;
    input [DATA_WIDTH-1:0] c;
    input [DATA_WIDTH-1:0] d;
    input [1:0] sel;
    
    output [DATA_WIDTH-1:0] out;
    
    reg [DATA_WIDTH-1:0] out;

    always@(*) begin
        case(sel)
            0: out = a;
            1: out = b;
            2: out = c;
            3: out = d;
        endcase
    end
    
endmodule

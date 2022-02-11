`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Comp.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// A simple comparator.
//////////////////////////////////////////////////////////////////////////////////

module Comp #(
    parameter DATA_WIDTH = 8
)(
    input signed [DATA_WIDTH-1:0] a,
    input signed [DATA_WIDTH-1:0] b,
    output reg gt,
    output reg eq,
    output reg lt
);
    
    initial begin
        gt = 0;
        eq = 0;
        lt = 0;
    end
    
    always@(*) begin
        if(a > b) begin
            gt = 1;
            lt = 0;
            eq = 0;
        end
        else if(a == b) begin
            gt = 0;
            lt = 0;
            eq = 1;
        end
        else if(a < b) begin
            gt = 0;
            lt = 1;
            eq = 0;
        end
        else begin
            gt = 0;
            lt = 0;
            eq = 0;
        end
    end
endmodule

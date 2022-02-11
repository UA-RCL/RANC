`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Incrementer.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Incrementes a value.
//////////////////////////////////////////////////////////////////////////////////


module Incrementer #(
	// Parameters:
	parameter DATA = 30
)(
    // Inputs:
    input [DATA-1:0] a,
    
    // Outputs:
    output reg signed [DATA-1:0] out
);
    
    always @(a) begin
        if(a < 0)begin
            out <= a + $signed(1);
        end
        else begin
            out <= 0;
        end
    end
endmodule

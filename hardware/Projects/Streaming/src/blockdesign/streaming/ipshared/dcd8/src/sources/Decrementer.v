`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2018 05:25:14 AM
// Design Name: 
// Module Name: Decrementer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decrementer #(
	// Parameters:
	parameter DATA = 30
)(
    // Inputs:
    input [DATA-1:0] a,
    
    // Outputs:
    output reg signed [DATA-1:0] out
);
    
    always @(a) begin
        if(a > 0)begin
            out = a - $signed(1);
        end
        else begin
            out = 0;
        end
    end
endmodule

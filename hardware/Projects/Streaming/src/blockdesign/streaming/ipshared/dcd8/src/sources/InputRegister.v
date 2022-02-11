`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// InputRegister.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Registers an input.
//////////////////////////////////////////////////////////////////////////////////
/*

InputRegister_Valid InRegV_TEST(
// Inputs:
    .Clock(),
    .Reset(),
    .DataValid(),
    .DataIn(),
    .Captured(),
    .Full(),
    
    // Outputs:
    .DataOut(),
    .DataOutValid(),
    .DataCaptured()
);

*/

module InputRegister #(
	// Parameters:
	parameter PACKET_SIZE = 30
)(
// Inputs:
    input Clock,
    input Reset,
    input DataValid,
    input [PACKET_SIZE-1:0] DataIn,
    input Captured,
    input Full,
    // Outputs:
    output reg [PACKET_SIZE-1:0] DataOut,
    output reg DataOutValid,
    output reg DataCaptured
);
    
    initial begin
        DataOutValid <= 0;
        DataOut <= 0;
    end
    
    always@(posedge Clock)begin
        if(Reset)begin
            DataOutValid <= 0;
            DataOut <= 0;
            DataCaptured <= 0;
        end
        else begin
            if(DataValid && !Full)begin
                DataOut <= DataIn;
                DataOutValid <= 1;
                DataCaptured <= 1;
            end
            else if(!DataValid && Captured && !Full)begin
                DataOutValid <= 0;
                DataCaptured <= 0;
            end
            else begin
                DataCaptured <= 0;
            end
        end
    end
    
    
endmodule

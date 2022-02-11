`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2018 05:56:03 AM
// Design Name: 
// Module Name: ExitReg_Valid
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


module ExitReg(
    // Inputs:
    Clock,
    Reset,
    DataIn,
    DataInValid,
    Captured,
    Full,
    
    // Outputs:
    DataOut,
    DataOutValid,
    Received
);
    // Parameter:
    parameter DATA = 30;
    
    // Inputs:
    input Clock, Reset, DataInValid, Captured, Full;
    input [DATA-1:0] DataIn;
    
    // Outputs:
    output reg [DATA-1:0] DataOut;
    output reg Received;
    output reg DataOutValid;
    //assign DataOutValid = (Captured == 1 ? 1 : 0);
    initial begin
        DataOut <= 0;
        DataOutValid <= 0;
        Received <= 0;
    end
    
    always @(posedge Clock)begin
        if(Reset)begin
            DataOut <= 0;
            DataOutValid <= 0;
            Received <= 0;
        end
        else begin
            if(DataInValid && !Full)begin
                DataOut <= DataIn;
                DataOutValid <= 1;
                Received <= 1;
            end
            else if(!DataInValid && Captured && !Full)begin
                DataOutValid <= 0;
                Received <= 0;
            end
            else begin
                Received <= 0;
            end
        end
    end    
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2018 05:56:03 AM
// Design Name: 
// Module Name: DecodeReg_Valid
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
/*

DecodeReg_Valid (
    // Inputs:
    .Clock(),
    .Reset(),
    .DataIn(),
    .DataInValid(),
    .Comp(),
    .Full(),
    .Received0(),
    .Received1(),
    
    // Outputs:
    .DataOut0(),
    .DataOut1(),
    .DataOutValid0(),
    .DataOutValid1(),
    .Advance()
);

*/

module DecodeReg (
    // Inputs:
    Clock,
    Reset,
    DataIn,
    DataInValid,
    Comp,
    Full0,
    Full1,
    Received0,
    Received1,
    
    // Outputs:
    DataOut0,
    DataOut1,
    DataOutValid0,
    DataOutValid1,
    Advance
);
    // Parameters:
    parameter DATA = 30;
    
    // Inputs:
    input Clock, Reset, DataInValid, Comp, Full0, Full1,Received0, Received1;
    input [DATA-1:0] DataIn;
    
    // Outputs:
    output reg [DATA-1:0] DataOut0; 
    output reg [DATA-10:0] DataOut1;
    output reg DataOutValid0, DataOutValid1;
    output Advance;
    
    // Wires:
    
    // Registers:
    reg Capture0, Capture1;
    
    // Assigns:
    assign Advance = Capture1 | Capture0;
    
    initial begin
        DataOut0 <= 0;
        DataOut1 <= 0;
        DataOutValid0 <= 0;
        DataOutValid1 <= 0;
        Capture0 <= 0;
        Capture1 <= 0;
    end
    
    always@(negedge Clock)begin
        if(Reset)begin
            DataOut0 <= 0;
            DataOut1 <= 0;
            DataOutValid0 <= 0;
            DataOutValid1 <= 0;
            Capture0 <= 0;
            Capture1 <= 0;
        end
        else begin
            if(Full0 && !Comp)begin
                Capture0 <= 0;
                Capture1 <= 0;
            end
            else if(Full1 && Comp)begin
                Capture0 <= 0;
                Capture1 <= 0;
            end
            else if (Full0 && Full1)begin
                Capture0 <= 0;
                Capture1 <= 0;
            end
            else begin
                if(Received0)begin
                    DataOutValid0 <= 0;
                end
                
                else if(Received1)begin
                    DataOutValid1 <= 0;
                end
                
                if(DataInValid)begin
                    if(Comp)begin
                        DataOut1 <= DataIn[DATA-10:0];
                        DataOutValid1 <= 1;
                        Capture0 <= 0;
                        Capture1 <= 1;
                    end
                    else begin
                        DataOut0 <= DataIn;
                        DataOutValid0 <= 1;
                        Capture0 <= 1;
                        Capture1 <= 0;
                    end
                end
            end
        end
    end

endmodule
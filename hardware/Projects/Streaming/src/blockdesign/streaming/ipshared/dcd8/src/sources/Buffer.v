`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2018 07:55:15 AM
// Design Name: 
// Module Name: Buffer_Valid
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

Buffer_Valid BV_TEST(
    // Inputs:
    .Clock(),
    .Reset(),
    .DataIn(),
    .WriteEn(),
    .AdvEn(),
    
    // Outputs:
    .DataOut(),
    .DataOutValid(),
    .Full()   
);


*/

module Buffer#(
    // Parameters:
    parameter DATA = 30,
    parameter BUFFER = 4,
    parameter ADDRESS = 2
)(
    // Inputs:
    input Clock,
    input Reset,
    input [DATA-1:0] DataIn,
    input WriteEn,
    input AdvEn,
    
    // Outputs:
    output [DATA-1:0] DataOut,
    output DataOutValid,
    output Full  
);
    
    // Registers:
    reg [DATA:0] memory [0:BUFFER-1];
    reg [ADDRESS-1:0] wp, rp, sc;
    integer i;
    initial begin
        for(i = 0; i < BUFFER; i = i + 1)begin
            memory[i] = 0;
        end
        wp <= 0;
        rp <= 0;
        sc <= 0;
    end
    always@(posedge Clock)begin
        if(Reset)begin
            wp <= 0; rp <= 0; sc <= 0;
            for(i = 0; i < BUFFER; i = i + 1)begin
                memory[i] = 0;
            end
        end
        else begin
            if(WriteEn && !Full)begin
                memory[wp] = {1'b1,DataIn};
                wp = wp +1;
                if(sc != (BUFFER-1))begin
                    sc = sc+1;
                end
            end
            
            if(AdvEn)begin
                memory[rp][DATA] = 0;
                if(rp != BUFFER-1)begin
                    if(memory[rp+1][DATA] != 1'b0)begin
                        rp = rp + 1;
                        if(sc != 0)begin
                            sc = sc -1;
                        end
                    end
                end
                else begin
                    if(memory[0][DATA] != 1'b0)begin
                        rp = rp + 1;
                        if(sc != 0)begin
                            sc = sc -1;
                        end
                    end
                end
            end
        end
    end
    
    assign DataOut = memory[rp][DATA-1:0];
    assign Full = ((sc >= (BUFFER-1)) ? 1 : 0);
    assign DataOutValid = memory[rp][DATA];
endmodule

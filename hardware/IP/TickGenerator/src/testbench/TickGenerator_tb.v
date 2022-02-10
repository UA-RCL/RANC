`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2019 11:34:33 PM
// Design Name: 
// Module Name: TickGenerator_tb
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


module TickGenerator_tb();

    reg clk;
    reg en;
    wire tick;

    TickGenerator TickGenerator_inst(
        .clk(clk), 
        .en(en),
        .tick(tick),
        .result_ready()
    );
    
    always begin
        clk <= ~clk;
        #20;
    end
    
    initial begin
        clk <= 0;
        en <= 1;
    end

endmodule

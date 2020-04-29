`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// SchedulerSRAM.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Stores spikes that are to be processed for a core.
//////////////////////////////////////////////////////////////////////////////////

module SchedulerSRAM #(
    parameter NUM_AXONS = 256,
    parameter NUM_TICKS = 16
)(
    input clk,
    input rst,
    input clr,
    input wen,
    input [$clog2(NUM_TICKS)-1:0] read_address,
    input [$clog2(NUM_AXONS) + $clog2(NUM_TICKS) - 1:0] packet,
    output reg [NUM_AXONS-1:0] out
);

    reg [NUM_AXONS-1:0] memory [0:NUM_TICKS-1]; // Internal memroy of the Core SRAM 
    
    wire [$clog2(NUM_TICKS)-1:0] write_address;
    
    integer i;
    
    initial begin
        out <= 0;
        for(i = 0; i < NUM_TICKS; i = i + 1)begin
            memory[i] <= 0;
        end
    end
    
    assign write_address = packet[$clog2(NUM_TICKS)-1:0] + read_address + 1;

    always@(posedge clk) begin
        if(rst || clr) begin
            memory[read_address] <= 0;
        end
        else if(wen) begin
            memory[write_address][packet[$clog2(NUM_AXONS) + $clog2(NUM_TICKS)-1:$clog2(NUM_TICKS)]] <= 1'b1;
        end
    end

    always@(*) begin
        out <= memory[read_address];
    end 
    
endmodule

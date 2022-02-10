`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Scheduler.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Handles reads and writes to the SchedulerSRAM
//////////////////////////////////////////////////////////////////////////////////

module Scheduler #(
    parameter NUM_AXONS = 256,
    parameter NUM_TICKS = 16
)(
    input clk,
    input rst,
    input wen,
    input set,
    input clr,
    input [$clog2(NUM_AXONS) + $clog2(NUM_TICKS) - 1:0] packet,
    output [NUM_AXONS-1:0] axon_spikes,
    output error
);
    
    wire [$clog2(NUM_TICKS)-1:0] read_address;
    wire read_equal_write;
    wire read_equal_write_and_not_set;
    
    assign read_equal_write = read_address == (packet[3:0] + read_address + 1) ? 1'b1 : 1'b0;
    assign read_equal_write_and_not_set = read_equal_write & ~set;
    assign error = read_equal_write_and_not_set & wen;
    
    SchedulerSRAM #(
        .NUM_AXONS(NUM_AXONS),
        .NUM_TICKS(NUM_TICKS)
    ) SRAM (
        .packet(packet),
        .clr(clr),
        .read_address(read_address),
        .rst(rst),
        .wen(wen),
        .out(axon_spikes),
        .clk(clk)
    );
    
    Counter #(
        .DATA_WIDTH($clog2(NUM_TICKS))
    ) counter (
        .wen(set),
        .clk(clk),
        .out(read_address)
    );
    
endmodule

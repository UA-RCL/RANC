`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// OutcomeCoreProcessor.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Decodes spikes out of a RANC network assuming a classification based
// network and an alternating population output coding.
//////////////////////////////////////////////////////////////////////////////////

module OutcomeCore #(
    parameter integer PACKET_WIDTH = 30,
    parameter integer NUM_CLASSES = 10,
    parameter integer FIFO_DEPTH = 16,
    parameter integer STREAM_DEPTH = 8,
    // Parameters of Axi Master Bus Interface M00_AXIS
    parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
    parameter integer C_M00_AXIS_START_COUNT	= 32
)(
    // Inputs:
    input clk,
    input rst,
    input tick,
    input [PACKET_WIDTH-1:0] packet,
    input packet_valid,
    
    output packet_captured,
    output fifo_full,
    output [1:0] outcome_error,

    // Ports of Axi Master Bus Interface M00_AXIS
    input wire  m00_axis_aclk,
    input wire  m00_axis_aresetn,
    output wire  m00_axis_tvalid,
    output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
    output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
    output wire  m00_axis_tlast,
    input wire  m00_axis_tready
);

    wire [C_M00_AXIS_TDATA_WIDTH-1:0] outcome;
    wire [C_M00_AXIS_TDATA_WIDTH-1:0] fifo_out;
    wire outcome_valid;
    wire fifo_ready;
    wire [$clog2(STREAM_DEPTH):0] read_addr;
    
    OutcomeCoreProcessor #(
        .PACKET_WIDTH(PACKET_WIDTH),
        .NUM_CLASSES(NUM_CLASSES),
        .OUTCOME_WIDTH(C_M00_AXIS_TDATA_WIDTH)
    ) OutcomeCoreProcessor_inst (
        .clk(clk),
        .rst(rst),
        .tick(tick),
        .packet(packet),
        .packet_valid(packet_valid),
        .packet_captured(packet_captured),
        .winner(outcome),
        .valid(outcome_valid),
        .outcome_error(outcome_error)
    );
    
    FIFO #(
        .AXIS_DEPTH(STREAM_DEPTH),
        .DATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
        .DEPTH(FIFO_DEPTH)
    ) FIFO_inst (
        .clk(clk),
        .rst(rst),
        .din_valid(outcome_valid),
        .addr(read_addr),
        .din(outcome),
        .dout(fifo_out),
        .ready(fifo_ready),
        .fifo_full(fifo_full)
    );
    
    OutcomeCore_M00_AXIS #(
        .STREAM_DEPTH(STREAM_DEPTH),
        .C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
        .C_M_START_COUNT(C_M00_AXIS_START_COUNT)
    ) OutcomeCore_M00_AXIS_inst (
        .fifo_ready(fifo_ready),
        .data(fifo_out),
        .read_addr(read_addr),
        .M_AXIS_ACLK(m00_axis_aclk),
        .M_AXIS_ARESETN(m00_axis_aresetn), 
        .M_AXIS_TVALID(m00_axis_tvalid),
        .M_AXIS_TDATA(m00_axis_tdata),
        .M_AXIS_TSTRB(m00_axis_tstrb),
        .M_AXIS_TLAST(m00_axis_tlast),
        .M_AXIS_TREADY(m00_axis_tready)
    );
    
endmodule

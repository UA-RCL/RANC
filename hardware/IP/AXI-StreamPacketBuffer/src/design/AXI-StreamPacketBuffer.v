`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AXI-StreamPacketBuffer.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Converts packets into an AXI-Stream.
//////////////////////////////////////////////////////////////////////////////////


module AXIStreamPacketBuffer #(
    parameter PACKET_WIDTH = 30,
    parameter MAX_NUM_PACKETS = 200,
    // Parameters of Axi Master Bus Interface M00_AXIS
    parameter integer C_M00_AXIS_TDATA_WIDTH = 32,
    parameter integer C_M00_AXIS_START_COUNT = 32
)(
    input clk,
    input rst,
    input tick,
    input [PACKET_WIDTH-1:0] packet,
    input packet_valid,
    output buffer_overflow_error,
    output buffer_to_stream_error,
    // Ports of Axi Master Bus Interface M00_AXIS
    input wire  m00_axis_aclk,
    input wire  m00_axis_aresetn,
    output wire  m00_axis_tvalid,
    output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
    output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
    output wire  m00_axis_tlast,
    input wire  m00_axis_tready
);
    
    function integer clogb2 (input integer bit_depth);                                   
        begin                                                                              
            for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
                bit_depth = bit_depth >> 1;                                                    
        end                                                                                
    endfunction
    
    wire [clogb2(MAX_NUM_PACKETS)-1:0] read_addr;
    wire [C_M00_AXIS_TDATA_WIDTH-1:0] buffer_out;
    wire [clogb2(MAX_NUM_PACKETS)-1:0] num_packets;
    wire read_en;
    wire [C_M00_AXIS_TDATA_WIDTH-1:0] padded_packet;
    
    localparam AXIS_PACKET_WIDTH_DIFFERENCE = C_M00_AXIS_TDATA_WIDTH - PACKET_WIDTH;
    wire [AXIS_PACKET_WIDTH_DIFFERENCE-1:0] padding = {AXIS_PACKET_WIDTH_DIFFERENCE{1'b0}};
    
    assign padded_packet = {padding, packet};
    
    DoubleBuffer #(
        .BUFFER_DEPTH(MAX_NUM_PACKETS),
        .DATA_WIDTH(C_M00_AXIS_TDATA_WIDTH)
    ) DoubleBuffer_inst (
        .clk(clk),
        .rst(rst),
        .tick(tick),
        .din_valid(packet_valid),
        .din(padded_packet),
        .read_addr(read_addr),
        .dout(buffer_out),
        .num_packets(num_packets),
        .read_en(read_en),
        .buffer_overflow_error(buffer_overflow_error)
    );
    
    AXIStreamPacketBuffer_M00_AXIS #(
        .MAX_STREAM_DEPTH(MAX_NUM_PACKETS),
        .C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
        .C_M_START_COUNT(C_M00_AXIS_START_COUNT)
    ) AXIStreamPacketBuffer_M00_AXIS_inst (
        .read_en(read_en),
        .data(buffer_out),
        .num_packets(num_packets),
        .read_addr(read_addr),
        .buffer_to_stream_error(buffer_to_stream_error),
        .M_AXIS_ACLK(m00_axis_aclk),
        .M_AXIS_ARESETN(m00_axis_aresetn), 
        .M_AXIS_TVALID(m00_axis_tvalid),
        .M_AXIS_TDATA(m00_axis_tdata),
        .M_AXIS_TSTRB(m00_axis_tstrb),
        .M_AXIS_TLAST(m00_axis_tlast),
        .M_AXIS_TREADY(m00_axis_tready)
    );
    
endmodule

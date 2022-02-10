`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AXI-StreamPacketBuffer.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// A test bench for the AXIStreamPacketBuffer
//////////////////////////////////////////////////////////////////////////////////


module AXIStreamPacketBuffer_tb();

    parameter CLOCK_PERIOD_NS_tb = 20;

    parameter PACKET_WIDTH_tb = 30;
    parameter AXIS_WIDTH_tb = 32;
    parameter MAX_NUM_PACKETS_tb = 200;
    // Parameters of Axi Master Bus Interface M00_AXIS
    parameter integer C_M00_AXIS_TDATA_WIDTH_tb = 32;
    parameter integer C_M00_AXIS_START_COUNT_tb = 32;

    reg clk_tb, rst_tb, tick_tb;
    reg [PACKET_WIDTH_tb-1:0] packet_tb;
    reg packet_valid_tb;
    wire buffer_overflow_error_tb, buffer_to_stream_error_tb;
    // Ports of Axi Master Bus Interface M00_AXIS
    reg  m00_axis_aclk_tb, m00_axis_aresetn_tb;
    wire  m00_axis_tvalid_tb;
    wire [C_M00_AXIS_TDATA_WIDTH_tb-1 : 0] m00_axis_tdata_tb;
    wire [(C_M00_AXIS_TDATA_WIDTH_tb/8)-1 : 0] m00_axis_tstrb_tb;
    wire  m00_axis_tlast_tb;
    reg  m00_axis_tready_tb;
    
    AXIStreamPacketBuffer #(
        .PACKET_WIDTH(PACKET_WIDTH_tb),
        .AXIS_WIDTH(AXIS_WIDTH_tb),
        .MAX_NUM_PACKETS(MAX_NUM_PACKETS_tb),
        .C_M00_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH_tb),
        .C_M00_AXIS_START_COUNT(C_M00_AXIS_START_COUNT_tb)
    ) AXIStreamPacketBuffer_tb (
        .clk(clk_tb),
        .rst(rst_tb),
        .tick(tick_tb),
        .packet(packet_tb),
        .packet_valid(packet_valid_tb),
        .buffer_overflow_error(buffer_overflow_error_tb),
        .buffer_to_stream_error(buffer_to_stream_error_tb),
        // Ports of Axi Master Bus Interface M00_AXIS
        .m00_axis_aclk(m00_axis_aclk_tb),
        .m00_axis_aresetn(m00_axis_aresetn_tb),
        .m00_axis_tvalid(m00_axis_tvalid_tb),
        .m00_axis_tdata(m00_axis_tdata_tb),
        .m00_axis_tstrb(m00_axis_tstrb_tb),
        .m00_axis_tlast(m00_axis_tlast_tb),
        .m00_axis_tready(m00_axis_tready_tb)
    );
    
    integer i;
    
    always begin
        clk_tb <= ~clk_tb;
        m00_axis_aclk_tb <= ~m00_axis_aclk_tb;
        #(CLOCK_PERIOD_NS_tb / 2);
    end
    
    initial begin
        // Initialize everything
        clk_tb <= 0;
        rst_tb <= 1;
        tick_tb <= 0;
        packet_tb <= 0;
        packet_valid_tb <= 0;
        m00_axis_aclk_tb <= 0;
        m00_axis_aresetn_tb <= 0;
        m00_axis_tready_tb <= 1;
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge clk_tb);
        end
        @(posedge clk_tb) #2;
        // End resets
        rst_tb <= 0;
        m00_axis_aresetn_tb <= 1;
        // Send in packets from 1 to 10
        @(posedge clk_tb) #2
        packet_valid_tb <= 1;
        for (i = 1; i < 11; i = i + 1) begin
            packet_tb <= i;
            @(posedge clk_tb) #2;
        end
        packet_valid_tb <= 0;
        // Cycle tick
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        // Send in packets from 11 to 21
        @(posedge clk_tb) #2
        packet_valid_tb <= 1;
        for (i = 11; i < 22; i = i + 1) begin
            packet_tb <= i;
            @(posedge clk_tb) #2;
        end
        packet_valid_tb <= 0;
        // Wait for AXIS
        wait(m00_axis_tlast_tb);
        @(posedge clk_tb);
        @(posedge clk_tb);
        // Cycle tick
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        // Send in packets from 22 to 32
        @(posedge clk_tb) #2
        packet_valid_tb <= 1;
        for (i = 22; i < 33; i = i + 1) begin
            packet_tb <= i;
            @(posedge clk_tb) #2;
        end
        packet_valid_tb <= 0;
        // Wait for AXIS
        wait(m00_axis_tlast_tb);
        @(posedge clk_tb);
        @(posedge clk_tb);
        // Cycle tick
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
        // Send in packets from 33 to 43
        @(posedge clk_tb) #2
        packet_valid_tb <= 1;
        for (i = 33; i < 44; i = i + 1) begin
            packet_tb <= i;
            @(posedge clk_tb) #2;
        end
        packet_valid_tb <= 0;
        // Wait for AXIS
        wait(m00_axis_tlast_tb);
        @(posedge clk_tb);
        @(posedge clk_tb);
        // Cycle tick
        @(posedge clk_tb);
        tick_tb <= 1;
        @(posedge clk_tb);
        tick_tb <= 0;
    end

endmodule

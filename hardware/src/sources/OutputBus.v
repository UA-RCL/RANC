`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// OutputBus.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Routes packets to out of the RANC IP.
//////////////////////////////////////////////////////////////////////////////////


module OutputBus #(
    parameter PACKET_WIDTH = 30,
    parameter NUM_OUTPUTS = 256,
    parameter NUM_AXONS = 256,
    parameter NUM_TICKS = 16,
    parameter DX_MSB = 29,
    parameter DX_LSB = 21,
    parameter DY_MSB = 20,
    parameter DY_LSB = 12,
    parameter ROUTER_BUFFER_DEPTH = 4
)(
    input clk,
    input rst,
    input ren_in_west,
    input ren_in_east,
    input ren_in_north,
    input ren_in_south,
    input empty_in_west,
    input empty_in_east,
    input empty_in_north,
    input empty_in_south,
    output ren_out_west,
    output ren_out_east,
    output ren_out_north,
    output ren_out_south,
    output empty_out_west,
    output empty_out_east,
    output empty_out_north,
    output empty_out_south,
    input [PACKET_WIDTH-1:0] east_in,       // East In From Next East's West Out
    input [PACKET_WIDTH-1:0] west_in,       // West In From Next West's East Out
    input [PACKET_WIDTH-(DX_MSB-DX_LSB+1)-1:0] north_in,      // North In From Next North's South Out
    input [PACKET_WIDTH-(DX_MSB-DX_LSB+1)-1:0] south_in,      // South In From Next South's North Out
    output [PACKET_WIDTH-1:0] east_out,     // East Out, Next East's West In
    output [PACKET_WIDTH-1:0] west_out,     // West Out, Next West's East In
    output [PACKET_WIDTH-(DX_MSB-DX_LSB+1)-1:0] north_out,    // North Out, Next North's South In
    output [PACKET_WIDTH-(DX_MSB-DX_LSB+1)-1:0] south_out,    // South Out, Next South's North In
    output [$clog2(NUM_OUTPUTS)-1:0] packet_out,
    output packet_out_valid,
    output token_controller_error,
    output scheduler_error
);
    
    wire [$clog2(NUM_AXONS) + $clog2(NUM_TICKS) - 1:0] router_packet;
    wire router_packet_valid;
    
    assign packet_out = router_packet[$clog2(NUM_AXONS) + $clog2(NUM_TICKS)-1:$clog2(NUM_TICKS)];
    assign packet_out_valid = router_packet_valid;
    assign token_controller_error = 0;
    assign scheduler_error = 0;

    Router #(
        .PACKET_WIDTH(PACKET_WIDTH),
        .DX_MSB(DX_MSB), 
        .DX_LSB(DX_LSB),
        .DY_MSB(DY_MSB),
        .DY_LSB(DY_LSB),
        .BUFFER_DEPTH(ROUTER_BUFFER_DEPTH)
    ) Router_tb (
        .clk(clk),
        .rst(rst),
        .din_local({PACKET_WIDTH{1'b0}}),
        .din_local_wen(1'b0),
        .din_west(west_in),
        .din_east(east_in),
        .din_north(north_in),
        .din_south(south_in),
        .ren_in_west(ren_in_west),
        .ren_in_east(ren_in_east),
        .ren_in_north(ren_in_north),
        .ren_in_south(ren_in_south),
        .empty_in_west(empty_in_west),
        .empty_in_east(empty_in_east),
        .empty_in_north(empty_in_north),
        .empty_in_south(empty_in_south),
        .dout_west(west_out),
        .dout_east(east_out),
        .dout_north(north_out),
        .dout_south(south_out),
        .dout_local(router_packet),
        .dout_wen_local(router_packet_valid),
        .ren_out_west(ren_out_west),
        .ren_out_east(ren_out_east),
        .ren_out_north(ren_out_north),
        .ren_out_south(ren_out_south),
        .empty_out_west(empty_out_west),
        .empty_out_east(empty_out_east),
        .empty_out_north(empty_out_north),
        .empty_out_south(empty_out_south),
        .local_buffers_full()
    );

endmodule

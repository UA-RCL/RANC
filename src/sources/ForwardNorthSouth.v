`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ForwardNorthSouth.v
//
// The router forwarding modules for either Forward North or Forward South.
//
// If forward north, set NORTH to 1. If forward south, set SOUTH to 0.
// BUFFER_DEPTH must be a power of 2.
//////////////////////////////////////////////////////////////////////////////////


module ForwardNorthSouth #(
    parameter PACKET_WIDTH = 21,
    parameter DY_MSB = 20,
    parameter DY_LSB = 12,
    parameter BUFFER_DEPTH = 4,
    parameter NORTH = 1
)(
    input clk,
    input rst,
    input [PACKET_WIDTH-1:0] din_routing,
    input [PACKET_WIDTH-1:0] din_east,
    input [PACKET_WIDTH-1:0] din_west,
    input empty_routing,
    input empty_east,
    input empty_west,
    input ren_in_local,
    input ren_in_routing,
    output ren_out_routing,
    output ren_out_east,
    output ren_out_west,
    output [PACKET_WIDTH-1:0] dout_routing,
    output [PACKET_WIDTH-1-(DY_MSB-(DY_LSB-1)):0] dout_local,
    output routing_buffer_empty,
    output local_buffer_empty
);

    localparam ADD = NORTH ? -1 : 1;

    wire buffers_full;
    wire [PACKET_WIDTH-1:0] merge_out;
    wire merge_out_wen;
    
    wire [PACKET_WIDTH-1:0] routing_buffer_in;
    wire routing_buffer_wen;
    wire [PACKET_WIDTH-1-(DY_MSB-(DY_LSB-1)):0] local_buffer_in;
    wire local_buffer_wen;
    
    wire routing_buffer_full, local_buffer_full;
    assign buffers_full = routing_buffer_full | local_buffer_full;


    Merge3 #(
        .DATA_WIDTH(PACKET_WIDTH)
    ) merge (
        .clk(clk),
        .rst(rst),
        .din_a(din_routing),
        .buffer_a_empty(empty_routing),
        .din_b(din_east),
        .buffer_b_empty(empty_east),
        .din_c(din_west),
        .buffer_c_empty(empty_west),
        .buffer_out_full(buffers_full),
        .read_en_a(ren_out_routing),
        .read_en_b(ren_out_east),
        .read_en_c(ren_out_west),
        .dout(merge_out),
        .wen(merge_out_wen)
    );
    
    PathDecoder2Way #(
        .DATA_WIDTH(PACKET_WIDTH),
        .DY_MSB(DY_MSB),
        .DY_LSB(DY_LSB),
        .ADD(ADD)
    ) PathDecoder2Way_tb (
        .din(merge_out),
        .wen(merge_out_wen),
        .dout_a(routing_buffer_in),
        .wen_a(routing_buffer_wen),
        .dout_b(local_buffer_in),
        .wen_b(local_buffer_wen)
    );
    
    buffer #(
        .DATA_WIDTH(PACKET_WIDTH),
        .BUFFER_DEPTH(BUFFER_DEPTH)
    ) routing_buffer (
        .clk(clk),
        .rst(rst),
        .din(routing_buffer_in),
        .din_valid(routing_buffer_wen),
        .read_en(ren_in_routing),
        .dout(dout_routing),
        .empty(routing_buffer_empty),
        .full(routing_buffer_full)
    );
    
    buffer #(
        .DATA_WIDTH(PACKET_WIDTH-(DY_MSB-(DY_LSB-1))),
        .BUFFER_DEPTH(BUFFER_DEPTH)
    ) local_buffer (
        .clk(clk),
        .rst(rst),
        .din(local_buffer_in),
        .din_valid(local_buffer_wen),
        .read_en(ren_in_local),
        .dout(dout_local),
        .empty(local_buffer_empty),
        .full(local_buffer_full)
    );
        
    
endmodule

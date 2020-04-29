`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// FromLocal.v
//
// Communicates between the core and the routing network.
// BUFFER_DEPTH must be a power of 2.
//////////////////////////////////////////////////////////////////////////////////


module FromLocal #(
    parameter PACKET_WIDTH = 30,
    parameter BUFFER_DEPTH = 4,
    parameter DX_MSB = 29,
    parameter DX_LSB = 21
)(
    input clk,
    input rst,
    input [PACKET_WIDTH-1:0] din,
    input din_wen,
    input ren_east,
    input ren_west,
    output [PACKET_WIDTH-1:0] dout_east,
    output [PACKET_WIDTH-1:0] dout_west,
    output empty_east,
    output empty_west,
    output full_east,
    output full_west
);

    wire [PACKET_WIDTH-1:0] buffer_east_in, buffer_west_in;
    wire buffer_east_wen, buffer_west_wen;
    wire signed [DX_MSB:DX_LSB] dx;
    assign dx = din[DX_MSB:DX_LSB];
    
    assign buffer_east_in = din;
    assign buffer_east_wen = dx < 0 ? 0 : din_wen; // if dx == 0 going east
    
    assign buffer_west_in = din;
    assign buffer_west_wen = dx < 0 ? din_wen : 0;
    
    buffer #(
        .DATA_WIDTH(PACKET_WIDTH),
        .BUFFER_DEPTH(BUFFER_DEPTH)
    ) buffer_east (
        .clk(clk),
        .rst(rst),
        .din(buffer_east_in),
        .din_valid(buffer_east_wen),
        .read_en(ren_east),
        .dout(dout_east),
        .empty(empty_east),
        .full(full_east)
    );
    
    buffer #(
        .DATA_WIDTH(PACKET_WIDTH),
        .BUFFER_DEPTH(BUFFER_DEPTH)
    ) buffer_west (
        .clk(clk),
        .rst(rst),
        .din(buffer_west_in),
        .din_valid(buffer_west_wen),
        .read_en(ren_west),
        .dout(dout_west),
        .empty(empty_west),
        .full(full_west)
    );
    
endmodule

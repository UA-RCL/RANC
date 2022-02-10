`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// LocalIn.v
//
// The local in module for the routing network. Packets from the north are
// prioritized over packets from the south. Packets should have dx and dy stripped.
//////////////////////////////////////////////////////////////////////////////////


module LocalIn #(
    parameter PACKET_WIDTH = 12
)(
    input clk,
    input rst,
    input [PACKET_WIDTH-1:0] din_north,
    input [PACKET_WIDTH-1:0] din_south,
    input empty_north,
    input empty_south,
    output ren_north,
    output ren_south,
    output [PACKET_WIDTH-1:0] dout,
    output dout_wen
    );
    
    
    Merge2 #(
        .DATA_WIDTH(PACKET_WIDTH)
    ) Merge (
        .clk(clk),
        .rst(rst),
        .din_a(din_north),
        .buffer_a_empty(empty_north),
        .din_b(din_south),
        .buffer_b_empty(empty_south),
        .buffer_out_full(1'b0),
        .read_en_a(ren_north),
        .read_en_b(ren_south),
        .dout(dout),
        .wen(dout_wen)
        );
    
endmodule

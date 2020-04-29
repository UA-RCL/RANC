`timescale 1ns / 1ps

module test_ForwardEastWest;

    reg clk, rst;
    reg [`packet_width-1:0] din_routing, din_token_controller;
    reg empty_routing, ren_in_north, empty_token_controller, ren_in_routing, ren_in_south;
    wire ren_out_routing, ren_out_token_controller;
    wire [`packet_width-1:0] dout_routing;
    wire routing_buffer_empty;
    wire [`packet_width-1-(`dx_msb-`dy_msb):0] dout_north, dout_south;
    wire north_buffer_empty, south_buffer_empty;

    initial begin
        $from_myhdl(clk, rst, din_routing, din_token_controller, empty_routing, ren_in_north, empty_token_controller, ren_in_routing, ren_in_south);
        $to_myhdl(ren_out_routing, ren_out_token_controller, dout_routing, routing_buffer_empty, dout_north, dout_south, north_buffer_empty, south_buffer_empty);
    end

    ForwardEastWest ForwardEastWest_tb(
        .clk                      (clk                      ),
        .rst                      (rst                      ),
        .din_routing              (din_routing              ),
        .din_token_controller     (din_token_controller     ),
        .empty_routing            (empty_routing            ),
        .ren_in_north             (ren_in_north             ),
        .empty_token_controller   (empty_token_controller   ),
        .ren_in_routing           (ren_in_routing           ),
        .ren_in_south             (ren_in_south             ),
        .ren_out_routing          (ren_out_routing          ),
        .ren_out_token_controller (ren_out_token_controller ),
        .dout_routing             (dout_routing             ),
        .routing_buffer_empty     (routing_buffer_empty     ),
        .dout_north               (dout_north               ),
        .north_buffer_empty       (north_buffer_empty       ),
        .dout_south               (dout_south               ),
        .south_buffer_empty       (south_buffer_empty       )
    );

    defparam ForwardEastWest_tb.PACKET_WIDTH = `packet_width;
    defparam ForwardEastWest_tb.DX_MSB = `dx_msb;
    defparam ForwardEastWest_tb.DX_LSB = `dx_lsb;
    defparam ForwardEastWest_tb.DY_MSB = `dy_msb;
    defparam ForwardEastWest_tb.DY_LSB = `dy_lsb;
    defparam ForwardEastWest_tb.BUFFER_DEPTH = `buffer_depth;
    defparam ForwardEastWest_tb.EAST = `east;

endmodule

`timescale 1ns / 1ps

module test_buffer;

    reg clk, rst;
    reg [`data_width-1:0] din;
    reg din_valid, read_en;

    wire [`data_width-1:0] dout;
    wire empty, full;

    initial begin
        $from_myhdl(clk, rst, din, din_valid, read_en);
        $to_myhdl(dout, empty, full);
    end

    buffer buffer_tb(
        .clk       (clk       ),
        .rst       (rst       ),
        .din       (din       ),
        .din_valid (din_valid ),
        .read_en   (read_en   ),
        .dout      (dout      ),
        .empty     (empty     ),
        .full      (full      )
    );

    defparam buffer_tb.DATA_WIDTH = `data_width;
    defparam buffer_tb.BUFFER_DEPTH = `buffer_depth;

endmodule

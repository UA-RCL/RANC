`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Merge2.v
//
// A two input "non-deterministic" merge.
// Arbitrates reads between two buffers.
// Port a is given priority over port b.
//////////////////////////////////////////////////////////////////////////////////


module Merge2#(
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst,
    input [DATA_WIDTH-1:0] din_a,
    input buffer_a_empty,
    input [DATA_WIDTH-1:0] din_b,
    input buffer_b_empty,
    input buffer_out_full,
    output reg read_en_a,
    output reg read_en_b,
    output reg [DATA_WIDTH-1:0] dout,
    output reg wen
    );
    
    initial begin
        read_en_a <= 0;
        read_en_b <= 0;
        dout <= 0;
        wen <= 0;
    end
    
    always@(negedge clk) begin
        if (rst) begin
            read_en_a <= 0;
            read_en_b <= 0;
            dout <= 0;
            wen <= 0;
        end
        else if (!buffer_out_full) begin
            if (read_en_a || read_en_b) begin
                wen <= 1;
                dout <= read_en_a ? din_a : din_b;
                read_en_a <= 0;
                read_en_b <= 0;
            end
            else begin
                wen <= 0;
                if (!buffer_a_empty) begin
                    read_en_a <= 1;
                end
                else if (!buffer_b_empty) begin
                    read_en_b <= 1;
                end
            end
        end
    end
   
endmodule

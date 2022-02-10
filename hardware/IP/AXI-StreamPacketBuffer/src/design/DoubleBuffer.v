`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// DoubleBuffer.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Buffers output packets to be sent of AXIS.
//////////////////////////////////////////////////////////////////////////////////


module DoubleBuffer #(
    parameter BUFFER_DEPTH = 32,
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst,
    input tick,
    input din_valid,
    input [DATA_WIDTH-1:0] din,
    input [clogb2(BUFFER_DEPTH)-1:0] read_addr,
    output [DATA_WIDTH-1:0] dout,
    output reg [clogb2(BUFFER_DEPTH)-1:0] num_packets,
    output reg read_en,
    output reg buffer_overflow_error
);

    function integer clogb2 (input integer bit_depth);                                   
        begin                                                                              
            for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
                bit_depth = bit_depth >> 1;                                                    
        end                                                                                
    endfunction

    reg curr_buffer;
    reg [clogb2(BUFFER_DEPTH):0] write_addr;
    reg [DATA_WIDTH-1:0] buffer_0 [0:BUFFER_DEPTH-1];
    reg [DATA_WIDTH-1:0] buffer_1 [0:BUFFER_DEPTH-1];

    integer i;
    
    // Read from whichever buffer is not currently being written to
    assign dout = curr_buffer ? buffer_0[read_addr] : buffer_1[read_addr];
    
    initial begin
        read_en <= 0;
        curr_buffer <= 0;
        write_addr <= 0;
        num_packets <= 0;
        buffer_overflow_error <= 0;
    end
    
    always@(posedge clk) begin
        if (rst) begin
            read_en <= 0;
            curr_buffer <= 0;
            write_addr <= 0;
            num_packets <= 0;
            buffer_overflow_error <= 0;
        end
        else if (tick) begin
            read_en = 1;
            curr_buffer = ~curr_buffer;
            num_packets = write_addr;
            write_addr = 0;
        end
        else begin
            read_en <= 0;
            if (din_valid) begin
                if (curr_buffer == 0)
                    buffer_0[write_addr] = din;
                else 
                    buffer_1[write_addr] = din;
                write_addr = write_addr + 1;
                // If write_addr looped around, we filled up the buffer and will get an error
                if (write_addr == 0)
                    buffer_overflow_error = 1;
            end
        end
    end

endmodule

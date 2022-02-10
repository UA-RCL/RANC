`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// FIFO.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Stores classificaiton values so that they can be read out in batches as streams.
//////////////////////////////////////////////////////////////////////////////////


module FIFO #(
    parameter AXIS_DEPTH = 32,
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 512
)(
    input clk,
    input rst,
    input din_valid,
    input [$clog2(AXIS_DEPTH):0] addr,
    input [DATA_WIDTH-1:0] din,
    output [DATA_WIDTH-1:0] dout,
    output reg ready,
    output reg fifo_full
);

    reg [$clog2(DEPTH):0] write_addr;
    reg [$clog2(DEPTH):0] counter;
    reg [DATA_WIDTH-1:0] fifo [0:DEPTH-1];
    reg [$clog2(DEPTH):0] addr_offset;
    reg ready_asserted;
    
    assign dout = fifo[addr + addr_offset - AXIS_DEPTH];

    initial begin
        write_addr <= 0;
        ready <= 0;
        addr_offset <= 0;
        counter <= AXIS_DEPTH;
        ready_asserted <= 1;
        fifo_full <= 0;
    end
    
    always@(posedge clk) begin
        if (rst) begin
            write_addr <= 0;
            ready <= 0;
            addr_offset <= 0;
            ready_asserted <= 1;
            counter <= AXIS_DEPTH;
            fifo_full <= 0;
        end
        else if (write_addr == DEPTH) begin
            // Send last batch if applicable
            if (ready_asserted) begin
                ready <= 0;
                fifo_full <= 1;
            end
            else begin
                ready_asserted <= 1;
            end
        end
        else begin
            if (din_valid) begin
                fifo[write_addr] = din;
                write_addr = write_addr + 1;
                if (write_addr != 0 && write_addr == counter) begin
                    ready <= 1;
                    ready_asserted <= 0;
                    counter <= counter + AXIS_DEPTH;
                    addr_offset = addr_offset + AXIS_DEPTH;
                end
            end
            // Assert ready an extra clock cycle so that AXIS can see it.
            else if (ready_asserted) begin
                ready <= 0;
            end
            else begin
                ready_asserted <= 1;
            end
        end 
    end

endmodule

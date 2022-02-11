`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// PacketFetch.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Addresses into the AXIS FIFO to fetch packets to be sent into RANC.
//////////////////////////////////////////////////////////////////////////////////

module PacketFetch #(
    parameter NUMBER_OF_INPUT_WORDS = 32,
    localparam integer bit_num = clogb2(NUMBER_OF_INPUT_WORDS-1)
)(
    input clk,
    input tick,
    input rst,
    input [bit_num-1:0] num_packets,
    input data_valid,
    input packet_in_contention,
    output reg [bit_num-1:0] addr,
    output reg packet_valid,
    output reg packet_read_error
);

    // function called clogb2 that returns an integer which has the 
    // value of the ceiling of the log base 2.
    function integer clogb2 (input integer bit_depth);                                   
      begin                                                                              
        for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
          bit_depth = bit_depth >> 1;                                                    
      end                                                                                
    endfunction

    // State variable
    reg [1:0] mst_exec_state; 

    localparam INITIAL_IDLE = 2'b0,
               IDLE = 2'b1,
               READ_PACKETS = 2'b10;
               
    initial begin
        packet_valid <= 0;
        addr <= 0;
        mst_exec_state <= INITIAL_IDLE;
    end

    always @(posedge clk) begin  
        if (rst) begin
            packet_valid <= 0;
            addr <= 0;
            mst_exec_state <= INITIAL_IDLE;
        end  
        else case (mst_exec_state)
            INITIAL_IDLE: begin
                mst_exec_state <= IDLE;
            end
            IDLE:
                if (tick) begin
                end
                else if (data_valid) begin
                    packet_valid <= 1;
                    mst_exec_state <= READ_PACKETS;
                end
                else begin
                    packet_valid <= 0;
                    addr <= 0;
                    mst_exec_state <= IDLE;
                end
            READ_PACKETS:
                if (tick) begin
                    packet_valid <= 0;
                    addr <= 0;
                    packet_read_error <= 1;
                    mst_exec_state <= IDLE;
                end
                else if (addr < num_packets - 1) begin
                    if (~packet_in_contention) begin
                        addr <= addr + 1;
                        packet_valid <= 1;
                        mst_exec_state <= READ_PACKETS;
                    end
                    else begin
                        packet_valid <= 0;
                    end
                end
                else begin
                    packet_valid <= 0;
                    addr <= 0;
                    mst_exec_state <= IDLE;
                end
        endcase
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// CSRAMController.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Controls reads and writes to the CSRAM.
//////////////////////////////////////////////////////////////////////////////////

module CSRAMController #(
    parameter NUM_NEURONS = 256
)(
    input clk,
    input set,
    input initialize,
    input mem_write,
    output reg complete,
    output reg [$clog2(NUM_NEURONS)-1:0] counter
);

    initial begin
       complete <= 0;
       counter <= -1;
    end
      
    always@(posedge clk)begin
        if(initialize)begin
            counter <= -1;
        end
        if(set)begin
            counter <= counter + 1;
        end
        
        if(mem_write == 1'b1) begin            
            if((counter < 255))begin
                complete <= 0;
            end
            else begin
                complete <= 1;
            end
        end
    end
    
endmodule
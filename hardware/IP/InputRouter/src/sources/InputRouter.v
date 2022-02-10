`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2018 10:34:19 AM
// Design Name: 
// Module Name: InputRouter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module InputRouter(
    input clk, 
    input rst, 
    input buffer_full,
    input captured,
    output reg [29:0] out_spike,
    output reg out_valid
);
    parameter FILENAME = "ir_file.mem";
    parameter NUM_PACKETS = 256;
    parameter bitwidth = $clog2(NUM_PACKETS);
    
    reg [29:0] input_mem [bitwidth-1:0];
    reg [bitwidth-1:0] counter;
    
    initial begin
        counter <= 0;
        $readmemb(FILENAME, input_mem);
        out_spike <= 30'd0;
    end
    
    always@(negedge clk) begin
        if (rst) begin
            counter <= 0;
            out_spike <= 30'd0;
            out_valid <= 0;
        end
        else begin
            if (!buffer_full) begin
                if (captured)
                    out_valid <= 0;
                
                out_spike <= input_mem[counter];
                out_valid <= 1;
                
                if (counter != (NUM_PACKETS))
                    counter <= counter + 1;
                
                else
                    out_valid <= 0;
            end
        end
   end
endmodule

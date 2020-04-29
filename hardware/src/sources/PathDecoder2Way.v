`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// PathDecoder2Way.v
//
// The combinational logic or the forward north / forward south modules.
//
// For forward north:
//  - ADD should be set to -1
//  - dout_a goes to north out
//  - dout_b goes to local
//
// For forward south:
//  - ADD should be set to 1
//  - dout_a goes to south out
//  - dout_b goes to local
//////////////////////////////////////////////////////////////////////////////////


module PathDecoder2Way#(
    parameter DATA_WIDTH = 23,
    parameter DY_MSB = 20,
    parameter DY_LSB = 12,
    parameter ADD = 1
)(
    input [DATA_WIDTH-1:0] din,
    input wen,
    output [DATA_WIDTH-1:0] dout_a,
    output wen_a,
    output [DATA_WIDTH-1-(DY_MSB-(DY_LSB-1)):0] dout_b,
    output wen_b
);

    wire signed [DY_MSB:DY_LSB] dy;
    assign dy = din[DY_MSB:DY_LSB];
    
    wire [DY_MSB:DY_LSB] dy_plus_add;
    assign dy_plus_add = dy + ADD;
    
    assign dout_a = DATA_WIDTH-1 == DY_MSB ? {dy_plus_add, din[DY_LSB-1:0]} : {din[DATA_WIDTH-1:DY_MSB+1], dy_plus_add, din[DY_LSB-1:0]};
    assign wen_a = dy == 0 ? 0 : wen;
    
    assign dout_b = DATA_WIDTH-1 == DY_MSB ? din[DY_LSB-1:0] : {din[DATA_WIDTH-1:DY_MSB+1], din[DY_LSB-1:0]};
    assign wen_b = dy == 0 ? wen : 0;

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ForwardNorth.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Forward North module for routing network.
//////////////////////////////////////////////////////////////////////////////////
/*

ForwardNorth_Valid FNV_TEST(
// Inputs:
    .Clock(),
    .Reset(),
    .EastToNorth(),
    .EastToNorthValid(),
    .WestToNorth(),
    .WestToNorthValid(),
    .SouthInNorthOut(),
    .SouthInNorthOutValid(),
    .NextNorthFull(),
    .NextNorthCapture(),
    .ToLocalCapture(),
    
    // Outputs:
    .NorthOutSouthIn(),
    .NorthOutSouthInValid(),
    .NorthToLocal(),
    .NorthToLocalValid(),
    .ForwardNorthFull(),
    .NorthCapturedEast(),
    .NorthCapturedWest(),
    .NorthCapturedSouth()
);

*/

module ForwardNorth#( 
    // Parameters:
    parameter PACKET_SIZE = 21,
    parameter DY_WIDTH = 9,
    parameter FIFO_SIZE = 4,
    parameter ADDRESS_SIZE = 2
)(
// Inputs:
    input Clock,
    input Reset,
    input [PACKET_SIZE-1:0] EastToNorth,
    input EastToNorthValid,
    input [PACKET_SIZE-1:0] WestToNorth,
    input WestToNorthValid,
    input [PACKET_SIZE-1:0] SouthInNorthOut,
    input SouthInNorthOutValid,
    input NextNorthFull,
    input NextNorthCapture,
    input ToLocalCapture,
    
    // Outputs:
    output [PACKET_SIZE-1:0] NorthOutSouthIn,
    output NorthOutSouthInValid,
    output [PACKET_SIZE-DY_WIDTH-1:0] NorthToLocal,
    output NorthToLocalValid,
    output ForwardNorthFull,
    output NorthCapturedEast,
    output NorthCapturedWest,
    output NorthCapturedSouth
);
    
    // Wires:
    wire [PACKET_SIZE-1:0] NonDetMergeOut, MergeBufferOut, NorthOut;
    wire [PACKET_SIZE-DY_WIDTH-1:0] LocalOut;
    wire [DY_WIDTH-1:0] RouteDecrementerOut;
    wire WriteEnable, NOCapture, LCapture, NorthOutValid, LocalOutValid;
    
    wire dy_sel, AdvSig, CompBufferOut, MergeBufferValid;

    ////////////////////////////////////////////////////////////////////////////////////////
    //
    ////////////////////////////////////////////////////////////////////////////////////////
    // NonDeterministicMerge:
    NonDetMerge3Top #(PACKET_SIZE) InputToForwardNorth(
    // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn1(EastToNorth),
        .DataIn1Valid(EastToNorthValid),
        .DataIn2(WestToNorth),
        .DataIn2Valid(WestToNorthValid),
        .DataIn3(SouthInNorthOut),
        .DataIn3Valid(SouthInNorthOutValid),
        .Full(ForwardNorthFull),
        
        // Outputs:
        .DataOut(NonDetMergeOut),
        .Write(WriteEnable),
        .Data1Captured(NorthCapturedEast),
        .Data2Captured(NorthCapturedWest),
        .Data3Captured(NorthCapturedSouth)
    );
    
    //////////////////////////////////////////////
    // DY Comp:
    Comp #(DY_WIDTH) DYComp(
        .a(NonDetMergeOut[20:12]),
        .b(9'd0),
        .gt(),
        .eq(dy_sel),
        .lt()
    );
    
    //////////////////////////////////////////////
    // Buffers:
    Buffer #(PACKET_SIZE, FIFO_SIZE, ADDRESS_SIZE) MergeBuffer(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(NonDetMergeOut),
        .WriteEn(WriteEnable),
        .AdvEn(AdvSig),
        
        // Outputs:
        .DataOut(MergeBufferOut),
        .DataOutValid(MergeBufferValid),
        .Full(ForwardNorthFull)   
    );
    
    Buffer #(1, FIFO_SIZE, ADDRESS_SIZE) CompBuffer(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(dy_sel),
        .WriteEn(WriteEnable),
        .AdvEn(AdvSig),
        
        // Outputs:
        .DataOut(CompBufferOut),
        .DataOutValid(),
        .Full()   
    );
    
    ///////////////////////////////////////////////
    // Route Decoder:
    DecodeReg #(PACKET_SIZE) RouteDecoder(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(MergeBufferOut),
        .DataInValid(MergeBufferValid),
        .Comp(CompBufferOut),
        .Full0(NextNorthFull),
        .Full1(1'b0),
        .Received0(NOCapture),
        .Received1(LCapture),
        
        // Outputs:
        .DataOut0(NorthOut),
        .DataOut1(LocalOut),
        .DataOutValid0(NorthOutValid),
        .DataOutValid1(LocalOutValid),
        .Advance(AdvSig)
    );
    
    //////////////////////////////////////////////////
    // DY Decrementer:
    Decrementer #(DY_WIDTH) DYDec(
        .a(NorthOut[20:12]),
        
        .out(RouteDecrementerOut)
    );
    
    //////////////////////////////////////////////////
    // North Out Capture Registers:
    ExitReg #(PACKET_SIZE) NorthOutRegister(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn({RouteDecrementerOut,NorthOut[11:0]}),
        .DataInValid(NorthOutValid),
        .Captured(NextNorthCapture),
        .Full(NextNorthFull),
        
        // Outputs:
        .DataOut(NorthOutSouthIn),
        .DataOutValid(NorthOutSouthInValid),
        .Received(NOCapture)
    );
    
    ExitReg #(PACKET_SIZE-DY_WIDTH) LocalOutRegister(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(LocalOut),
        .DataInValid(LocalOutValid),
        .Captured(ToLocalCapture),
        .Full(1'b0),
        
        // Outputs:
        .DataOut(NorthToLocal),
        .DataOutValid(NorthToLocalValid),
        .Received(LCapture)
    );
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ForwardSouth.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Forward South module for routing network.
//////////////////////////////////////////////////////////////////////////////////
/*

ForwardSouth_Valid FSV_TEST(
// Inputs:
    .Clock(),
    .Reset(),
    .EastToSouth(),
    .EastToSouthValid(),
    .WestToSouth(),
    .WestToSouthValid(),
    .NorthInSouthOut(),
    .NorthInSouthOutValid(),
    .NextSouthFull(),
    .NextSouthCapture(),
    .ToLocalCapture(),
    
    // Outputs:
    .SouthOutNorthIn(),
    .SouthOutNorthInValid(),
    .SouthToLocal(),
    .SouthToLocalValid(),
    .ForwardSouthFull(),
    .SouthCapturedEast(),
    .SouthCapturedWest(),
    .SouthCapturedNorth()
);

*/

module ForwardSouth #(
    // Parameters:
    parameter PACKET_SIZE = 21,
    parameter DY_WIDTH = 9,
    parameter FIFO_SIZE = 4,
    parameter ADDRESS_SIZE = 2
)(
// Inputs:
    input Clock,
    input Reset,
    input [PACKET_SIZE-1:0] EastToSouth,
    input EastToSouthValid,
    input [PACKET_SIZE-1:0] WestToSouth,
    input WestToSouthValid,
    input [PACKET_SIZE-1:0] NorthInSouthOut,
    input NorthInSouthOutValid,
    input NextSouthFull,
    input NextSouthCapture,
    input ToLocalCapture,
    
    // Outputs:
    output [PACKET_SIZE-1:0] SouthOutNorthIn,
    output SouthOutNorthInValid,
    output [PACKET_SIZE-DY_WIDTH-1:0] SouthToLocal,
    output SouthToLocalValid,
    output ForwardSouthFull,
    output SouthCapturedEast,
    output SouthCapturedWest,
    output SouthCapturedNorth
);
    
    // Wires:
    wire [PACKET_SIZE-1:0] NonDetMergeOut, MergeBufferOut, SouthOut;
    wire [PACKET_SIZE-DY_WIDTH-1:0] LocalOut;
    wire [DY_WIDTH-1:0] RouteDecrementerOut;
    wire WriteEnable, SOCapture, LCapture, SouthOutValid, LocalOutValid;
    
    wire dy_sel, AdvSig, CompBufferOut, MergeBufferValid;
    
    ////////////////////////////////////////////////////////////////////////////////////////
    //
    ////////////////////////////////////////////////////////////////////////////////////////
    // NonDeterministicMerge:
    NonDetMerge3Top #(PACKET_SIZE) InputToForwardSouth(
    // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn1(EastToSouth),
        .DataIn1Valid(EastToSouthValid),
        .DataIn2(WestToSouth),
        .DataIn2Valid(WestToSouthValid),
        .DataIn3(NorthInSouthOut),
        .DataIn3Valid(NorthInSouthOutValid),
        .Full(ForwardSouthFull),
        
        // Outputs:
        .DataOut(NonDetMergeOut),
        .Write(WriteEnable),
        .Data1Captured(SouthCapturedEast),
        .Data2Captured(SouthCapturedWest),
        .Data3Captured(SouthCapturedNorth)
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
        .Full(ForwardSouthFull)   
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
        .Full0(NextSouthFull),
        .Full1(1'b0),
        .Received0(SOCapture),
        .Received1(LCapture),
        
        // Outputs:
        .DataOut0(SouthOut),
        .DataOut1(LocalOut),
        .DataOutValid0(SouthOutValid),
        .DataOutValid1(LocalOutValid),
        .Advance(AdvSig)
    );
    
    //////////////////////////////////////////////////
    // DY Incrementer:
    Incrementer #(DY_WIDTH) DYInc(
        .a(SouthOut[20:12]),
        
        .out(RouteDecrementerOut)
    );
    
    //////////////////////////////////////////////////
    // North Out Capture Registers:
    ExitReg #(PACKET_SIZE) SouthOutRegister(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn({RouteDecrementerOut,SouthOut[11:0]}),
        .DataInValid(SouthOutValid),
        .Captured(NextSouthCapture),
        .Full(NextSouthFull),
        
        // Outputs:
        .DataOut(SouthOutNorthIn),
        .DataOutValid(SouthOutNorthInValid),
        .Received(SOCapture)
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
        .DataOut(SouthToLocal),
        .DataOutValid(SouthToLocalValid),
        .Received(LCapture)
    );
    
    
endmodule

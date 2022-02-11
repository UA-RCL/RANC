`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ForwardEast.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Forward East module for routing network.
//////////////////////////////////////////////////////////////////////////////////
/*

ForwardEast_Valid FEV_TEST(
    // Inputs:
    .Clock(),
    .Reset(),
    .WestToEast(),
    .WestToEastValid(),
    .LocalToEast(),
    .LocalToEastValid(),
    .NextEastFull(),
    .NextEastCaptured(),
    .ForwardNorthCapture(),
    .ForwardSouthCapture(),
    .ForwardNorthFull(),
    .ForwardSouthFull(),
    
    // Outputs:
    .EastToWestIn(),
    .EastToWestInValid(),
    .EastToNorth(),
    .EastToNorthValid(),
    .EastToSouth(),
    .EastToSouthValid(),
    .ForwardEastFull(),
    .PastEastCaptured()
);

*/

module ForwardEast#(
    // Parameters:
    parameter PACKET_SIZE = 30,
    parameter DX_WIDTH = 9,
    parameter DY_WIDTH = 9,
    parameter FIFO_SIZE = 4,
    parameter ADDRESS_SIZE = 2
)(
// Inputs:
    input Clock,
    input Reset,
    input [PACKET_SIZE-1:0] WestToEast,
    input WestToEastValid,
    input [PACKET_SIZE-1:0] LocalToEast,
    input LocalToEastValid,
    input NextEastFull,
    input NextEastCaptured,
    input ForwardNorthCapture,
    input ForwardSouthCapture,
    input ForwardNorthFull,
    input ForwardSouthFull,
    
    // Outputs:
    output [PACKET_SIZE-1:0] EastToWestIn,
    output EastToWestInValid,
    output Contention,
    output [PACKET_SIZE-DX_WIDTH-1:0] EastToNorth,
    output EastToNorthValid,
    output [PACKET_SIZE-DX_WIDTH-1:0] EastToSouth,
    output EastToSouthValid,
    output ForwardEastFull,
    output PastEastCaptured
);
    
    // Wires:
    wire [PACKET_SIZE-1:0] MergeOut, MergeBufferOut, EastOut;
    wire [PACKET_SIZE-DX_WIDTH-1:0] NorthSouthOut, NSOut;
    wire MergeWrite, MergeBufferValid, AdvSig, dx_sel, dy_sel;
    wire [DX_WIDTH-1:0] RouteDecrementerOut;
    wire CompOut, EastOutValid, NorthSouthOutValid, NCapture, SCapture, EOCapture;

    ////////////////////////////////////////////////////////////////////////////////////////
    //
    ////////////////////////////////////////////////////////////////////////////////////////
    // NonDetMerge Input
    NonDetMergeTop #(PACKET_SIZE) InputToForwardEast(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn1(WestToEast),
        .DataIn1Valid(WestToEastValid),
        .DataIn2(LocalToEast),
        .DataIn2Valid(LocalToEastValid),
        .Full(ForwardEastFull),
        
        // Outputs:
        .DataOut(MergeOut),
        .Write(MergeWrite),
        .Data1Captured(PastEastCaptured),
        .Data2Captured(),
        .Contention(Contention)
    );
    
    ////////////////////////////////////////////
    // Comparator and Buffers:
    Comp #(DX_WIDTH) DXComp(
        .a(MergeOut[29:21]),
        .b(9'd0),
        .gt(),
        .eq(dx_sel),
        .lt()
    );

    Buffer #(PACKET_SIZE, FIFO_SIZE, ADDRESS_SIZE) MergeBuffer(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(MergeOut),
        .WriteEn(MergeWrite),
        .AdvEn(AdvSig),
        
        // Outputs:
        .DataOut(MergeBufferOut),
        .DataOutValid(MergeBufferValid),
        .Full(ForwardEastFull)   
    );
    
    Buffer #(1, FIFO_SIZE, ADDRESS_SIZE) CompBuffer(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(dx_sel),
        .WriteEn(MergeWrite),
        .AdvEn(AdvSig),
        
        // Outputs:
        .DataOut(CompOut),
        .DataOutValid(),
        .Full()   
    );
    
    ////////////////////////////////////////////
    // Route Decoder
    DecodeReg #(PACKET_SIZE) RouteDecoder(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(MergeBufferOut),
        .DataInValid(MergeBufferValid),
        .Comp(CompOut),
        .Full0(NextEastFull),
        .Full1(ForwardNorthFull | ForwardSouthFull),
        .Received0(EOCapture),
        .Received1(NCapture | SCapture),
        
        // Outputs:
        .DataOut0(EastOut),
        .DataOut1(NorthSouthOut),
        .DataOutValid0(EastOutValid),
        .DataOutValid1(NorthSouthOutValid),
        .Advance(AdvSig)
    );
    
    ////////////////////////////////////////////
    // Decrementer
    Decrementer #(DX_WIDTH) DXDec(
        // Inputs:
        .a(EastOut[29:21]),
        
        // Outputs:
        .out(RouteDecrementerOut)
    );
    
    ////////////////////////////////////////////
    // East Out Capture Register
    ExitReg #(PACKET_SIZE) EastOutRegister(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn({RouteDecrementerOut,EastOut[20:0]}),
        .DataInValid(EastOutValid),
        .Captured(NextEastCaptured),
        .Full(NextEastFull),
        
        // Outputs:
        .DataOut(EastToWestIn),
        .DataOutValid(EastToWestInValid),
        .Received(EOCapture)
    );
    
    ////////////////////////////////////////////
    // East to South / North Capture Register
    Comp #(DY_WIDTH) DYComp(
        .a(NorthSouthOut[20:12]),
        .b(9'd0),
        .gt(),
        .eq(),
        .lt(dy_sel)
    );
    
    ExitReg #((PACKET_SIZE-DX_WIDTH)) NorthOutRegister(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(NorthSouthOut),
        .DataInValid(NorthSouthOutValid & ~dy_sel),
        .Captured(ForwardNorthCapture),
        .Full(ForwardNorthFull),
        
        // Outputs:
        .DataOut(EastToNorth),
        .DataOutValid(EastToNorthValid),
        .Received(NCapture)
    );
    
    ExitReg #((PACKET_SIZE-DX_WIDTH)) SouthOutRegister(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(NorthSouthOut),
        .DataInValid(NorthSouthOutValid & dy_sel),
        .Captured(ForwardSouthCapture),
        .Full(ForwardSouthFull),
        
        // Outputs:
        .DataOut(EastToSouth),
        .DataOutValid(EastToSouthValid),
        .Received(SCapture)
    );
    
endmodule

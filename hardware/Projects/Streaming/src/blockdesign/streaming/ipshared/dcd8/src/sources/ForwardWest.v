`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ForwardWest.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
// Forward West module for routing network.
//////////////////////////////////////////////////////////////////////////////////
/*

ForwardWest_Valid FWV_TEST(
// Inputs:
    .Clock(),
    .Reset(),
    .EastToWest(),
    .EastToWestValid(),
    .LocalToWest(),
    .LocalToWestValid(),
    .NextWestFull(),
    .NextWestCapture(),
    .ForwardNorthCapture(),
    .ForwardSouthCapture(),
    .ForwardNorthFull(),
    .ForwardSouthFull(),
    
    // Outputs:
    .WestToEastIn(),
    .WestToEastInValid(),
    .WestToNorth(),
    .WestToNorthValid(),
    .WestToSouth(),
    .WestToSouthValid(),
    .ForwardWestFull(),
    .PastWestCaptured()
);

*/

module ForwardWest#(
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
    input [PACKET_SIZE-1:0] EastToWest,
    input EastToWestValid,
    input [PACKET_SIZE-1:0] LocalToWest,
    input LocalToWestValid,
    input NextWestFull,
    input NextWestCapture,
    input ForwardNorthCapture,
    input ForwardSouthCapture,
    input ForwardNorthFull,
    input ForwardSouthFull,
    
    // Outputs:
    output [PACKET_SIZE-1:0] WestToEastIn,
    output WestToEastInValid,
    output [PACKET_SIZE-DX_WIDTH-1:0] WestToNorth,
    output WestToNorthValid,
    output [PACKET_SIZE-DX_WIDTH-1:0] WestToSouth,
    output WestToSouthValid,
    output ForwardWestFull,
    output PastWestCaptured
);
    
    // Wires:
    wire [PACKET_SIZE-1:0] MergeOut, MergeBufferOut, WestOut;
    wire [PACKET_SIZE-DX_WIDTH-1:0] NorthSouthOut, NSOut;
    wire MergeWrite, MergeBufferValid, AdvSig, dx_sel, dy_sel;
    wire [DX_WIDTH-1:0] RouteDecrementerOut;
    wire CompOut, WestOutValid, NorthSouthOutValid, NCapture, SCapture, WOCapture;
    ////////////////////////////////////////////////////////////////////////////////////////
    //
    ////////////////////////////////////////////////////////////////////////////////////////
    // NonDetMerge Input
    NonDetMergeTop #(PACKET_SIZE) InputToForwardWest(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn1(EastToWest),
        .DataIn1Valid(EastToWestValid),
        .DataIn2(LocalToWest),
        .DataIn2Valid(LocalToWestValid),
        .Full(ForwardWestFull),
        
        // Outputs:
        .DataOut(MergeOut),
        .Write(MergeWrite),
        .Data1Captured(PastWestCaptured),
        .Data2Captured()
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
        .Full(ForwardWestFull)   
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
        .Full0(NextWestFull),
        .Full1(ForwardNorthFull | ForwardSouthFull),
        .Received0(WOCapture),
        .Received1(NCapture | SCapture),
        
        // Outputs:
        .DataOut0(WestOut),
        .DataOut1(NorthSouthOut),
        .DataOutValid0(WestOutValid),
        .DataOutValid1(NorthSouthOutValid),
        .Advance(AdvSig)
    );
    
    ////////////////////////////////////////////
    // Incrementer
    Incrementer #(DX_WIDTH) DXInc(
        // Inputs:
        .a(WestOut[29:21]),
        
        // Outputs:
        .out(RouteDecrementerOut)
    );
    
    ////////////////////////////////////////////
    // West Out Capture Register
    ExitReg #(PACKET_SIZE) WestOutRegister(
        // Inputs:
        .Clock(Clock),
        .Reset(Reset),
        .DataIn({RouteDecrementerOut,WestOut[20:0]}),
        .DataInValid(WestOutValid),
        .Captured(NextWestCapture),
        .Full(NextWestFull),
        
        // Outputs:
        .DataOut(WestToEastIn),
        .DataOutValid(WestToEastInValid),
        .Received(WOCapture)
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
        .DataOut(WestToNorth),
        .DataOutValid(WestToNorthValid),
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
        .DataOut(WestToSouth),
        .DataOutValid(WestToSouthValid),
        .Received(SCapture)
    );
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NotDetMerge3.v
//
// Created for Dr. Akoglu's Reconfigurable Computing Lab
//  at the University of Arizona
// 
//////////////////////////////////////////////////////////////////////////////////
/*

NonDetMerge3_Valid NDM3V_TEST(
// Inputs:
    .Clock(),
    .Reset(),
    .Data1(),
    .Data2(),
    .Data3(),
    .Data1Valid(),
    .Data2Valid(),
    .Data3Valid(),
    .Full(),
    
    // Outputs:
    .DataOut(),
    .Write(),
    .Captured1(),
    .Captured2(),
    .Captured3()
);

*/

module NonDetMerge3 #(
	// Parameter:
	parameter PACKET_SIZE = 21
)(
// Inputs:
    input Clock,
    input Reset,
    input [PACKET_SIZE-1:0] Data1,
    input [PACKET_SIZE-1:0] Data2,
    input [PACKET_SIZE-1:0] Data3,
    input Data1Valid,
    input Data2Valid,
    input Data3Valid,
    input Full,
    
    // Outputs:
    output reg [PACKET_SIZE-1:0] DataOut,
    output reg Write,
    output reg Captured1,
    output reg Captured2,
    output reg Captured3
);
    
    reg flag0, flag1, flag2;
    reg fullFlag;
    reg ch1, ch2, ch3;
    
    always@(negedge Clock)begin
        if(Reset)begin
            Write <= 0;
            DataOut <= 0;
            flag0 <= 0;
            flag1 <= 0;
            fullFlag <= 0;
            ch1 <= 0;
            ch2 <= 0;
            ch3 <= 0;
            Captured1 <= 0;
            Captured2 <= 0;
            Captured3 <= 0;
        end
        else begin
            if(Full)begin
                fullFlag <= 1;
                ch1 <= Data1Valid;
                ch2 <= Data2Valid;
                ch3 <= Data3Valid;
            end
            //////////////////////////////////////////////////////////
            // Full Flag Logic
            else if(fullFlag && !Full)begin
                if(ch1)begin
                    DataOut <= Data1;
                    Write <= 1;
                    ch1 <= 0;
                    Captured1 <= 1;
                    Captured2 <= 0;
                    Captured3 <= 0;
                end
                else if(ch2)begin
                    DataOut <= Data2;
                    Write <= 1;
                    ch2 <= 0;
                    Captured1 <= 0;
                    Captured2 <= 1;
                    Captured3 <= 0;
                end
                else if(ch3)begin
                    DataOut <= Data3;
                    Write <= 1;
                    ch3 <= 0;
                    Captured1 <= 0;
                    Captured2 <= 0;
                    Captured3 <= 1;
                end
                else begin
                    fullFlag <= 0;
                    Captured1 <= 0;
                    Captured2 <= 0;
                    Captured3 <= 0;
                end
            end
            /////////////////////////////////////////////////////
            // Multi Packet Logic
            else if({flag0,flag1,flag2} == 3'b110 && !Full)begin
                DataOut <= Data2;
                Write <= 1;
                flag0 <= 0;
                flag1 <= 0;
                flag2 <= 0;
                Captured1 <= 0;
                Captured2 <= 1;
                Captured3 <= 0;
            end
            else if({flag0,flag1,flag2} == 3'b101 && !Full)begin
                DataOut <= Data3;
                Write <= 1;
                flag0 <= 0;
                flag1 <= 0;
                flag2 <= 0;
                Captured1 <= 0;
                Captured2 <= 0;
                Captured3 <= 1;
            end
            else if({flag0,flag1,flag2} == 3'b011 && !Full)begin
                DataOut <= Data3;
                Write <= 1;
                flag0 <= 0;
                flag1 <= 0;
                flag2 <= 0;
                Captured1 <= 0;
                Captured2 <= 0;
                Captured3 <= 1;
            end
            else if({flag0,flag1,flag2} == 3'b111 && !Full)begin
                DataOut <= Data2;
                Write <= 1;
                flag0 <= 0;
                flag1 <= 1;
                flag2 <= 1;
                Captured1 <= 0;
                Captured2 <= 1;
                Captured3 <= 0;
            end
            ////////////////////////////////////////////////////////////////
            // Packet Logic
            else if(({Data1Valid,Data2Valid,Data3Valid} == 3'b100) && !Full)begin
                flag0 <= 0;
                flag1 <= 0;
                flag2 <= 0;
                DataOut <= Data1;
                Write <= 1;
                Captured1 <= 1;
                Captured2 <= 0;
                Captured3 <= 0;
            end
            else if({Data1Valid,Data2Valid,Data3Valid} == 3'b010 && !Full)begin
                flag0 <= 0;
                flag1 <= 0;
                flag2 <= 0;
                DataOut <= Data2;
                Write <= 1;
                Captured1 <= 0;
                Captured2 <= 1;
                Captured3 <= 0;
            end
            else if({Data1Valid,Data2Valid,Data3Valid} == 3'b001 && !Full)begin
                flag0 <= 0;
                flag1 <= 0;
                flag2 <= 0;
                DataOut <= Data3;
                Write <= 1;
                Captured1 <= 0;
                Captured2 <= 0;
                Captured3 <= 1;
            end
            else if({Data1Valid,Data2Valid,Data3Valid} == 3'b110 && !Full)begin
                flag0 <= 1;
                flag1 <= 1;
                flag2 <= 0;
                DataOut <= Data1;
                Write <= 1;
                Captured1 <= 1;
                Captured2 <= 0;
                Captured3 <= 0;
            end
            else if({Data1Valid,Data2Valid,Data3Valid} == 3'b101 && !Full)begin
                flag0 <= 1;
                flag1 <= 0;
                flag2 <= 1;
                DataOut <= Data1;
                Write <= 1;
                Captured1 <= 1;
                Captured2 <= 0;
                Captured3 <= 0;
            end
            else if({Data1Valid,Data2Valid,Data3Valid} == 3'b011 && !Full)begin
                flag0 <= 0;
                flag1 <= 1;
                flag2 <= 1;
                DataOut <= Data2;
                Write <= 1;
                Captured1 <= 0;
                Captured2 <= 1;
                Captured3 <= 0;
            end
            else if({Data1Valid,Data2Valid,Data3Valid} == 3'b111 && !Full)begin
                flag0 <= 1;
                flag1 <= 1;
                flag2 <= 1;
                DataOut <= Data1;
                Write <= 1;
                Captured1 <= 1;
                Captured2 <= 0;
                Captured3 <= 0;
            end
            else begin
                Write <= 0;
                Captured1 <= 0;
                Captured2 <= 0;
                Captured3 <= 0;
                flag0 <= 0;
                flag1 <= 0;
                flag2 <= 0;
            end
        end
    end
endmodule

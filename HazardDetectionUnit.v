`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2023 11:21:30 AM
// Design Name: 
// Module Name: HazardDetectionUnit
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


module HazardDetectionUnit(
   // input [5:0] IF_ID_Opcode,
   // input [5:0] IF_ID_Funcode,
    input [4:0] IF_ID_Rs,
    input [4:0] IF_ID_Rt,
    input [4:0] RegDst,
    input ID_EX_MemRead,
    //input [4:0] ID_EX_Rt,
   // input [4:0] ID_EX_Rs,
    input branch,
    input jump,
    //input [4:0] ID_EX_Rd,
    input ID_EX_RegWrite,
    input EX_MEM_RegWrite,
   //nput [4:0] EX_MEM_Rd,
    input EX_MEM_MemRead,
   // input ID_EX_MemWrite,
    //input EX_MEM_MemWrite,
    output reg PCWrite,
    output reg IF_ID_Write,
    output reg ControlMux,
    output reg IF_Flush
    );
    
   /* parameter BEQ = 6'b000100; //function code
    parameter BNE = 6'b000101; //opcode
    parameter BLTZ = 6'b000000; //opcode **have the same opcode different instruction 20:16
    parameter BGEZ = 6'b000001; //opcode **have the same opcode different instruction 20:16
    parameter BGTZ = 6'b000111; //opcode
    parameter BLEZ = 6'b000110; //opcode
    
    parameter R_Type = 6'b000000;
    parameter J = 6'b000010; //opcode
    parameter JR = 6'b001000; //function
    parameter JAL = 6'b000011; //opcode
    parameter LW = 6'b100011; //opcode
    parameter SW = 6'b101011; //opcode
    parameter SB = 6'b101000; //opcode
    parameter LH = 6'b100001; //opcode
    parameter LB = 6'b100000; //opcode
    parameter SH = 6'b101001; //opcode
    
    parameter ADDI = 6'b001000; //opcode
    parameter ANDI = 6'b001100; //opcode
    parameter ORI = 6'b001101; //opcode
    parameter XORI = 6'b001110; //opcode
    parameter SLTI = 6'b001010; //opcode*/
    
    always @(*) begin
       
        //LW/LB/LH in EX and dependencies in ID stage
        if ((ID_EX_MemRead == 1) && ((RegDst == IF_ID_Rs) || (RegDst == IF_ID_Rt))) begin
            PCWrite <= 0;
            IF_ID_Write <= 0;
            ControlMux <= 0;
            IF_Flush <= 0;
        end
        //LW/LB/LH in MEM and dependencies in ID stage
        else if ((EX_MEM_MemRead == 1) && ((RegDst == IF_ID_Rs) || (RegDst == IF_ID_Rt))) begin
            PCWrite <= 0;
            IF_ID_Write <= 0;
            ControlMux <= 0;
            IF_Flush <= 0;
        end
        else if ((ID_EX_RegWrite == 1) && ((RegDst == IF_ID_Rs) || (RegDst == IF_ID_Rt))) begin
            PCWrite <= 0;
            IF_ID_Write <= 0;
            ControlMux <= 0;
            IF_Flush <= 0;
        end
        else if ((EX_MEM_RegWrite == 1) && ((RegDst == IF_ID_Rs) || (RegDst == IF_ID_Rt))) begin
            PCWrite <= 0;
            IF_ID_Write <= 0;
            ControlMux <= 0;
            IF_Flush <= 0;
        end
        else if ((branch == 1) || (jump == 1)) begin //flush but do not stall
            PCWrite <= 1;
            IF_ID_Write <= 1;
            ControlMux <= 1;
            IF_Flush <= 1;
        end
     end
        
        
endmodule

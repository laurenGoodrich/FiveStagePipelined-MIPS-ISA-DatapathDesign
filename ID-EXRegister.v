`timescale 1ns / 1ps

module ID_EX_Register(Clk, RegWrite, ALUSrc, ALUOp, RegDst, MemWrite, MemRead,  MemToReg, readData1, 
readData2, signExtend, RtData, RdData, shamt, BHC, RegWrite_EX, ALUSrc_EX, 
ALUOp_EX, RegDst_EX, MemWrite_EX, MemRead_EX, MemToReg_EX, readData1_EX,
 readData2_EX, signExtend_EX, RtData_EX, RdData_EX, shamt_out, BHC_EX);

  input RegWrite, ALUSrc, RegDst, MemWrite, MemRead,  MemToReg;
  input [31:0] readData1, readData2;
  input [4:0] RtData;
  input [4:0] RdData;
  input [31:0] signExtend;
//  input [31:0] PCAdderResult;
//  input [31:0] jumpAddress;
  input Clk;
  input [3:0] ALUOp;
//  input JR, Jump;
  input [4:0] shamt;
//  input JalMux;
  input [1:0] BHC;

  output reg RegWrite_EX, ALUSrc_EX, RegDst_EX, MemWrite_EX, MemRead_EX, MemToReg_EX;
  output reg [31:0] readData1_EX, readData2_EX;
  output reg [31:0] signExtend_EX;
 // output reg [31:0] PCAdderResult_EX;
  output reg [4:0] RtData_EX;
  output reg [4:0] RdData_EX;
 // output reg [31:0] jumpAddress_EX;
  output reg [3:0] ALUOp_EX;
 // output reg JR_EX, Jump_EX;
  output reg [4:0] shamt_out;
 // output reg JalMux_EX;
  output reg [1:0] BHC_EX;
  

/*  always @(reset) begin 
    if (reset == 1) begin
      RegWrite_EX <= 0;
      ALUSrc_EX <= 0;
      RegDst_EX <= 0;
      Branch_EX <= 0;
      MemWrite_EX <= 0;
      MemRead_EX <= 0;
      PCSrc_EX <= 0;
      MemToReg_EX <= 0;
      readData1_EX <= 0;
      readData2_EX <= 0;
      signExtend_EX <= 0;
      PCAdderResult_EX <= 0;
      RtData_EX <= 0;
      RdData_EX <= 0;
      jumpAddress_EX <= 0;
    end
  end*/

  always @(posedge Clk) begin
    RegWrite_EX <= RegWrite;
    ALUSrc_EX <= ALUSrc;
    RegDst_EX <= RegDst;
  //  Branch_EX <= Branch;
    MemWrite_EX <= MemWrite;
    MemRead_EX <= MemRead;
  //  PCSrc_EX <= PCSrc;
    MemToReg_EX <= MemToReg;
    readData1_EX <= readData1;
    readData2_EX <= readData2;
    signExtend_EX <= signExtend;
 //   PCAdderResult_EX <= PCAdderResult;
    RtData_EX <= RtData;
    RdData_EX <= RdData;
 //   jumpAddress_EX <= jumpAddress;
 //   JR_EX <= JR;
 //   Jump_EX <= Jump;
    ALUOp_EX <= ALUOp;
    shamt_out <= shamt;
 //   JalMux_EX <= JalMux;
    BHC_EX <= BHC;
  end




endmodule

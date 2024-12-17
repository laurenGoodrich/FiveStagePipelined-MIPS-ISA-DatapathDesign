`timescale 1ns / 1ps

module MEM_WB_Register(Clk, ALUResult, dataMemOut, RegWrite, MemToReg, WriteRegister,ALUResult_WB, dataMemOut_WB, RegWrite_WB, MemToReg_WB, WriteRegister_WB);

  input Clk;
  input [31:0] ALUResult;
  input [31:0] dataMemOut;
  input RegWrite, MemToReg;
  input [4:0] WriteRegister;

  output reg [31:0] ALUResult_WB;
  output reg [31:0] dataMemOut_WB;
  output reg  RegWrite_WB, MemToReg_WB;
  output reg [4:0] WriteRegister_WB;

 /* always @(reset) begin
    if (reset == 1) begin
      ALUResult_WB <= 0;
      dataMemOut_WB <= 0;
      RegWrite_WB <= 0;
      MemToReg_WB <= 0;
      Branch_WB <= 0;
      MemRead_WB <= 0;
      MemWrite_WB <= 0;
      WriteRegister_WB <= 0;
    end
  end*/

  always @(posedge Clk) begin
    ALUResult_WB <= ALUResult;
    dataMemOut_WB <= dataMemOut;
    RegWrite_WB <= RegWrite;
    MemToReg_WB <= MemToReg;

  //  MemRead_WB <= MemRead;
  //  MemWrite_WB <= MemWrite;
    WriteRegister_WB <= WriteRegister;
  end


endmodule
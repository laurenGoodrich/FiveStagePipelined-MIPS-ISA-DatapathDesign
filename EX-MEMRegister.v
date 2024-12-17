

  `timescale 1ns / 1ps

  module EX_MEM_Register(Clk, RegWrite, RegDst, MemWrite, MemRead, MemToReg, ALUResult,
   zeroFlag, readData2_in, BHC_in, RegWrite_out, RegDst_out, MemWrite_out, MemRead_out,  
   MemToReg_out, ALUResult_out, readData2_out, BHC_out);



    input RegWrite, MemWrite, MemRead, MemToReg;
  //  input [31:0] branchTarget; //output of adder
    input [31:0] ALUResult;
    input zeroFlag;
    input Clk;
//    input [31:0] jumpAddress_in;
//    input jalIn;
    input [31:0] readData2_in;
//    input Branch_in;
//    input JR_in;
//    input Jump_in;
//    input [31:0] readData1_in;
    input [4:0] RegDst;
    input [1:0] BHC_in;

    output reg RegWrite_out, MemWrite_out, MemRead_out, MemToReg_out;
//    output reg [31:0] branchTarget_out;
    output reg [31:0] ALUResult_out;

//    output reg [31:0] jumpAddress_out;
//    output reg Jal_out;
    output reg [31:0] readData2_out;
//    output reg [1:0] PCSrcOut;
//    output reg [31:0] readData1_out;
    output reg [4:0] RegDst_out;
    output reg [1:0] BHC_out;


   /* always @(reset) begin
      if (reset == 1) begin
        RegWrite_out <= 0;
        readData2_out <= 0;
        RegDst_out <= 0;

        MemWrite_out <= 0;
        MemRead_out <= 0;

        MemToReg_out <= 0;
        branchTarget_out <= 0;
        ALUResult_out <= 0;

        jumpAddress_out <= 0;
      end
    end*/

    always @(posedge Clk) begin
      RegWrite_out <= RegWrite;
      readData2_out <= readData2_in;
      RegDst_out <= RegDst;
//      readData1_out <= readData1_in;

      MemWrite_out <= MemWrite;
      MemRead_out <= MemRead;

      MemToReg_out <= MemToReg;
//      branchTarget_out <= branchTarget;
      ALUResult_out <= ALUResult;

//      jumpAddress_out <= jumpAddress_in;
//      Jal_out <= jalIn;
      BHC_out <= BHC_in;


/*      if (Branch_in == 1 && zeroFlag == 1) begin
          PCSrcOut <= 1;
      end
      else if (Jump_in == 1) begin
          PCSrcOut <= 3;
      end
      else if (JR_in == 1) begin
          PCSrcOut <= 2;
      end
      else begin
          PCSrcOut <= 0;
      end*/

    end



  endmodule

  
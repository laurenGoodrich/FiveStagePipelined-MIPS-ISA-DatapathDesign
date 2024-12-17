`timescale 1ns / 1ps

module Controller_tb ();

  reg [31:0] Instruction;

  wire RegDst;
  wire [3:0] ALUOp;
  wire ALUSrc;
  wire Branch;
  wire RegWrite;
  wire MemWrite;
  wire MemRead;
 // wire PCSrc;
  wire MemToReg;
  //reg Jump;
  wire JRMux;

  Controller u0(
    .Instruction(Instruction),
    .RegDst(RegDst),
    .ALUOp(ALUOp),
    .ALUSrc(ALUSrc),
    .Branch(Branch),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    //.PCSrc(PCSrc),
    .MemToReg(MemToReg),
    .Jump(Jump),
    .JRMux(JRMux),
    .JalMux(JalMux)
  );
  
  /*output reg RegDst;
  output reg [3:0] ALUOp;
  output reg ALUSrc;
  output reg Branch;
  output reg RegWrite;
  output reg MemWrite;
  output reg MemRead;
  //output reg PCSrc;
  output reg MemToReg;
  output reg Jump;
  output reg JRMux;
  output reg JalMux;
*/

  initial begin
    
    #50 Instruction <= 32'b00000000000000000000000000100100; //AND.
    #50 Instruction <= 32'b00000000000000000000000000100000; //ADD.
    #50 Instruction <= 32'b00000000000000000000000000100010; //SUB.
    #50 Instruction <= 32'b00000000000000000000000000101010; //SLT.
    #50 Instruction <= 32'b00000000000000000000000000000000; //SLL.
    #50 Instruction <= 32'b00000000000000000000000000011000; //MUL.
    #50 Instruction <= 32'b00000000000000000000000000100101; //OR.
    #50 Instruction <= 32'b00010000000000000000000000000100; //BEQ.
    #50 Instruction <= 32'b00010100000000000000000000000000; //BNE.
    #50 Instruction <= 32'b00000100000000000000000000000000; //BLTZ.
    #50 Instruction <= 32'b00000100000000010000000000000000; //BGEZ.
    #50 Instruction <= 32'b00000000000000000000000000100111; //NOR.
    #50 Instruction <= 32'b00000000000000000000000000100110; //XOR.
    #50 Instruction <= 32'b00000000000000000000000000000010; //SRL.
    #50 Instruction <= 32'b00100000000000000000000000000000; //ADDI.
    #50 Instruction <= 32'b00110000000000000000000000000000; //ANDI.
    #50 Instruction <= 32'b00110100000000000000000000000000; //ORI.
    #50 Instruction <= 32'b00111000000000000000000000000000; //XORI.
    #50 Instruction <= 32'b00101000000000000000000000000000; //SLTI.
    #50 Instruction <= 32'b10001100000000000000000000000000; //LW.
    #50 Instruction <= 32'b10101100000000000000000000000000; //SW.
    #50 Instruction <= 32'b10100000000000000000000000000000; //SB.
    #50 Instruction <= 32'b10000100000000000000000000000000; //LH.
    #50 Instruction <= 32'b10000000000000000000000000000000; //LB.
    #50 Instruction <= 32'b10100100000000000000000000000000; //SH.
    #50 Instruction <= 32'b00001000000000000000000000000000; //J.
    #50 Instruction <= 32'b00000000000000000000000000001000; //JR.
    #50 Instruction <= 32'b00001100000000000000000000000000; //JAL.

  end
  endmodule

    
    
    
    
    
  

  

  
  
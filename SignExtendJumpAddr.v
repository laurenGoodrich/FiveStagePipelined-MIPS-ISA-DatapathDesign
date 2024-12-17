`timescale 1ns / 1ps

module SignExtendJumpAddr(PCVal, Instruction, jumpAddress);

  input [3:0] PCVal;
  input [25:0] Instruction;
  output reg [31:0] jumpAddress;
  
  reg [27:0] temp;
  
  always @(*) begin
    temp = {Instruction, 2'b00};
    jumpAddress = {PCVal, temp};
  end
  
endmodule

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, shamt, ALUResult, Zero);

  input [3:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
  input signed [31:0] A, B;	    // inputs

  input [4:0] shamt;

  output reg [31:0] ALUResult;	// answer
  output reg Zero;	    // Zero=1 if ALUResult == 0

  //Operation: AND -- ALU control value: 0000 (0)
  //Operation: ADD -- ALU control value: 0001 (1)
  //Operation: SUB -- ALU control value: 0010 (2)
  //Operation: SLT -- ALU control value: 0011 (3)
  //Operation SLL -- ALU control value: 0100 (4)
  //Operation MUL -- ALU control value: 0101 (5)
  //Operation branch equal -- ALU control value: 0110 (6)
  //Operation BNE -- ALU control value: 0111 (7)
  //Operation BLTZ -- ALU control value: 1000 (8)
  //Operation BGEZ -- ALU control value: 1001 (9)


   always @(*)
  begin
    case (ALUControl)

      0: begin //AND/ANDI
        ALUResult <= A & B;
        Zero <= 0;
        end

      1: begin //ADD/ADDI
        ALUResult <= A + B;
        Zero <= 0;
        end

      2: begin //SUB
        ALUResult <= A - B;
        Zero <= 0;
        end

      3: begin //SLT/SLTI

          if (A[31] != B[31]) begin
            if (A[31] > B[31]) begin
              ALUResult <= 1;
              Zero <= 0;
            end 
            else begin
              ALUResult <= 0;
              Zero <= 1;
            end
          end

          else begin
            if (A < B) begin
              ALUResult <= 1;
              Zero <= 0;
            end
            else begin
              ALUResult <= 0;
              Zero <= 1;
            end
          end
        end

      4: begin //SLL
        ALUResult <= B << (shamt);
        Zero <= 0;
        end

      5: begin //MUL
        ALUResult <= A * B;
        Zero <= 0;
        end

     /* 6:begin //BEQ 
        ALUResult <= A != B;
        Zero <= 0;
        end*/

     /* 7: begin // BNE
        ALUResult <= A == B;
        Zero <= 0;
        end*/

  /*    8: begin //BLTZ
         
          ALUResult <= (A >= 0);
          Zero <= 0;
        end*/

   /*   9: begin//BGEZ
        ALUResult <= A < 0;
        Zero <= 0;
        end*/

      10: begin //OR/ORI
        ALUResult <= A | B;
        Zero <= 0;
      end

      11: begin //NOR
        ALUResult <= ~(A | B);
        Zero <= 0;
      end

      12: begin //XOR/XORI
        ALUResult <= A ^ B;
        Zero <= 0;
      end

      13: begin //SRL
        ALUResult <= B >> (shamt);
        Zero <= 0;
      end
      default: begin
        ALUResult <= 0;
        Zero <= 0;
      end
      
   /*   14: begin //BLEZ
        ALUResult <= (A > 0);
        Zero <= 0;
      
          
      end*/

  /*    15: begin //BGTZ
        ALUResult <= A < 0;
        Zero <= 0;
      end*/

    endcase
    
    if (ALUResult == 0) begin
        Zero <= 1;
      end
      else begin
        Zero <= 0;
      end
  end



endmodule


`timescale 1ns / 1ps

module Controller(Instruction, comparator, PCSrc, RegDst, ALUOp, ALUSrc, Branch, RegWrite, MemWrite, MemRead, MemToReg, Jump, JalMux, BHC);

  input [31:0] Instruction;
  input comparator;

  output reg RegDst;
  output reg [3:0] ALUOp;
  output reg ALUSrc;
  output reg Branch;
  output reg RegWrite;
  output reg MemWrite;
  output reg MemRead;
  output reg PCSrc;
  output reg MemToReg;
  output reg Jump;
//  output reg JRMux;
  output reg JalMux;
  output reg [1:0] BHC;

  wire [5:0] Opcode = Instruction [31:26];

  wire [5:0] Function = Instruction [5:0];

  // 6 bit opcodes for ALU operations
  parameter AND = 6'b100100; //function code
  parameter ADD = 6'b100000; //function code
  parameter SUB = 6'b100010; //function code
  parameter SLT = 6'b101010; //function code
  parameter SLL = 6'b000000; //function code
  parameter MUL = 6'b011100; //opcode code 011100
  parameter OR = 6'b100101; //function code
  parameter SRL = 6'b000010; //function code

  parameter BEQ = 6'b000100; //function code
  parameter BNE = 6'b000101; //opcode
  parameter BLTZ = 6'b000000; //opcode **have the same opcode different instruction 20:16
  parameter BGEZ = 6'b000001; //opcode **have the same opcode different instruction 20:16
  parameter BGTZ = 6'b000111; //opcode
  parameter BLEZ = 6'b000110; //opcode
  parameter NOR = 6'b100111; //function
  parameter XOR = 6'b100110; //function

  parameter ADDI = 6'b001000; //opcode
  parameter ANDI = 6'b001100; //opcode
  parameter ORI = 6'b001101; //opcode
  parameter XORI = 6'b001110; //opcode
  parameter SLTI = 6'b001010; //opcode

  //LW, SW, SB (store byte), LH (load half), LB (load byte), SH (store half)
  //J, JR, JAL
  parameter LW = 6'b100011; //opcode
  parameter SW = 6'b101011; //opcode
  parameter SB = 6'b101000; //opcode
  parameter LH = 6'b100001; //opcode
  parameter LB = 6'b100000; //opcode
  parameter SH = 6'b101001; //opcode
  parameter J = 6'b000010; //opcode
  parameter JR = 6'b001000; //function
  parameter JAL = 6'b000011; //opcode

  //BHC: 0 -> Byte
  //BHC: 1 -> HalfWord
  //BHC: 2 -> Word

  //ALUSrc does not work
  //ALUOp does not work
  always @(*) begin


//   if(Instruction == 32'b0) begin
//      RegWrite <= 0;
//        ALUSrc <= 0;
//        ALUOp <= 0;
//      RegDst <= 0;
//        Branch <= 0;
//        MemWrite <= 0;
//       MemRead <= 0;
//        //PCSrc2 <= 0;
//        MemToReg <= 0;
//        Jump <= 0;
//        JRMux <= 0;
//    end
    begin
        case (Opcode) 
            0: begin // R - type instructions
                case (Function) 
                
                JR: begin
              RegWrite <= 0;
              ALUSrc <= 0;
              ALUOp <= 0;
              RegDst <= 1;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              PCSrc <= 2;
              MemToReg <= 1;
              Jump <= 0;
             // JRMux <= 1;
              JalMux <= 1;
              BHC <= 2;

            end
                    AND: begin //works
                        RegWrite <= 1;
                        ALUSrc <= 0;
                        ALUOp <= 4'b0;
                        RegDst <= 1;
                        Branch <= 0;
                        MemWrite <= 0;
                        MemRead <= 0;
                        PCSrc <= 0;
                        MemToReg <= 1;
                        Jump <= 0;
                      //  JRMux <= 0;
                        JalMux <= 1;
                        BHC <= 2;
                        end

                    ADD: begin //works
                        RegWrite <= 1;
                        ALUSrc <= 0;
                        ALUOp <= 1;
                        RegDst <= 1;
                        Branch <= 0;
                        MemWrite <= 0;
                        MemRead <= 0;
                        PCSrc <= 0;
                        MemToReg <= 1;
                        Jump <= 0;
                      //  JRMux <= 0;
                        JalMux <= 1;
                        BHC <= 2;
                        end

                    SUB: begin //works
                         RegWrite <= 1;
                         ALUSrc <= 0;
                         ALUOp <= 2;
                        RegDst <= 1;
                        Branch <= 0;
                        MemWrite <= 0;
                        MemRead <= 0;
                        PCSrc <= 0;
                        MemToReg <= 1;
                        Jump <= 0;
                      //  JRMux <= 0;
                        JalMux <= 1;
                        BHC <= 2;
                        end

                   SLT: begin   //works
                        RegWrite <= 1;
                        ALUSrc <= 0;
                        ALUOp <= 3;
                        RegDst <= 1;
                        Branch <= 0;
                        MemWrite <= 0;
                        MemRead <= 0;
                        PCSrc <= 0;
                        MemToReg <= 1;
                        Jump <= 0;
                      //  JRMux <= 0;
                        JalMux <= 1;
                        BHC <= 2;
                        end

                 SLL: begin //works
                      RegWrite <= 1;
                      ALUSrc <= 0;
                      ALUOp <= 4;
                      RegDst <= 1;
                      Branch <= 0;
                      MemWrite <= 0;
                      MemRead <= 0;
                      PCSrc <= 0;
                      MemToReg <= 1;
                      Jump <= 0;
                  //    JRMux <= 0;
                      JalMux <= 1;
                      BHC <= 2;
                      end


              OR: begin //works
                  RegWrite <= 1;
                  ALUSrc <= 0;
                  ALUOp <= 10;
                  RegDst <= 1;
                  Branch <= 0;
                  MemWrite <= 0;
                  MemRead <= 0;
                  PCSrc <= 0;
                  MemToReg <= 1;
                  Jump <= 0;
                //  JRMux <= 0;
                  JalMux <= 1;
                  BHC <= 2;
                  end

             SRL: begin //works
                RegWrite <= 1;
                ALUSrc <= 0;
                ALUOp <= 13;
                RegDst <= 1;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 0;
                PCSrc <= 0;
                MemToReg <= 1;
                Jump <= 0;
              //  JRMux <= 0;
                JalMux <= 1;
                BHC <= 2;
              end

              NOR: begin //work
                RegWrite <= 1;
                ALUSrc <= 0;
                ALUOp <= 11;
                RegDst <= 1;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 0;
                PCSrc <= 0;
                MemToReg <= 1;
                Jump <= 0;
            //    JRMux <= 0;
                JalMux <= 1;
                BHC <= 2;
              end


              XOR: begin //works
                RegWrite <= 1;
                ALUSrc <= 0;
                ALUOp <= 12;
                RegDst <= 1;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 0;
                PCSrc <= 0;
                MemToReg <= 1;
                Jump <= 0;
             //   JRMux <= 0;
                JalMux <= 1;
                BHC <= 2;
              end
            default:
          begin
            RegDst <= 0;
            ALUOp <= 0;
            ALUSrc <= 0;
            Branch <= 0;
            RegWrite <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            PCSrc <= 0;
            MemToReg <= 0;
            Jump <= 0;
         //   JRMux <= 0;
            JalMux <= 1;
            BHC <= 2;
        end
        endcase
     end

            1: begin
              case (Instruction[20:16])
                BLTZ: begin //i think it works
                  RegWrite <= 0;
                  ALUSrc <= 0;
                  ALUOp <= 8;
                  RegDst <= 0;
                  Branch <= comparator;
                  MemWrite <= 0;
                  MemRead <= 0;
                  MemToReg <= 0;
                  Jump <= 0;
               //   JRMux <= 0;
                  JalMux <= 1;
                  BHC <= 2;
                  
                  if (Branch == 1) begin
                    PCSrc <= 1;
                  end
                  else begin
                    PCSrc <= 0;
                  end
                end

              BGEZ: begin //i think this works
                RegWrite <= 0;
                ALUSrc <= 0;
                ALUOp <= 9;
                RegDst <= 0;
                Branch <= comparator;
                MemWrite <= 0;
                MemRead <= 0;
                MemToReg <= 0;
            //    JRMux <= 0;
                Jump <= 0;
                JalMux <= 1;
                BHC <= 2;
                
                if (Branch == 1) begin
                    PCSrc <= 1;
                  end
                else begin
                    PCSrc <= 0;
                end
              end

              default:
          begin
            RegDst <= 0;
            ALUOp <= 0;
            ALUSrc <= 0;
            Branch <= 0;
            RegWrite <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            PCSrc <= 0;
            MemToReg <= 0;
            Jump <= 0;
        //    JRMux <= 0;
            JalMux <= 1;
            BHC <= 2;
        end
          endcase
        end

             MUL: begin //works
                    RegWrite <= 1;
                    ALUSrc <= 0;
                    ALUOp <= 5;
                    RegDst <= 1;
                    Branch <= 0;
                    MemWrite <= 0;
                    MemRead <= 0;
                    PCSrc <= 0;
                    MemToReg <= 1;
                    Jump <= 0;
                //    JRMux <= 0;
                    JalMux <= 1;
                    BHC <= 2;
                    end

            J: begin //works
              RegWrite <= 0;
              ALUSrc <= 0;
              ALUOp <= 0;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              PCSrc <= 3;
              MemToReg <= 0;
//              JRMux <= 0;
              Jump <= 1;
              JalMux <= 1;
              BHC <= 2;
            end

            BEQ: begin //i think it works
              RegWrite <= 0;
              ALUSrc <= 0;
              ALUOp <= 6;
              RegDst <= 0;
              Branch <= comparator;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
         //     JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
              
              if (Branch == 1) begin
                    PCSrc <= 1;
                  end
                  else begin
                    PCSrc <= 0;
                  end
            end

            BNE: begin //i think it works
              RegWrite <= 0;
              ALUSrc <= 0;
              ALUOp <= 7;
              RegDst <= 0;
              Branch <= comparator;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
        //      JRMux <= 1;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
              
              if (Branch == 1) begin
                    PCSrc <= 1;
                  end
                  else begin
                    PCSrc <= 0;
                  end
            end
            
            BGTZ: begin //i think it works
              RegWrite <= 0;
              ALUSrc <= 0;
              ALUOp <= 15;
              RegDst <= 0;
              Branch <= comparator;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
         //     JRMux <= 1;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
              
              if (Branch == 1) begin
                    PCSrc <= 1;
                  end
                  else begin
                    PCSrc <= 0;
                  end
            end
            
            BLEZ: begin //i think it works
              RegWrite <= 0;
              ALUSrc <= 0;
              ALUOp <= 14;
              RegDst <= 0;
              Branch <= comparator;
              MemWrite <= 0;
              MemRead <= 0;
              MemToReg <= 0;
          //    JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
              
              if (Branch == 1) begin
                    PCSrc <= 1;
                  end
                  else begin
                    PCSrc <= 0;
                  end
            end

            ADDI: begin //works
              RegWrite <= 1;
              ALUSrc <= 1;
              ALUOp <= 1;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 1;
        //      JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
            end

            ANDI: begin //works
              RegWrite <= 1;
              ALUSrc <= 1;
              ALUOp <= 0;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 1;
       //       JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
            end

            ORI: begin//works
              RegWrite <= 1;
              ALUSrc <= 1;
              ALUOp <= 10;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 1;
      //        JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
            end

            XORI: begin //works
              RegWrite <= 1;
              ALUSrc <= 1;
              ALUOp <= 12; 
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 1;
          //    JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
            end

            SLTI: begin //works
              RegWrite <= 1;
              ALUSrc <= 1;
              ALUOp <= 3;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 1;
//              JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
            end

      //LW, SW, SB (store byte), LH (load half), LB (load byte), SH (store half)
      //J, JR, JAL

            LW: begin //works
              RegWrite <= 1;
              ALUSrc <= 1;
              ALUOp <= 1; //add to calculate address
              RegDst <= 0; //Rt
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 1;
              PCSrc <= 0;
              MemToReg <= 0;
          //    JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
            end

            SW: begin //pretty sure works
              RegWrite <= 0;
              ALUSrc <= 1;
              ALUOp <= 1; //add to calculate the address
              RegDst <= 1; //Rt
              Branch <= 0;
              MemWrite <= 1;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 0;
          //    JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 2;
            end

            SB: begin
              RegWrite <= 0;
              ALUSrc <= 1;
              ALUOp <= 1;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 1;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 1;
          //    JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 0;
            end

            LH: begin
              RegWrite <= 1;
              ALUSrc <= 1;
              ALUOp <= 1;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 1;
              PCSrc <= 0;
              MemToReg <= 0;
         //     JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 1;
            end

            LB: begin
              RegWrite <= 1;
              ALUSrc <= 1;
              ALUOp <= 1;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 1;
              PCSrc <= 0;
              MemToReg <= 0;
         //     JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 0;
            end

            SH: begin
              RegWrite <= 0;
              ALUSrc <= 1;
              ALUOp <= 1;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 1;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 1;
         //     JRMux <= 0;
              Jump <= 0;
              JalMux <= 1;
              BHC <= 1;
            end


            JAL: begin
              RegWrite <= 0;
              ALUSrc <= 0;
              ALUOp <= 0;
              RegDst <= 0;
              Branch <= 0;
              MemWrite <= 0;
              MemRead <= 0;
              PCSrc <= 0;
              MemToReg <= 0;
              Jump <= 1;
        //      JRMux <= 0;
              JalMux <= 0;
              BHC <= 2;
            end
        default:
          begin
            RegDst <= 0;
            ALUOp <= 0;
            ALUSrc <= 0;
            Branch <= 0;
            RegWrite <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            PCSrc <= 0;
            MemToReg <= 0;
            Jump <= 0;
      //      JRMux <= 0;
            JalMux <= 0;
            BHC <= 2;
        end
     endcase



    end
   end

endmodule




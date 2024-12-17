`timescale 1ns / 1ps

module Top(Clk, reset, PCResult, jalMuxOut); 
  input Clk, reset;
  wire [31:0] Instruction;
  //wire [1:0] PCSrc;
  wire [1:0] PCSrcOut;
  wire [31:0] adderResult;
  wire [31:0] IF_instructionOut;
  wire [31:0] IF_PCadderResult;
  wire [31:0] out;
 // wire out2;
  wire RegWrite;
  wire RegWriteOut;
  wire RegWrite_EX;
  wire RegWrite_out;
  wire RegWrite_WB;
  wire [31:0] WriteData_WB;
  wire [31:0] ReadData;
  wire [31:0] dataMemOut_WB;
  wire [31:0] ALUResult_WB;
  wire MemToReg_WB;
  wire [31:0] ReadData1;
  wire [31:0] ReadData2;
  wire [4:0] WriteRegister_WB;
  wire [31:0] PCAdderResult_EX;
  wire [31:0] signExtend_EX;
  wire [31:0] outData;

  wire [31:0] readData1_EX;
 // wire [31:0] readData1_out;
  wire [31:0] readData2_EX;
  wire [31:0] readData2_out;
  //wire [31:0] 
  wire ALUSrc_EX;
  wire ALUSrc;
  wire ALUSrcOut;
  wire [31:0] muxToALU;
  wire [31:0] ALUResult;
  wire [31:0] ALUResult_out;
  wire Zero;
  wire [3:0] ALUOp_EX;
  wire RegDst_EX;
  wire RegDst;
  wire [4:0] RtData_EX;
  wire [4:0] RdData_EX;
  wire [4:0] RegDest;
  wire [4:0] RegDst_out;
  wire [31:0] jumpAddress;
  wire [31:0] jumpAddress_EX;
  wire [31:0] jumpAddress_out;
  wire [3:0] ALUOp;
  wire [3:0] ALUOpOut;
  wire Branch;
  wire Branch_EX;
  //wire Branch_out;
  wire MemWrite;
  wire MemWriteOut;
  wire MemWrite_EX;
  wire MemWrite_out;
  wire MemRead;
  wire MemReadOut;
  wire MemRead_EX;
  wire MemRead_out;
 // wire zeroFlag_out;

  wire JRMux;
  //wire JRMux_EX;
  //wire JRMux_out;
 // wire [31:0] JRAddr;
  wire [31:0] branchTarget_out;
  wire Jump;
  wire MemToReg;
  wire MemToRegOut;
  wire MemToReg_EX;
  wire MemToReg_out;
  wire JR_EX;
  wire Jump_EX;
  output wire [31:0] PCResult;
  wire [31:0] PCAddResult;
  wire [31:0] nextAddr;
  wire [4:0] shamt_out;
  wire JalMux;
  output wire [31:0] jalMuxOut;
  wire JalMux_EX;
  wire Jal_out;
  wire [1:0] BHC;
  wire [1:0] BHCOut;
  wire [1:0] BHC_EX;
  wire [1:0] BHC_out;
  wire [4:0] jalWROut;
  wire branchOut;
  wire RegDstOut;
  wire PCWrite;
  wire IF_ID_Write;
  wire IF_Flush;
  wire ControlMux;
  //module ClkDiv(Clk, Rst, ClkOut);


//  InstructionFetch IF(.Instruction(Instruction), .Rst(reset), .Clk(Clk), .PCSrc(PCSrcOut), .adderResult(branchTarget_out), .jumpAddress(jumpAddress_out),
//   .jumpRegAddr(readData1_out), .PCAddResult(PCAddResult), .PCResult(PCResult)); 
   //InstructionFetch(Instruction, Rst, Clk, PCSrc, adderResult, jumpAddress, jumpRegAddr, PCResult);

 // ProgramCounter PC(.Address(nextAddr), .PCResult(PCResult), .Reset(reset), .Clk(Clk));
  //ProgramCounter(Address, PCResult, Reset, Clk);

  //PCAdder PCA(.PCResult(PCResult), .PCAddResult(PCAddResult));
  // PCAdder(PCResult, PCAddResult);


 // InstructionMemory IM(.Address(PCResult), .Instruction(Instruction)); 
  // InstructionMemory(Address, Instruction); 
Mux4To1 muxIF(.out(nextAddr), .inA(PCAddResult), .inB(adderResult), .inC(ReadData1), .inD(jumpAddress), .sel(PCSrcOut));
ProgramCounter PC(.Address(nextAddr), .PCResult(PCResult), .Reset(reset), .Clk(Clk), .PCWriteIn(PCWrite));
PCAdder PCA(.PCResult(PCResult), .PCAddResult(PCAddResult));
InstructionMemory IM(.Address(PCResult), .Instruction(Instruction));
  //FourTo1Mux muxIF(.out(nextAddr), .inA(PCAddResult), .inB(branchTarget_out), .inC(readData1_out), .inD(jumpAddress_out), .sel(PCSrcOut));
  //FourTo1Mux(out, inA, inB, inC, inD, sel);

  IF_ID_Register if_id(.Clk(Clk), .PCValNowIn(PCAddResult), .instructionIn(Instruction),.instructionOut(IF_instructionOut),
   .PCValNowOut(IF_PCadderResult), .IF_ID_Write(IF_ID_Write), .Flush(IF_Flush));
   //IF_ID_Register(Clk, reset, PCValNowIn, instructionIn,instructionOut, PCValNowOut);
   
   HazardDetectionUnit hazard(.IF_ID_Rs(IF_instructionOut[25:21]), .IF_ID_Rt(IF_instructionOut[20:16]), .RegDst(RegDest), .ID_EX_MemRead(MemRead_EX), .branch(Branch), .jump(Jump),
   .ID_EX_RegWrite(RegWrite_EX), .EX_MEM_RegWrite(RegWrite_out), .EX_MEM_MemRead(MemRead_out), .PCWrite(PCWrite), .IF_ID_Write(IF_ID_Write), .ControlMux(ControlMux), .IF_Flush(IF_Flush));
   //HazardDetectionUnit(IF_ID_Rs,IF_ID_Rt,RegDst,ID_EX_MemRead,branch,jump,
   //ID_EX_RegWrite,EX_MEM_RegWrite,EX_MEM_MemRead,PCWrite,IF_ID_Write, ControlMux,IF_Flush);

  Mux32Bit2To1 jal(.out(jalMuxOut), .inA(IF_PCadderResult), .inB(WriteData_WB), .sel(JalMux)); 
//switched temporary fix ask Saul tmr
  Mux32Bit2To1 jalWR(.out(jalWROut), .inA(31), .inB(WriteRegister_WB), .sel(JalMux)); 
  
  RegisterFile regi(.ReadRegister1(IF_instructionOut[25:21]), .ReadRegister2(IF_instructionOut[20:16]), .WriteRegister(jalWROut),
   .WriteData(jalMuxOut), .RegWrite(RegWrite_WB), .Clk(Clk), .ReadData1(ReadData1), .ReadData2(ReadData2));
    //RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    
    Comparator compare(.Rs(ReadData1), .Rt(ReadData2), .Instruction(IF_instructionOut), .branch(branchOut));
    // Comparator(Rs, Rt, Instruction, branch);

  Mux32Bit2To1 muxWB(.out(WriteData_WB), .inA(dataMemOut_WB), .inB(ALUResult_WB), .sel(MemToReg_WB));
    // Mux32Bit2To1(out, inA, inB, sel);

  Controller control(.Instruction(IF_instructionOut), .comparator(branchOut), .PCSrc(PCSrcOut), .RegDst(RegDst), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .Branch(Branch),
  .RegWrite(RegWrite), .MemWrite(MemWrite), .MemRead(MemRead), .MemToReg(MemToReg), .Jump(Jump), .JalMux(JalMux), .BHC(BHC));
  //Controller(Instruction, comparator, PCSrc, RegDst, ALUOp, ALUSrc, Branch, RegWrite, MemWrite, MemRead, MemToReg, JRMux, Jump, JalMux, BHC);
  
  Control_Mux controlMux(.controlMuxSel(ControlMux), .RegDstIn(RegDst), .ALUOpIn(ALUOp), .ALUSrcIn(ALUSrc), .RegWriteIn(RegWrite), .MemWriteIn(MemWrite), .MemReadIn(MemRead),
  .MemToRegIn(MemToReg), .BHCIn(BHC), .RegDst(RegDstOut), .ALUOp(ALUOpOut), .ALUSrc(ALUSrcOut), .RegWrite(RegWriteOut), .MemWrite(MemWriteOut),
   .MemRead(MemReadOut), .MemToReg(MemToRegOut), .BHC(BHCOut) );
  //Control_Mux( controlMuxSel, RegDstIn, ALUOpIn,ALUSrcIn,RegWriteIn,MemWriteIn,MemReadIn,
  //MemToRegIn,JumpIn,JRMuxIn,JalMuxIn, BHCIn,RegDst, ALUOp, ALUSrc,RegWrite,MemWrite, MemRead,MemToReg,BHC );

  SignExtension sign(.in(IF_instructionOut[15:0]), .out(out));
  //SignExtension(in, out);

  ALU32Bit  alu(.ALUControl(ALUOp_EX), .A(readData1_EX), .B(muxToALU), .shamt(shamt_out), .ALUResult(ALUResult), .Zero(Zero));
    //ALU32Bit(ALUControl, A, B, ALUResult, Zero);

  DataMemory dMem(.Address(ALUResult_out), .WriteData(readData2_out), .Clk(Clk), .MemWrite(MemWrite_out), .MemRead(MemRead_out), .ReadData(ReadData), .BHC(BHC_out));
   // DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 


  FiveBitMux2to1 muxRegDst(.out(RegDest), .inA(RtData_EX), .inB(RdData_EX), .sel(RegDst_EX));
  // Mux32Bit2To1(out, inA, inB, sel);


  ID_EX_Register id_ex(.Clk(Clk), .RegWrite(RegWriteOut), .ALUSrc(ALUSrcOut), .ALUOp(ALUOpOut), .RegDst(RegDstOut),/* .Branch(Branch),*/ /*.JR(JRMux), .Jump(Jump), .JalMux(JalMux), */
  .MemWrite(MemWriteOut), .MemRead(MemReadOut),  .MemToReg(MemToRegOut), .readData1(ReadData1), .readData2(ReadData2), .signExtend(out),/* .PCAdderResult(IF_PCadderResult),*/
                       .RtData(IF_instructionOut[20:16]), .RdData(IF_instructionOut[15:11]), .shamt(IF_instructionOut[10:6]),/* .jumpAddress(jumpAddress)*/ .BHC(BHCOut),.RegWrite_EX(RegWrite_EX), 
    .ALUSrc_EX(ALUSrc_EX), .ALUOp_EX(ALUOp_EX), .RegDst_EX(RegDst_EX),/* .Branch_EX(Branch_EX), .JR_EX(JR_EX), .Jump_EX(Jump_EX),.JalMux_EX(JalMux_EX),*/
     .MemWrite_EX(MemWrite_EX), .MemRead_EX(MemRead_EX), .MemToReg_EX(MemToReg_EX), .readData1_EX(readData1_EX), .readData2_EX(readData2_EX), .signExtend_EX(signExtend_EX), 
                     /*  .PCAdderResult_EX(PCAdderResult_EX)*/ .RtData_EX(RtData_EX), .RdData_EX(RdData_EX),.shamt_out(shamt_out), /*.jumpAddress_EX(jumpAddress_EX),*/
                      .BHC_EX(BHC_EX));
    //ID_EX_Register(Clk, reset, RegWrite, ALUSrc, ALUOp, RegDst, Branch, JR, Jump, MemWrite, MemRead,  MemToReg, readData1, 
 //readData2, signExtend, PCAdderResult, RtData, RdData, jumpAddress, RegWrite_EX, ALUSrc_EX, 
 //ALUOp_EX, RegDst_EX, Branch_EX, JR_EX, Jump_EX, MemWrite_EX, MemRead_EX, MemToReg_EX, readData1_EX,
  //readData2_EX, signExtend_EX, PCAdderResult_EX, RtData_EX, RdData_EX, jumpAddress_EX);


  adder add(.PCAdderResult(IF_PCadderResult), .sllResult(outData), .adderResult(adderResult));
    //adder(PCAdderResult, sllResult, adderResult);

  Shift_Left_2 sll(.signExtendResult(out), .outData(outData));
  // Shift_Left_2(signExtendResult, outData);


  Mux32Bit2To1 mux_EX(.out(muxToALU), .inA(readData2_EX), .inB(signExtend_EX), .sel(ALUSrc_EX));
 // Mux32Bit2To1(out, inA, inB, sel);

  EX_MEM_Register ex_mem(.Clk(Clk), .RegWrite(RegWrite_EX) , .RegDst(RegDest), .MemWrite(MemWrite_EX), 
  .MemRead(MemRead_EX),/* .PCSrcOut(PCSrcOut), */.MemToReg(MemToReg_EX),/* .branchTarget(adderResult)*/ .ALUResult(ALUResult), .zeroFlag(Zero), /*.jumpAddress_in(jumpAddress_EX), */
  /* .jalIn(JalMux_EX),*/ /*.readData1_in(readData1_EX),*/ .readData2_in(readData2_EX), /*.Branch_in(Branch_EX), .JR_in(JR_EX), .Jump_in(Jump_EX),*/ .BHC_in(BHC_EX), 
   .RegWrite_out(RegWrite_out), .RegDst_out(RegDst_out), .MemWrite_out(MemWrite_out), .MemRead_out(MemRead_out),
   .MemToReg_out(MemToReg_out)/* .branchTarget_out(branchTarget_out)*/, .ALUResult_out(ALUResult_out),/* .jumpAddress_out(jumpAddress_out),*/ /*.Jal_out(Jal_out),*/
    .readData2_out(readData2_out),/* .readData1_out(readData1_out), */.BHC_out(BHC_out));
   //EX_MEM_Register(Clk, reset, RegWrite, RegDst, MemWrite, MemRead, PCSrcOut, MemToReg, branchTarget, ALUResult,
  //zeroFlag, jumpAddress_in, readData1_in, readData2_in, Branch_in, JR_in, Jump_in, RegWrite_out, RegDst_out, MemWrite_out, MemRead_out,  
  //MemToReg_out, branchTarget_out, ALUResult_out, jumpAddress_out, readData2_out, readData1_out);

  MEM_WB_Register mem_wb(.Clk(Clk), .ALUResult(ALUResult_out), .dataMemOut(ReadData), .RegWrite(RegWrite_out), .MemToReg(MemToReg_out),
  .WriteRegister(RegDst_out), .ALUResult_WB(ALUResult_WB), .dataMemOut_WB(dataMemOut_WB), .RegWrite_WB(RegWrite_WB), .MemToReg_WB(MemToReg_WB),
 .WriteRegister_WB(WriteRegister_WB));

//MEM_WB_Register(Clk, reset, ALUResult, dataMemOut, RegWrite, MemToReg, WriteRegister, ALUResult_WB, 
//dataMemOut_WB, RegWrite_WB, MemToReg_WB, WriteRegister_WB);

  SignExtendJumpAddr signJA(.PCVal(IF_PCadderResult[31:28]), .Instruction(IF_instructionOut[25:0]), .jumpAddress(jumpAddress));
// SignExtendJumpAddr(PCVal, Instruction, jumpAddress);





endmodule
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, BHC); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input [1:0] BHC;
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 

    output reg [31:0] ReadData; // Contents of memory location at Address

    reg [31:0] memory[0:1023];
    
    initial begin
        
    end

    //BHC: 0 -> Byte
    //BHC: 1 -> HalfWord
    //BHC: 2 -> Word
    //default: Word
    
     initial begin
      $readmemh("data_memory.mem", memory);
    end
    
    always @(posedge Clk) begin
        if (MemWrite == 1) begin
          case (BHC) 
            0: begin //SB
              case (Address[1:0])
                0: begin
                  memory[Address[11:2]] <= {memory[Address[11:2]][31:8],WriteData[7:0]};
                end
                1: begin
                  memory[Address[11:2]] <= {memory[Address[11:2]][31:16],WriteData[7:0],memory[Address[11:2]][7:0]};
                end
                2: begin
                  memory[Address[11:2]] <= {memory[Address[11:2]][31:24],WriteData[7:0],memory[Address[11:2]][15:0]};
                end
                3: begin
                  memory[Address[11:2]] <= {WriteData[7:0],memory[Address[11:2]][23:0]};
                end
                default: begin
                  memory[Address[11:2]] <= WriteData;
                end
              endcase 
            end
            1: begin //SH
              case (Address[1])
                0: begin
                  memory[Address[11:2]] <= {memory[Address[11:2]][31:16],WriteData[15:0]};
                end
                1: begin
                  memory[Address[11:2]] <= {WriteData[15:0],memory[Address[11:2]][15:0]};
                end
                default: begin
                  memory[Address[11:2]] <= WriteData;
                end
              endcase
            end
            2: begin //SW
              memory[Address[11:2]] <= WriteData;
            end
            default: begin 
              memory[Address[11:2]] <= WriteData;
            end
          endcase
        end
    end
    
    always@(*) begin
        if (MemRead == 1) begin
          case (BHC)
            0: begin //LB
              case (Address[1:0]) // 31:24,23:16,15:8,7:0
                0: begin
                  if (memory[Address[11:2]][7])
                             ReadData <= {24'hffffff,memory[Address[11:2]][7:0]};
                  else 
                    ReadData <= {24'b0,memory[Address[11:2]][7:0]};
                end
                1: begin
                  if (memory[Address[11:2]][15])
                    ReadData <= {24'hffffff,memory[Address[11:2]][15:8]};
                  else 
                    ReadData <= {24'b0,memory[Address[11:2]][15:8]};
                end 
                2: begin
                  if (memory[Address[11:2]][23])
                             ReadData <= {24'hffffff,memory[Address[11:2]][23:16]};
                  else 
                    ReadData <= {24'b0,memory[Address[11:2]][23:16]};
                end
                3: begin
                  if (memory[Address[11:2]][31])
                    ReadData <= {24'hffffff,memory[Address[11:2]][31:24]};
                  else 
                    ReadData <= {24'b0,memory[Address[11:2]][31:24]};
                end
                default: begin
                 ReadData <= memory[Address[11:2]];
                end
              endcase
            end
            1: begin //LH
              case (Address[1])
                0: begin
                  if (memory[Address[11:2]][15])
                    ReadData <= {16'hffff,memory[Address>>2][15:0]};
                  else 
                    ReadData <= {16'b0,memory[Address[11:2]][15:0]};
                end
                1: begin
                  if (memory[Address[11:2]][31])
                    ReadData <= {16'hffff,memory[Address[11:2]][31:16]};
                  else 
                    ReadData <= {16'b0,memory[Address[11:2]][31:16]};
                end
                default: begin
                  ReadData <= memory[Address[11:2]];
                end
              endcase
            end
            2: begin //LW
              ReadData <= memory[Address[11:2]];
            end
            default: begin //LW
              ReadData <= memory[Address[11:2]];
            end
          endcase
        end
        else begin
            ReadData <= 0;
        end
    end
    
    
    initial begin
      $readmemh("C:/Users/laureng5/Downloads/data_memory.mem", memory);
    end
     
    
    

endmodule

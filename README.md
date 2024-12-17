# FPGA-Based Processor Design and Video Processing Algorithm
## Overview
This project involves the design and implementation of a full-scale pipelined data path for the MIPS 32-bit Instruction Set Architecture (ISA) on a Xilinx Artix-7 FPGA. The processor supports multiple operations and includes a video processing algorithm implemented in MIPS assembly. The design provides a deep understanding of processor architecture by exploring hardware, software, and instruction set architecture design trade-offs.

## Features
- Five-Stage Pipeline: The processor features a five-stage pipeline including:

  1. IF (Instruction Fetch)
  2. ID (Instruction Decode)
  3. EX (Execute)
  4. MEM (Memory)
  5.  WB (Write-back)
    
- ALU Implementation: A 32-bit ALU supports various operations such as ADD, SUB, AND, OR, and others, including branch instructions.

- Memory and Data Handling: The design includes a custom data memory unit that supports byte, half-word, and word operations, as well as video processing operations.

- Control Unit: The control unit decodes MIPS instructions and generates appropriate control signals for each stage of the pipeline.

- Pipelined Data Path: The data path allows parallel execution of instructions, improving throughput and processing efficiency.

- Video Processing Algorithm: Implemented in MIPS assembly to perform video manipulation tasks as part of the pipeline's capabilities.

- Xilinx Artix-7 FPGA: The design is synthesized and tested on the Xilinx Artix-7 FPGA, offering an optimized architecture for embedded systems.

## Components
1. ALU32Bit
  - A 32-bit wide arithmetic logic unit (ALU) supporting various arithmetic and logic operations.
  - Supports instructions like ADD, SUB, AND, OR, SLT, MUL, and more.
2. Controller
  - Decodes MIPS instructions and generates control signals for the pipeline.
  - Supports control for various types of instructions including R-type, I-type, and J-type.
3. Data Memory
  - A 32-bit wide memory unit that supports byte, half-word, and word read/write operations.
  - Reads and writes data from/to memory based on control signals.
4. Instruction Memory
  - A hardcoded instruction memory initialized with a set of MIPS instructions for execution on the processor.
5. Program Counter (PC)
  - Keeps track of the current instruction address.
  - Supports jumps and branches with handling for pipeline hazards.
6. Pipeline Registers
  - Various registers (e.g., IF/ID, ID/EX, EX/MEM, MEM/WB) to hold intermediate values between pipeline stages, ensuring smooth instruction flow.
7. Shift Left and Adder
  - Modules for shifting values left by 2 (for jump addresses) and adding values to calculate the next instruction address.
8. Hazard Detection Unit
  - Detects data hazards and controls pipeline stalls and flushes to ensure correct data flow.
9. Multiplexers (MUX)
  - Multiple multiplexers to select inputs based on control signals, ensuring flexibility in data path routing.
10. Video Processing
  - A custom video processing algorithm implemented in MIPS assembly, demonstrating the processor's capability to handle multimedia tasks.
    
## Requirements
- Hardware: Xilinx Artix-7 FPGA
- Software: Vivado for synthesis and simulation
- Clock Frequency: 100 MHz
- Language: Verilog for hardware description
- Testbenches: Written for all major components, including ALU, controller, memory, and hazard detection units.
  
## Setup
1. Clone or Download the Repository: Clone or download the project repository.
2. Hardware Setup: Ensure the FPGA development board is connected and configured for the Xilinx Artix-7.
3. Software: Open the project in Xilinx Vivado.
4. Run Synthesis: Synthesize the design for the target FPGA device.
5. Upload to FPGA: Program the FPGA with the synthesized bitstream.
6. Test the Design: Use the provided testbenches or manual testing methods to verify the functionality of the processor.
   
## How It Works
- Instruction Fetch (IF): The processor fetches instructions from memory based on the current program counter (PC).
- Instruction Decode (ID): The instruction is decoded, and necessary operands are read from the register file.
- Execution (EX): The ALU performs the operation specified by the instruction.
- Memory (MEM): Data is read from or written to memory, if required by the instruction.
- Write-back (WB): The result of the ALU operation or memory read is written back to the register file.
  
## Control Signals
- RegWrite: Enables writing to the register file.
- MemRead: Enables reading from memory.
- MemWrite: Enables writing to memory.
- ALUSrc: Determines if the second operand comes from the register or the immediate value.
- PCSrc: Determines the next PC value (normal increment, jump, or branch).
- Branch: Controls branching logic based on comparison results.
  
## Testing
The project includes various testbenches to validate each component of the design, including the ALU, controller, memory, and overall pipelined processor. These testbenches verify correct operation for different MIPS instructions and ensure proper handling of pipeline hazards.

## Conclusion
This FPGA-based processor design project provides a comprehensive understanding of MIPS processor architecture, including pipelining, control logic, memory handling, and instruction execution. The design also includes a video processing algorithm, demonstrating the processor's versatility in handling multimedia tasks.

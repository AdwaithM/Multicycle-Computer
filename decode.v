
// Sample Instruction Set Architecture Design
// 1) Choose 2 operand data operations - accumulator mode
// 2) Choose Register names indexed as R<integer> valid for [0..NUM_REGISTERS-1]
module decode_instruction(
  instruction,
  reg_dest,     // Overwritten
  reg_source,   // Not overwritten
  immediate
  // opcode
  ) ;
  `include "params.v"

  input [INSTRUCTION_WIDTH-1:0] instruction ;
  output [REGFILE_ADDR_BITS-1:0] reg_source ;
  output [REGFILE_ADDR_BITS-1:0] reg_dest ;
  output [IMMEDIATE_WIDTH-1:0] immediate ;
  
  parameter OPCODE_LSB = INSTRUCTION_WIDTH - WIDTH_OPCODE ;
 
 
  parameter DEST_LSB = OPCODE_LSB - REGFILE_ADDR_BITS ;
   parameter SOURCE_LSB = DEST_LSB - REGFILE_ADDR_BITS;
	
  assign reg_dest = instruction[OPCODE_LSB-1:DEST_LSB] ;
  
  
  assign reg_source = instruction[DEST_LSB-1: SOURCE_LSB] ;
 

  assign immediate = instruction[IMMEDIATE_WIDTH-1:0] ;
 
    
endmodule


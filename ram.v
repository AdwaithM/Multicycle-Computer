`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:02:55 04/02/2020 
// Design Name: 
// Module Name:    ram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ram(
    address,
    data,
    read_not_write,
    clk
  );

  `include "params.v"

  input [ADDRESS_BUS_WIDTH-1:0] address ;
  inout [DATA_BUS_WIDTH-1:0] data ;
  input read_not_write ;
  input clk ;

  // NUM_ADDRESS x DATA_BUS_WIDTH bits 
  reg [DATA_BUS_WIDTH-1:0] ram_memory [NUM_ADDRESS-1:0] ;
  reg [DATA_BUS_WIDTH-1:0] data_private ;

  initial begin

  // Load the program at the halfway point which is the reset address
  // lr R1, R0[0x10]
  // lr R2, R0[0x20]
  // add R2, R1  ; R2 <= (R1) + (R2)
  // sr R0[0x30], R2
  // bneq R1, R0, -5 ;  go back to loop.

  // ASSEMBLY: lr RDest, RSource[Immediate] : lr R1, R0[0x10] or load R0(0x10) into R1
  //  unused | opcode | reg_dest | reg_source         | unused | immediate   
  //    3   |    6    |    3     |    3                    3        8       // 23 - 12 - 8 = 3
  //    0   |INSTR_LR |    1     |    0               |   0    |   16 
  //    000 | 00010   | 0001     |  0000                   0x10
  //    0000 0010  0001   0000                   0x10
  // Here you see the advantage of a Harvard Architecture
  ram_memory[4096] = 32'h00000088; //changed the values 
  ram_memory[4098] = 32'h00000010 ; //changed the values 
  
  
  
  //23'b000010 001 000 00010000    // my work 
  //32'h 00000088
 // 32'h00000010
  


  // ASSEMBLY: lr RDest, RSource[Immediate] : lr R2, R0[0x20] or load R0(0x20) into R2
  //  unused | opcode | reg_dest | reg_source         | unused | immediate   
  //    3   |    6    |    3     |    3                   3        8         // 23 - 12 - 8 = 3
  //    0   |INSTR_LR |    2     |    0               |   0    |   0x20 
  //    000 | 00010   | 0010     |  0000                   0x20
  //    0000 0010  0010   0000                   0x20
  ram_memory[4100] = 32'h00000090 ;//changed the values 
  ram_memory[4102] = 32'h00000020 ;//changed the values 
  
  
   //23'b000010 010 000     // my work 
	//32'h 00000090
 // 32'h00000020

  // add R2, R1  ; R2 <= (R1) + (R2)
  //  unused | opcode  | reg_dest | reg_source | unused  
  //   11     |   6     |    3     |    3          11      // 23 - 12  = 11
  //   000   |INSTR_ADD|  0010    |  0001      | 0x0000
  //   0000      0001  |  0010    |  0001      | 0x0000
  ram_memory[4104] = 32'h00000051 ;//changed the values
  ram_memory[4106] = 32'h00000000 ;//changed the values
  
  ///    0000 0101 0001  // my work simplified 

  // sr R0[0x10], R2
  // Instruction format 2b: Save Register
  // ASSEMBLY: sr RSource[Immediate], Rdest : sr R1[0x10], R2 or save R2 to R1(0x10)
  // unused |  opcode | reg_dest | reg_source | unused | immediate   
  //   3    |    6    |    3     |    3          3        8          // 23 - 12 - 8 = 3
  //  000   |  00011  |    2          0          0000  0x30
  //  0000  |  0011   |  0010       0000          0000  0x30
  ram_memory[4108] = 32'h000000D0 ;//changed the values
  ram_memory[4110] = 32'h00000030 ;//changed the values
  
  //       0000 1101 0000 // my work simplified 

  // Instruction format 5: LI Rdest, Immediate
  // ASSEMBLY: li RDest, Immediate : li R2, 0xA or (R1) <= 10 
  // unused | opcode | reg_dest | reg_source | unused | immediate 
  //   6    |   6    |    3     |    3       |  6   |     8         parameter INSTR_LI = 6 ;  // 23 - 9 - 8 = 6
  //  000   | 00110  |   0001   |  0000      | 0000 | 0x000
  //  0000  |  0110  |   0001   |  0000      |  0x0000
  // li R1, 0x0 ; sum <= 0 
  ram_memory[4112] = 32'h00000188 ;//changed the values
  ram_memory[4114] = 32'h00000000 ;//changed the values
  
  // 0001 1000 1000         // my work simplified

  // li R2  0x0 ; i <= 0 
  ram_memory[4116] = 32'h00000190 ;//changed the values
  ram_memory[4118] = 32'h00000000 ;//changed the values
  
  // 0001 1001 0000        // my work simplified

  // li R3, 0xA ;  test <= 10 - could count down instead - one less register
  ram_memory[4120] = 16'h00000198 ;//changed the values
  ram_memory[4122] = 16'h0000000A ;//changed the values
  
  // 0001 1001 1000           // my work simplified

  // addi R2, R2, 0x1 ; i += 1  
  // Instruction format 6: addi Rdest, Immediate
  // ASSEMBLY: addi RDest, Immediate : add R2, 0x1 or (R2) <= (R2) + 1
  // unused | opcode | reg_dest | src | unused | immediate 
  //   6    |   6    |    3     |  3  |   6    |   8     // 23 - 9 - 8 = 6
  //  000   |  00111 |   0010   | 0010| 0000   | 0x000
  //  0000  |   0111 |   0010   | 0010| 0000   | 0x001
  ram_memory[4124] = 32'h000001D2 ;//changed the values
  ram_memory[4126] = 32'h00000001 ;//changed the values
  
  //0001 1101 0010         // my work simplified

  // add R1, R2 ; sum += i  
  // add R1, R2  ; R1 <= (R2) + (R1)
  //  unused | opcode  | reg_dest | reg_source | unused  
  //   11    |   6     |    3     |    3          11      // 23 - 12  = 11
  //   000   |INSTR_ADD|  0001    |  0010      | 0x0000
  //   0000      0001  |  0001    |  0010      | 0x0000
  ram_memory[4128] = 32'h0000004A ;//changed the values
  ram_memory[4130] = 32'h00000000 ;//changed the values
  
 // 0000 0100 1010         // my work simplified

  // bneq R2, R3, -3

  // Instruction format 3: Branch Not Equal
  // ASSEMBLY: bneq RDest, RSource, Immediate : bneq R2, R1, 0x10 or PC+4+0x10 if (R1) != (R2)
  // unused |  opcode | reg_dest | reg_source | unused | immediate   
  //   3    |    6    |   3      |    3          3        8                // 23 - 12 - 8 = 3  
  //  000   |  00100  |   0001   |  0000      | 0000   |  -5 = 0xFFB
  //  0000  |  0100   |   0010   |  0011      | 0000   |  -3 = 0xFFD
  ram_memory[4132] = 32'h00000113 ;//changed the values
  ram_memory[4134] = 32'h00000FFD ;//changed the values
  
  // 0001 0001 0011       // my work simplified

  // The Data
  ram_memory[16] = 32'd20 ; //changed the # of bits to DATA_BUS_WIDTH
  ram_memory[32] = 32'd22 ; //changed the # of bits to DATA_BUS_WIDTH

  end



  
  always @ ( posedge clk ) begin
    if ( read_not_write )
      data_private <= ram_memory[address] ;
    else 
		ram_memory[address] <= data ;
  end
  assign data = ( read_not_write ? data_private : 32'bZ ) ; //changed the # of bits to DATA_BUS_WIDTH
endmodule

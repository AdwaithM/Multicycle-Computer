`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:03 02/20/2020 
// Design Name: 
// Module Name:    alu 
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


module alu(
    A,
    B,
    result,
    Alu_Op,
    Z,
    C,
    N
  ) ;

  `include "params.v"
  parameter MSB = DATA_BUS_WIDTH-1 ;

  input [DATA_BUS_WIDTH-1:0] A ;
  input [DATA_BUS_WIDTH-1:0] B ;
  input [ALU_OP_NUM_BITS-1:0] Alu_Op ;
  output [DATA_BUS_WIDTH-1:0] result ;
  output Z ;
  output N ;
  output C ;

  // answer is 1 bit larger to handle the carry out
  reg [DATA_BUS_WIDTH:0] answer ;
  always @ ( * ) begin
    case (Alu_Op) 
      ALU_OP_ADD:
	     answer <= A + B ;
      ALU_OP_SUB:
	     // answer <= A - B ;
	     answer <= A + ~(B) + 1 ;
      default:
      	     answer <= 0 ;
    endcase 
  end

  // Now the assignments
  assign result = answer[MSB:0] ;
  assign Z = ( answer ? 1'b0 : 1'b1 ) ;
  assign C = answer[DATA_BUS_WIDTH] ;
  assign N = answer[MSB] ;

endmodule

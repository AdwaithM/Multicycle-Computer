`timescale 1ns / 1ps
module data_register( 
    clk, 
    in_data, 
    out_data,
    en
  ) ;

  `include "params.v"

  input clk ;
  input [DATA_BUS_WIDTH-1:0] in_data ;
  output reg [DATA_BUS_WIDTH-1:0] out_data ;
  input en ;

  always @ (posedge clk) begin
    if ( en )
      out_data <= in_data ;
  end

endmodule

module addr_register( 
    clk, 
    in_data, 
    out_data,
    en
  ) ;

  `include "params.v"

  input clk ;
  input [ADDRESS_BUS_WIDTH-1:0] in_data ;
  output reg [ADDRESS_BUS_WIDTH-1:0] out_data ;
  input en ;

  always @ (posedge clk) begin
    if ( en )
      out_data <= in_data ;
  end

endmodule


module inst_register( 
    clk, 
    in_data, 
    hi_select, 
    instruction,
    en
  ) ;

  `include "params.v"

  input clk ;
  input [DATA_BUS_WIDTH-1:0] in_data ;
  output reg [INSTRUCTION_WIDTH-1:0] instruction ;
  input hi_select ;
  input en ;

  always @ (posedge clk) begin
    if ( en )
      if ( hi_select ) 
	//load high bits
	instruction[INSTRUCTION_WIDTH-1:11] <= in_data[11:0] ; // changed load high bits to instruction[INSTRUCTION_WIDTH-1:INSTRUCTION_WIDTH-6-3-3] <= in_data[INSTRUCTION_WIDTH-6-3-3:0]
		else
	//load low bits 
	instruction[7:0] <= in_data[7:0]; // changed low bits to instruction[IMMEDIATE_WIDTH-1:0] <= in_data[IMMEDIATE_WIDTH-1:0]
 
  end

endmodule


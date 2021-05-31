`timescale 1ns / 1ps

module addr_mux2( 
    data_0, 
    data_1, 
    select, 
    data_out
  ) ;
  `include "params.v"

  input [ADDRESS_BUS_WIDTH-1:0] data_0 ;
  input [ADDRESS_BUS_WIDTH-1:0] data_1 ;
  input select ;
  output [ADDRESS_BUS_WIDTH-1:0] data_out ;
	 
  assign data_out = select ? data_1 : data_0 ;

endmodule

module data_mux2( 
    data_0, 
    data_1, 
    select, 
    data_out
  ) ;
  `include "params.v"

  input [DATA_BUS_WIDTH-1:0] data_0 ;
  input [DATA_BUS_WIDTH-1:0] data_1 ;
  input select ;
  output [DATA_BUS_WIDTH-1:0] data_out ;
	 
  assign data_out = select ? data_1 : data_0 ;

endmodule

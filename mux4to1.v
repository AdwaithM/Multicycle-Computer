`timescale 1ns / 1ps

module addr_mux4( 
    data_0, 
    data_1, 
    data_2, 
    data_3, 
    select, 
    data_out
  ) ;
  `include "params.v"

  input [ADDRESS_BUS_WIDTH-1:0] data_0 ;
  input [ADDRESS_BUS_WIDTH-1:0] data_1 ;
  input [ADDRESS_BUS_WIDTH-1:0] data_2 ;
  input [ADDRESS_BUS_WIDTH-1:0] data_3 ;
  input [1:0] select ;
  output [ADDRESS_BUS_WIDTH-1:0] data_out ;
	 
  reg [ADDRESS_BUS_WIDTH-1:0] data_bus ;
  always @ (*) begin
    case (select)
      0: data_bus <= data_0 ;
      1: data_bus <= data_1 ;
      2: data_bus <= data_2 ;
      3: data_bus <= data_3 ;
    endcase
  end
  assign data_out = data_bus ;

endmodule

module data_mux4( 
    data_0, 
    data_1, 
    data_2, 
    data_3, 
    select, 
    data_out
  ) ;
  `include "params.v"

  input [DATA_BUS_WIDTH-1:0] data_0 ;
  input [DATA_BUS_WIDTH-1:0] data_1 ;
  input [DATA_BUS_WIDTH-1:0] data_2 ;
  input [DATA_BUS_WIDTH-1:0] data_3 ;
  input [1:0] select ;
  output [DATA_BUS_WIDTH-1:0] data_out ;
	 
  reg [DATA_BUS_WIDTH-1:0] data_bus ;
  always @ (*) begin
    case (select)
      0: data_bus <= data_0 ;
      1: data_bus <= data_1 ;
      2: data_bus <= data_2 ;
      3: data_bus <= data_3 ;
    endcase
  end
  assign data_out = data_bus ;

endmodule

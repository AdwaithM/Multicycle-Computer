`timescale 1ns / 1ps

module tri_buffers( 
    data_in, 
    data_out,
    en
  ) ;

  `include "params.v"

  input [DATA_BUS_WIDTH-1:0] data_in ;
  output reg [DATA_BUS_WIDTH-1:0] data_out ;
  input en ;

  always @ ( en ) begin
    if ( en )
      data_out <= data_in ;
    else 
      data_out <= 16'bz ;
  end

endmodule

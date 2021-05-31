`timescale 1ns / 1ps

module left_shift2( 
    shift_in, 
    shift_out
  ) ;
  `include "params.v"

  input [DATA_BUS_WIDTH-1:0] shift_in ;
  output [DATA_BUS_WIDTH-1:0] shift_out ;
  
  assign shift_out[DATA_BUS_WIDTH-1:2] = shift_in[DATA_BUS_WIDTH-3:0] ;
  assign shift_out[1:0]  = 2'b0 ;
endmodule    

module pcshifter( input [25:0] shift_in, output [27:0] shift_out) ;
  
  assign shift_out[27:2] = shift_in[25:0] ;
  assign shift_out[1:0]  = 2'b0 ;
endmodule    

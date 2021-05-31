`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:02:55 04/02/2020 
// Design Name: 
// Module Name:    regfile 
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
module regfile(
    read_addr1,
    read_addr2,
    write_addr,
    read_data1,
    read_data2,
    write_data,
    write_enable,
    clk
  );

  `include "params.v"

  input [REGFILE_ADDR_BITS-1:0] read_addr1 ;
  input [REGFILE_ADDR_BITS-1:0] read_addr2 ;
  input [REGFILE_ADDR_BITS-1:0] write_addr ;
  output [DATA_BUS_WIDTH-1:0] read_data1 ;
  output [DATA_BUS_WIDTH-1:0] read_data2 ;
  input [DATA_BUS_WIDTH-1:0] write_data ;
  input write_enable ;
  input clk ;

  // NUM_REGISTERS x WIDTH_REGISTER_FILE 32 bits   BE
  reg [WIDTH_REGISTER_FILE-1:0] regfile [NUM_REGISTERS-1:0] ;
  always @ ( negedge clk ) begin
    if( write_enable )
      regfile[write_addr] <= write_data ;
  end

  // Asynchronous read with a (register 0) being 0
  assign read_data1 = (read_addr1 ? regfile[read_addr1] : 16'b0 ) ;
  assign read_data2 = (read_addr2 ? regfile[read_addr2] : 16'b0 ) ;

endmodule

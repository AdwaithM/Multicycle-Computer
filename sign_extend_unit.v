`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:08 02/18/2013 
// Design Name: 
// Module Name:    sign_extensionunit 
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
module sign_extender(
    src,
    out1
  );
  `include "params.v"
	 
  input [IMMEDIATE_WIDTH-1:0] src ;
  output reg [DATA_BUS_WIDTH-1:0] out1 ;

  always @ ( src ) begin
    out1[IMMEDIATE_WIDTH-1:0]  = src[IMMEDIATE_WIDTH-1:0];
    out1[DATA_BUS_WIDTH-1:IMMEDIATE_WIDTH] = {4{src[IMMEDIATE_WIDTH-1]}};

  end


endmodule

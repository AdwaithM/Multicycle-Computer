`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:55:28 05/02/2020
// Design Name:   tri_buffers
// Module Name:   /home/eng/w/wps100020/EE4304/project/verilog/multicycle/multicycle/tri_tb.v
// Project Name:  multicycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tri_buffers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tri_tb;

	// Inputs
	reg [31:0] data_in; // changed to DATA_BUS_WIDTH-1:0
	reg en;

	// Outputs
	wire [31:0] data_out;  // changed to DATA_BUS_WIDTH-1:0

	// Instantiate the Unit Under Test (UUT)
	tri_buffers uut (
		.data_in(data_in), 
		.data_out(data_out), 
		.en(en)
	);
   integer c ;
	initial begin
		// Initialize Inputs
		data_in = 0;
		en = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for ( c = 1 ; c <= 4 ; c = c + 1 ) begin
		   en = 1 ;
			data_in = c ;
			#100 ;
			en = 0 ;
			#100 ;
		
		end

	end
      
endmodule


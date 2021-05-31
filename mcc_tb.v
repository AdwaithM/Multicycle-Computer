`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:55:25 04/28/2020
// Design Name:   Multi_Cycle_Computer
// Module Name:   /home/eng/w/wps100020/EE4304/project/verilog/multicycle/multicycle/mcc_tb.v
// Project Name:  multicycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multi_Cycle_Computer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mcc_tb;

	// Inputs
	reg clock;
	reg reset;
   wire [31:0] program_out ; // changed DATA_BUS_WIDTH -1 
	
	// Instantiate the Unit Under Test (UUT)
	Multi_Cycle_Computer uut (
		.clock(clock), 
		.reset(reset),
		.program_out(program_out)
	);


   integer c ;
	initial begin
		// Initialize Inputs
		
		clock = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for ( c = 0 ; c <= 4 ; c = c+1 ) begin
		   clock <= c ;
			reset <= 1 ;
			#100 ;
	   end
		
		for ( c = 0 ; c <= 400; c = c+1 ) begin
		   clock <= c ;
			reset <= 0 ;
			#100 ;
	   end
	
		

	end
      
endmodule


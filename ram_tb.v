`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:31:34 04/28/2020
// Design Name:   ram
// Module Name:   /home/eng/w/wps100020/EE4304/project/verilog/multicycle/multicycle/ram_tb.v
// Project Name:  multicycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ram_tb;

	// Inputs
	reg [12:0] address;
	reg read_not_write;
	reg clk;

	// Bidirs
	wire [31:0] data;

	// Instantiate the Unit Under Test (UUT)
	ram uut (
		.address(address), 
		.data(data), 
		.read_not_write(read_not_write), 
		.clk(clk)
	);

	integer c ;
	reg [31:0] driver ;
	assign data =( read_not_write ? 32'bz : driver  );
	initial begin
		// Initialize Inputs
		address = 0;
		read_not_write = 0;
		clk = 0;
	

		// Wait 100 ns for global reset to finish
		#100;

		read_not_write = 1 ;
        
		// Add stimulus here
		for ( c = 0 ; c <= 12 ; c = c+1 ) begin
		   clk <= c ;
		   address <= 13'd8192 ; //changed the # of bits to ADDRESS_BUS_WIDTH and decimal to NUM_ADDRESS
		   #100 ;
	       end

		// Now perform a write
		for ( c = 0 ; c <= 1 ; c = c+1 ) begin
		   clk <= c ;
		   address <= 13'd8192 ; //changed the # of bits to ADDRESS_BUS_WIDTH and decimal to NUM_ADDRESS
			driver <= 32'hff03 ; //changed the # of bits to DATA_BUS_WIDTH
		  read_not_write = 0 ;
		
	          #100 ;
	       end

		// Now perform a read
		for ( c = 0 ; c <= 1 ; c = c+1 ) begin
		   clk <= c ;
		   address <= 13'd8192 ; //changed the # of bits to ADDRESS_BUS_WIDTH and decimal to NUM_ADDRESS
		  read_not_write = 1 ;
	          #100 ;
	       end


	end
      
endmodule


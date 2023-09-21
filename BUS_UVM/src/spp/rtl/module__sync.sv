`timescale 1ns/1ps

module sync(clk, resetn); // reset is delayed synchronous

//primary
	parameter real FREQ_MHz     = 100.0;
	parameter int  RESET_cycles =    32;

//secondary
	localparam real CLOCK_half_period_NS = 500.0 / FREQ_MHz; // 10 nS <-> 100 MHz

	output logic clk, resetn ;

	logic ck, rst;
	
	initial fork
		
		begin 
			ck  = 1'b0; 
			forever #(CLOCK_half_period_NS) ck = ~ck; 
		end
		
		begin 
			rst = 1'b0; 
			repeat(RESET_cycles) @(posedge clk);
			rst = 1'b1; 
		end
	join

	assign clk  = ck  ;
	assign resetn = rst;

endmodule : sync

`timescale 1ns/1ps

import uvm_pkg::*;
`include "uvm_macros.svh"

import bus_pkg::*;

module top;

	wire pclk;
	wire prstn;

	// Clock and Reset Generation
	parameter   real    CONTROL_APB_FREQ_MHz        = 100.0;
	parameter   int     CONTROL_APB_RESET_cycles    = 8;

	sync  #(.FREQ_MHz(CONTROL_APB_FREQ_MHz), .RESET_cycles(CONTROL_APB_RESET_cycles  )) p0_sync( .clk(pclk),  .resetn(prstn));

	initial main();

	task main;

        run_test("bus_sample_test");

	endtask : main

    // Maximum Simulation Time
//    initial begin
//        #500000;
//        $display("Ran out of clock cycles!");
//		`include "__stop.vi"
//      end
endmodule: top

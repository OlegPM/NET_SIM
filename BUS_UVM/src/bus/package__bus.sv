package bus_pkg;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	import base_pkg::*;
	`include "base_macros.svh"

// reserved keyword for XML configuration

	const string DRIVER = "drive";
	const string NAME = "name";

// driver role
	const string ROLE_SOURCE = "SOURCE"; 
	const string ROLE_TARGET = "TARGET"; 

	typedef class bus_transaction   ; // transaction
	typedef class queue_set      ;
	typedef class bus_sequencer     ;

//	typedef class bus_phy	        ;
	typedef class bus_driver        ;
	typedef class bus_monitor       ;
	typedef class bus_agent         ;
	typedef class bus_sample_test   ;
	typedef class bus_env			;
	typedef class bus_container		;
	typedef class switch_memory		;
	typedef class memory_inf		;
	
//	typedef interface memory	    ;
	`include "class__bus_transaction.sv"
	`include "class__bus_sequence.sv"
	`include "class__bus_sequencer.sv"
//	`include "abstract_class__bus_phy.sv"
	`include "class__bus_driver.sv"
	`include "class__bus_monitor.sv"
	`include "class__bus_agent.sv"
	`include "memory_inf.sv"
	`include "bus_env.sv"
	`include "class__bus_sample_test.sv"
	`include "class__bus_container.sv"
	`include "class__switch_memory.sv"
	

	
endpackage : bus_pkg


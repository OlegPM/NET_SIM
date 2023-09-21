/*
 * 
 * The sequencer controls the flow of request and response sequence items between sequences and the driver
 * Sequencer and driver uses TLM Interface to communicate transactions
 * uvm_sequencer and uvm_driver base classes have seq_item_export and seq_item_port defined respectively. 
 * User needs to connect them using TLM connect method.
 * 
 */

class bus_sequencer extends uvm_sequencer#(.REQ(bus_transaction));

	function new(string name = "bus_sequencer", uvm_component parent = null);
		super.new(name, parent);
		`uvm_info("bus_sequencer.new", ".....", UVM_HIGH)
	endfunction : new

	function void send_request(uvm_sequence_base sequence_ptr, uvm_sequence_item t, bit rerandomize = 0);
		super.send_request(sequence_ptr, t, rerandomize);
		`uvm_info("bus_sequencer.send_request[override]", ":::::", UVM_HIGH)
//		`STOP
	endfunction : send_request

	function void item_done(RSP item = null);
		super.item_done(item);
		`uvm_info("bus_sequencer.item_done[override]", $sformatf("transaction id %0d", item.pid), UVM_HIGH)
	endfunction : item_done

  `uvm_component_utils(bus_sequencer)

endclass : bus_sequencer

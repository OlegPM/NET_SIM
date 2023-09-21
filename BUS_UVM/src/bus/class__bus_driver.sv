`timescale 1ns/1ps
class bus_driver extends uvm_driver#(.REQ(bus_transaction));

	`uvm_component_utils_begin(bus_driver)
	`uvm_component_utils_end

	bus_agent reciever;
	bus_transaction responces[$];
	switch_memory switch;

	string dest;

	string parent_name = this.get_parent().get_name();
	longint unsigned recieved_data_length = 0;
	longint unsigned total_time = 0;

	int dot_index;

	function new(string name = "bus_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction : new

	virtual task run_phase(uvm_phase phase);
//      wait_reset();
		fork
			begin
				while(1) begin
					//$display("bus_driver: WAIT transaction %0d", i);
					seq_item_port.get_next_item(req);

					drive(req);

					seq_item_port.item_done(req);
				end
			end
		join
	endtask : run_phase

//	virtual task wait_reset();
//	endtask : wait_reset

	virtual task drive(bus_transaction req);
		//Sending delay

		int del = delay(req);
		bus_container container_inst;
		
		if(switch.allocate(req.length)) begin
			#del;
			`uvm_info("bus_driver", $sformatf("%s SENT %000d bytes | qid = %0d pid = %0d | time = %0d ns", parent_name, req.length, req.qid, req.pid, del), UVM_MEDIUM)
			container_inst = new("", req);
			container_inst.start();
		end else begin
			`uvm_info("bus_driver", $sformatf("               %s | qid = %0d pid = %0d |was dropped", parent_name, req.qid, req.pid), UVM_MEDIUM)
		end

	endtask : drive

	task recieve(bus_transaction rsp);
		responces.push_back(rsp);
		recieved_data_length += rsp.length;

		`uvm_info("bus_driver", $sformatf("%s RCVD %000d bytes | qid = %0d pid = %0d | TOTAL RCVD by %s %0d bytes", parent_name, rsp.length, rsp.qid, rsp.pid, parent_name, recieved_data_length), UVM_MEDIUM)
		switch.free(rsp.length);
	endtask : recieve

	function int delay(bus_transaction req);
		int time_to_send = req.length;
		return time_to_send;
	endfunction

endclass : bus_driver
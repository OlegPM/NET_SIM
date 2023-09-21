class switch_memory extends uvm_object implements memory_inf;
	`uvm_object_utils(switch_memory)

	parameter longint CAPACITY_FACTOR = 10;
	localparam CAPACITY = 1 << CAPACITY_FACTOR;
	longint current_cap ;

	function new(string name = "switch_memory");
		super.new(name);
		current_cap = CAPACITY;
	endfunction

	virtual function bit allocate(longint length);
		// Your implementation for allocate
		if(current_cap < length)begin
			`uvm_error(this.get_name(), "Not enough memory to allocate")
			return 0;
		end else begin
			current_cap -= length;
		end
		`uvm_info("switch_memory", $sformatf("%0d bytes allocated current capacity %0d", length, current_cap), UVM_MEDIUM)
		return 1;
	endfunction:allocate

	virtual function free(longint length);
		// Your implementation for deallocate
		longint tmp_cap = current_cap;
		current_cap += length;
		if(CAPACITY < current_cap) begin
			`uvm_fatal(this.get_name(), "Error memory access")
		end
		`uvm_info("switch_memory", $sformatf("%0d bytes deallocated current capacity %0d", length, current_cap), UVM_MEDIUM)
	endfunction:free

endclass: switch_memory
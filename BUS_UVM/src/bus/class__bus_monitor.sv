class bus_monitor extends uvm_monitor;

	`uvm_component_utils_begin(bus_monitor)
	`uvm_component_utils_end

//	bus_phy phy;
	
//	bus_phy_base phy;

	function new(string name = "bus_monitor", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
//	virtual function void build_phase(uvm_phase phase);
//		super.build_phase(phase);
////		if(!uvm_config_db#(INTERFACE_TYPE)::get(this, "", INTERFACE_NAME, vif))
////			`uvm_error ("AXI MONITOR", $sformatf("Cannot find virtual interface \"%s\" of %s", INTERFACE_NAME, $typename(INTERFACE_TYPE)))
//	endfunction : build_phase
//	
//	virtual task run_phase(uvm_phase phase);
////		thread_checker();
//	endtask : run_phase
	
//	pure virtual task thread_checker();
	
endclass : bus_monitor

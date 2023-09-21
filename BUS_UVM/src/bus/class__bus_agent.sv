class bus_agent extends uvm_agent;

	`uvm_component_utils_begin(bus_agent)
	`uvm_component_utils_end

	bus_driver      driver;
	bus_monitor     monitor;
	bus_sequencer   sequencer;

	function new(string name = "bus_agent", uvm_component parent = null);

		super.new(name, parent);

	endfunction

	virtual function void build_phase (uvm_phase phase);
//      string driver_context;
//      string monitor_context;
//		string sequencer_context;

		super.build_phase(phase);
		uvm_report_info(get_name(), "build");
		driver = bus_driver::type_id::create("driver", this);
		monitor = bus_monitor::type_id::create("monitor", this);
		sequencer = bus_sequencer::type_id::create("sequencer", this);


		uvm_report_info(get_name(), $sformatf("create DRIVER %s", $typename(driver)));
//
//      monitor_context = ""; // default
//      monitor = bus_monitor_type::type_id::create("monitor", this, monitor_context);
//		uvm_report_info(get_name(), $sformatf("create MONITOR %s", $typename(monitor)));

//		sequencer_context = ""; // default
//		sequencer = bus_sequencer::type_id::create("sequencer", this);
//		uvm_report_info(get_name(), $sformatf("create SEQUENCER %s", $typename(sequencer)));
//		print();
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
		uvm_report_info(get_name(), "Bus agent is connecting");
		driver.seq_item_port.connect(sequencer.seq_item_export);
	endfunction

	task run_phase(uvm_phase phase);
		uvm_report_info(get_name(), "run");
		`uvm_info("AGENT", "Bus agent in place", UVM_MEDIUM)
	endtask

endclass : bus_agent


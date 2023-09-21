class bus_env extends uvm_env;
	`uvm_component_utils(bus_env)

	bus_agent agent1;
	bus_agent agent2;
	bus_agent test;
	uvm_scoreboard scoreboard;
	switch_memory switch_m;
	// Constructor
	function new(string name = "bus_env", uvm_component parent);
		super.new(name, parent);
		`uvm_info("bus_env", "Constructor called", UVM_HIGH)
	endfunction: new

	// Build phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("bus_env", "Build phase called", UVM_HIGH)

		agent1 = bus_agent::type_id::create("agent1", this);
		agent2 = bus_agent::type_id::create("agent2", this);
		switch_m = switch_memory::type_id::create("switch", this);

//        scoreboard = uvm_scoreboard::type_id::create("scoreboard", this);

	endfunction: build_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_config_db#(bus_agent)::set(null, "*", "agent1", agent1);
		uvm_config_db#(bus_agent)::set(null, "*", "agent2", agent2);
		uvm_config_db#(switch_memory)::set(null, "*", "switch_m", switch_m);


	endfunction
//
	// Connect phase
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("bus_env", "Connect phase called", UVM_HIGH)
		// connect switch_m to recivers
		agent1.driver.switch = switch_m;
		agent2.driver.switch = switch_m;

//       agent1.monitor.monitor_port.connect(scoreboard.scoreboard_port);

	endfunction: connect_phase

	// Run phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("bus_env", "Run phase called", UVM_HIGH)
		if (!uvm_config_db#(bus_agent)::get(null, "", "agent1", test))
			`uvm_error("!!!!!!!!!!!!!!!!!!TEST AGENT_NOT_FOUND", "Could not find the agent1 in the configuration database.")
		if (!uvm_config_db#(bus_agent)::get(null, "", "agent2", test))
			`uvm_error("!!!!!!!!!!!!!!!!!!TEST AGENT_NOT_FOUND", "Could not find the agent2 in the configuration database.")
	endtask: run_phase

endclass: bus_env

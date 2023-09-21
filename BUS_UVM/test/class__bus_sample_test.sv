class bus_sample_test extends uvm_test;
	`uvm_component_utils(bus_sample_test)

	bus_env env;
	queue_set test_seq, test_seq2;
	bus_transaction rsp;

	// Constructor
	function new(string name = "bus_sample_test", uvm_component parent);
		super.new(name, parent);
		`uvm_info("bus_sample_test", "Constructor called", UVM_HIGH)
	endfunction: new

	// Build phase
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("bus_sample_test", "Build phase called", UVM_HIGH)

		env = bus_env::type_id::create("env", this);

	endfunction: build_phase

	// Connect phase
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("bus_sample_test", "Connect phase called", UVM_HIGH)
	endfunction: connect_phase

	// Run phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("bus_sample_test", "Run phase called", UVM_NONE)
		test_seq = new("test_seq");
		test_seq2 = new("test_seq2");
		fork
			begin
				phase.raise_objection(this);
				`uvm_info("bus_sample_test", $sformatf("Sequence started"), UVM_NONE)
				test_seq.start(env.agent1.sequencer);
				phase.drop_objection(this);

			end
			begin
				phase.raise_objection(this);
				`uvm_info("bus_sample_test", $sformatf("Sequence started"), UVM_NONE)
				test_seq2.start(env.agent2.sequencer);
				phase.drop_objection(this);

			end
			begin
				forever begin
					test_seq.get_response(rsp);
					test_seq2.get_response(rsp);
					if (rsp !== null) begin
//                      $cast(rsp, apb_rsp);
//                        $display("rsp %0p", rsp);
//                        $display("apb_rsp.id %0p", rsp);
//                      env.scoreboard.responces.push_back(apb_rsp);
					end
				end
			end
		join

	endtask: run_phase

endclass: bus_sample_test
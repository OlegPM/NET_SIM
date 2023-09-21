/*
 * Class uvm_sequence is a collection of uvm_transactions.
 * The user test calls ... task 'body' to generate new transactions and store them in the sequence.
 * uvm_sequencer reads and passes transactions to the uvm_driver.
 *
 */
class queue_set extends uvm_sequence#(.REQ(bus_transaction));

	bus_transaction packet;
	static int total_queu;
	int qid;
	int count = 10;

	function new(string name = "bus_sequence");
		super.new(name);
		`uvm_info("bus_sequence.new", ".....", UVM_MEDIUM)
		qid = total_queu;
		total_queu+=1;
	endfunction

	virtual task pre_body();
		`uvm_info("bus_sequence.pre_body", "-----", UVM_MEDIUM)
	endtask : pre_body

	virtual task body();
		int pid;
		`uvm_info("bus_sequence.body", "=====", UVM_MEDIUM)
		while(count != 0) begin
			packet  = bus_transaction::type_id::create("packet");

			start_item(packet);

			packet.pid = pid++;
			packet.qid = qid;
			packet.randomize();

			finish_item(packet);

//          get_response(packet);

			if(count > 0) count--;
			#(1.0);
		end
	endtask : body

	virtual task post_body();
		`uvm_info("bus_sequence.post_body", "+++++", UVM_MEDIUM)
	endtask : post_body

	`uvm_object_utils(queue_set)
	`uvm_declare_p_sequencer(bus_sequencer)


endclass : queue_set

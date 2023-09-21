/*
 * bus transaction sends or receives a packet of length bytes
 * 
 */
 
class bus_transaction extends uvm_sequence_item;
	
	int qid; // queue (sequence is a set of request and completion queues)
	int pid; // position in request queue

	parameter int DATA_FACTOR = 10;
	rand int unsigned length;
	longint source = 1;
	rand longint destination;
	
	constraint destination_const{
		destination >  0;
		destination <= 2; // 64Kb
	}
	
	constraint length_const{
		length >  0;
		length <= 1<<DATA_FACTOR; // 64Kb
	}
//	constraint destination_const{
//		destination>0;
//		destination<=2;
//	}
//	rand int mtu;
//	
//	// Constraint block to ensure the variable is a power of 2
//    constraint power_of_2_c {
//        mtu inside {[1:32]}; // Assuming a 64-bit integer, adjust as needed
//        mtu == (1 << $urandom_range(0, $clog2(mtu)));
//    }
	
//	string filename; // read or write bytes 

	function new(string name = "bus_transaction");
		super.new(name);
	endfunction

	`uvm_object_utils_begin(bus_transaction)
		`uvm_field_int(qid		, UVM_DEFAULT | UVM_DEC)
		`uvm_field_int(pid		, UVM_DEFAULT | UVM_DEC)
		`uvm_field_int(length	, UVM_DEFAULT | UVM_DEC)
	`uvm_object_utils_end
	
endclass : bus_transaction

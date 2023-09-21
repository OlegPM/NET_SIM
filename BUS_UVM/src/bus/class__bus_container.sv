class bus_container extends uvm_object;
	`uvm_object_utils(bus_container)
	
	bus_agent reciever;
	bus_transaction req;
	
	longint TIME_TO_GO = 100;
	
    function new(string name = "bus_container", bus_transaction req = null);
        super.new(name);
        if (req != null)
            this.req = req;
    endfunction
	
	virtual task start();
		
		string dest = $sformatf("agent%0d", req.destination);
		while(TIME_TO_GO != 0) begin
			#10;
			TIME_TO_GO -= 1;
		end
//		
		if (!uvm_config_db#(bus_agent)::get(null, "", dest, reciever))
			`uvm_error("AGENT_NOT_FOUND", "Could not find the dest reciever in the configuration database.")
		else 
			begin
				reciever.driver.recieve(req);
			end
	endtask 

endclass
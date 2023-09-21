interface class memory_inf;

	// Declare virtual functions without implementations
	pure virtual function bit allocate(longint length);

	pure virtual function free(longint length);

endclass : memory_inf
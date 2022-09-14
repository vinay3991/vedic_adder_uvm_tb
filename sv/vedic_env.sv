class vedic_env extends uvm_env;

   `uvm_component_utils_begin(vedic_env)
   `uvm_component_utils_end
   virtual interface test_if vif;

   // new - constructor
   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   // build_phase
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      if(!uvm_config_db#(virtual test_if)::get(this, "", "vif", vif))
         `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
   endfunction: build_phase

  task run_phase(uvm_phase phase);

     `uvm_info(get_type_name(),
        $sformatf("HELLO WORLD"), 
        UVM_LOW)

  endtask : run_phase

endclass : vedic_env

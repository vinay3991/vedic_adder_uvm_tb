
class base_test_c extends uvm_test; //uvm_test;

   `uvm_component_utils_begin(base_test_c)
   `uvm_component_utils_end
   virtual interface test_if vif;
  // ubus environment
   vedic_env vedic0;
   
   // new - constructor
   function new(string name= "base_test_c", uvm_component parent);
      super.new(name, parent);
   endfunction : new
   
   // build_phase
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      vedic0 = vedic_env::type_id::create("vedic0", this);

      if(!uvm_config_db#(virtual test_if)::get(this, "", "vif", vif))
         `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
   endfunction: build_phase

  task run_phase(uvm_phase phase);
      phase.raise_objection(this);

     `uvm_info(get_type_name(),
        $sformatf("HELLO WORLD"), 
        UVM_LOW)
        vif.a = $random;
        vif.b = $random;
        #500;
     `uvm_info(get_type_name(),
        $sformatf("Input a : %0x b : %0x Output prod : %0x", vif.a,vif.b,vif.prod), 
        UVM_LOW)
     `uvm_info(get_type_name(),
        $sformatf("HELLO WORLD2"), 
        UVM_LOW)
        #500;
      phase.drop_objection(this);

  endtask : run_phase


endclass: base_test_c

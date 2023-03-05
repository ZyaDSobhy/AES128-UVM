 //-------------------------------------------------//
  //----------------- test ----------------//
  //-------------------------------------------------//

  class test extends uvm_test ;
    `uvm_component_utils(test)
    function new(string name = "test",uvm_component parent=null);
      super.new(name,parent);
    endfunction
    //--------- Instantiations ------//
    envir env ;
    my_sequence my_sequence_in;
    virtual intf1 config_virtual ;
    virtual intf1 local_virtual ;
      //------- build phase -------//
    function void build_phase (uvm_phase phase);
  super.build_phase(phase);
  env=envir::type_id::create("env",this);
  my_sequence_in=my_sequence::type_id::create("my_sequence_in");
      if(!uvm_config_db#(virtual intf1)::get(this,"","vif",config_virtual))begin
           `uvm_fatal(get_full_name(),"Error!")
      end
      local_virtual=config_virtual;
      uvm_config_db #(virtual intf1)::set(this,"env","vif",local_virtual);
  $display("test_build_phase");
  endfunction
   //------- connect phase -------//
 /**/   function void connect_phase (uvm_phase phase);
  super.connect_phase(phase);
  $display("test_connect_phase");
  endfunction
   //------- run phase -------//
   task run_phase (uvm_phase phase);
  super.run_phase(phase);
     phase.raise_objection(this);
     $display("Before_start");
     my_sequence_in.start(env.agent_i.sequencer_i);
     phase.drop_objection(this);
  $display("test_run_phase");
   endtask
  endclass 
  
  endpackage
  
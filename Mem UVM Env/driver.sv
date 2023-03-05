 //------------------------------------------------//
  //------------------- driver --------------------//
  //-----------------------------------------------//

  class driver extends uvm_driver #(sequence_item) ;
      `uvm_component_utils(driver)
    function new(string name = "driver",uvm_component parent=null);
      super.new(name,parent);
    endfunction
      virtual intf1 driver_virtual ;
    sequence_item  seq_item_in;
      //------- build phase -------//
    function void build_phase (uvm_phase phase);
  super.build_phase(phase);
       if(!(uvm_config_db #(virtual intf1)::get(this,"","vif",driver_virtual)))
         `uvm_fatal(get_full_name(),"Error!")
         seq_item_in= sequence_item::type_id::create("seq_item_in");    
  $display("driver_build_phase");
  endfunction
   //------- connect phase -------//
    function void connect_phase (uvm_phase phase);
  super.connect_phase(phase);
  $display("driver_connect_phase");
  endfunction
   //------- run phase -------//
    task  run_phase (uvm_phase phase);
  super.run_phase(phase);
      forever begin
        seq_item_port.get_next_item(seq_item_in);
        $display("After next item (DRIVER)");
        //tiing between seq item and virtual interface
        @(posedge driver_virtual.clk)
        driver_virtual.rst_n<=seq_item_in.rst_n;
        driver_virtual.en<=seq_item_in.en;
        driver_virtual.wr<=seq_item_in.wr;
        driver_virtual.addr<=seq_item_in.addr;
        driver_virtual.data_in<=seq_item_in.data_in;
        $display("before  item done (DRIVER)");
        
        $display($time  , "%p",seq_item_in);
        seq_item_port.item_done();
     
      end
  $display("driver_run_phase");
    endtask
  endclass 
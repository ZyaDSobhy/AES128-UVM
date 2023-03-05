// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
`include "interface.sv"

  package uvm_pack;
      import uvm_pkg ::*;
      export uvm_pkg ::*;
      `include "uvm_macros.svh" ;
  
  //__________________class declarations __________________// 
`include "uvm_classes.sv"
  //-------------------------------------------------//
  //-----------------Test_bench-------------------//
  //-------------------------------------------------//

  module Tbench_top ;
      import uvm_pkg ::*;
      import uvm_pack::*;
    `include "uvm_macros.svh" ;
    intf1 intf_in ();
      memory   mem_16_32 
    (
      .clk(intf_in.clk),
      .rst_n(intf_in.rst_n),
      .en(intf_in.en),
      .wr(intf_in.wr),
      .addr(intf_in.addr),
      .data_in(intf_in.data_in),
      .data_out(intf_in.data_out),
      .valid_out(intf_in.valid_out)
    );
      initial begin 
        $dumpfile("dump.vcd");
        $dumpvars(0,Tbench_top);
		//virtual intf1 vif;
		//vif = intf_in;
		
        uvm_config_db #(virtual intf1)::set(null,"uvm_test_top","vif",intf_in);
		
        run_test("test");
      end 
       always #5 intf_in.clk=~intf_in.clk;
  endmodule 
  
  
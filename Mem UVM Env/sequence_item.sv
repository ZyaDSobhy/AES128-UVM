  //------------------------------------------------//
  //------------------- sequence_Item --------------------//
  //------------------------------------------------// 
class sequence_item extends uvm_sequence_item ;
      `uvm_object_utils(sequence_item)
    function new(string name = "sequence_item");
      super.new(name);
    endfunction
    // Module state variables 
    parameter ADDR_WIDTH=32;
    parameter DATA_WIDTH=32;
     bit                       clk;
    logic                       rst_n;
    logic                       en;
    logic                       wr;

    logic      [DATA_WIDTH-1:0] data_out;
    logic                       valid_out;
    //Module Random Variables
    randc  bit  [DATA_WIDTH-1:0]     addr;
    randc  bit  [ADDR_WIDTH-1:0]  data_in;
    //Randomization Constrains
  constraint addr_constrains {addr inside{[0:31]};};
  constraint data_constrains {data_in inside{[0:31]};};
  endclass //className extends superClass

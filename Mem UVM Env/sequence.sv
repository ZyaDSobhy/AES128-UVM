 //--------------------------------------------------//
  //------------------- sequence ---------------------//
  //--------------------------------------------------//

  class my_sequence extends uvm_sequence ;
    `uvm_object_utils(my_sequence)
    function new(string name = "my_sequence");
      super.new(name);
    endfunction
    // Instances 
    sequence_item sequence_item_in;
    //------------Tasks -------------//
    task pre_body;
      sequence_item_in=sequence_item::type_id::create("sequence_item_in");
    endtask
 task body; 
      start_item(sequence_item_in);
      sequence_item_in.rst_n   = 1;
      finish_item(sequence_item_in);
      #10ns;
      start_item(sequence_item_in);
      sequence_item_in.rst_n   = 0;
      sequence_item_in.data_in = 0;
      sequence_item_in.addr    = 0;
      sequence_item_in.en 	   = 1;
      sequence_item_in.wr 	   = 0;
      finish_item(sequence_item_in);
      #10ns;
      $display("start of body");
      //---------Writing--------// 
   for(int i=0;i<32;i++)begin
        start_item(sequence_item_in);
        sequence_item_in.rst_n     = 1;
        sequence_item_in.en 	   = 1;
        sequence_item_in.wr 	   = 1;
   void'(sequence_item_in.randomize());
     //$display("///////////////////// data=%d  //////",sequence_item_in.data_in);
     finish_item(sequence_item_in);
           //$display($time,"Writing process");
      #5ns;
   end
         
      //end
      //---------Reading--------// 
   for(int i=0;i<32;i=i+1)begin
        start_item(sequence_item_in);
        sequence_item_in.rst_n   = 1;
        sequence_item_in.en 	   = 1;
        sequence_item_in.wr 	   = 0;
   void'(sequence_item_in.randomize());
       // $display($time,"reading process");
        finish_item(sequence_item_in);
		#5ns;
      end
     #50ns;
    endtask 
    
    endclass 

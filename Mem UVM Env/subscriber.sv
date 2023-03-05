 //-------------------------------------------------//
  //--------------- subscriber -------------//
  //-------------------------------------------------//

  class subscriber extends uvm_subscriber #(sequence_item) ;
    
    `uvm_component_utils(subscriber)
    sequence_item seq_item;
   //cover_group_inst
    covergroup addr_cov_grp;

			addr: coverpoint seq_item.addr {
              bins addr_range[32] = {[31:0]};
			}
			
		endgroup
		covergroup data_cov_grp;

			DATA_ZERO: coverpoint seq_item.data_in ;

			DATA_TOGGLE: coverpoint seq_item.data_in {
				bins ZERO_ONE = (32'h00000000 => 32'hffffffff);
				bins ONE_ZERO = (32'hffffffff => 32'h00000000);
			}

		endgroup
    function new(string name = "subscriber",uvm_component parent=null);
      super.new(name,parent);
      addr_cov_grp=new();
      data_cov_grp=new();
      //new for group.new
    endfunction
    
  //-------- Instances ------ /
    // uvm_analysis_imp #(sequence_item,subscriber) my_analysis_ex port; 
      //------- build phase -------//
    function void build_phase (uvm_phase phase);
  super.build_phase(phase);
  seq_item= sequence_item::type_id::create("seq_item");
     // my_analysis_export=new("my_analysis_export",this);
  $display("subscriber_build_phase");
  endfunction

  //------- write method ------//
  function void write (sequence_item t);
    seq_item=t;
    //sample method 
    addr_cov_grp.sample();
    data_cov_grp.sample();
  endfunction
  endclass 

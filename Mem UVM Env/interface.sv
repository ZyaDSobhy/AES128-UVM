interface intf1#(parameter ADDR_WIDTH=32,DATA_WIDTH=32);
    bit                       clk;
    logic                       rst_n;
    logic                       en;
    logic                       wr;
    bit       [ADDR_WIDTH-1:0] addr;
    bit       [DATA_WIDTH-1:0] data_in;
    logic      [DATA_WIDTH-1:0] data_out;
    logic                       valid_out;

  endinterface 
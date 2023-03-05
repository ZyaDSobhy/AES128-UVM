module SubBytes (
					input clk,rst_n,en,
					input [127:0]  subbytes_i,
					output reg [127:0]  subbytes_o,
					output reg subbytes_flag
);

wire [31:0]  subbytes_o_w;
reg [31:0]	MUX_o;
reg [2:0]		counter;
wire  c0, c1, c2, c3, c4;



//MUX
always @ (counter)
begin
		case (counter)
			3'b000	:	MUX_o = 32'b0;
			3'b001	:	MUX_o = subbytes_i[((32*0)+31):(32*0)];
			3'b010	:	MUX_o = subbytes_i[((32*1)+31):(32*1)];
			3'b011	:	MUX_o = subbytes_i[((32*2)+31):(32*2)];
			3'b100	:	MUX_o = subbytes_i[((32*3)+31):(32*3)];
		endcase
end	

always @ (posedge clk or negedge rst_n)		

begin
	subbytes_flag <= 1'b0;
	if (!rst_n || !en)
	begin
		counter <= 3'b0;
		subbytes_o <= 128'd0;
		subbytes_flag <= 1'b0;
	end
	else if (c0)
		begin	
		subbytes_o <= subbytes_o;
		counter <= counter + 3'd1;	
	end
	else if (c1)
	begin
		subbytes_o[((32*0)+31):(32*0)] <= subbytes_o_w; 
		subbytes_o[((32*1)+31):(32*1)] <= subbytes_o[((32*1)+31):(32*1)];
		subbytes_o[((32*2)+31):(32*2)] <= subbytes_o[((32*2)+31):(32*2)];
		subbytes_o[((32*3)+31):(32*3)] <= subbytes_o[((32*3)+31):(32*3)];
		counter <= counter + 3'd1;	
	end
	else if (c2)
	begin	
		subbytes_o[((32*1)+31):(32*1)] <= subbytes_o_w;
		subbytes_o[((32*0)+31):(32*0)] <= subbytes_o[((32*0)+31):(32*0)];
		subbytes_o[((32*2)+31):(32*2)] <= subbytes_o[((32*2)+31):(32*2)];
		subbytes_o[((32*3)+31):(32*3)] <= subbytes_o[((32*3)+31):(32*3)];
		counter <= counter + 3'd1;	
	end
	else if (c3)
	begin	
		subbytes_o[((32*2)+31):(32*2)] <= subbytes_o_w;
		subbytes_o[((32*1)+31):(32*1)] <= subbytes_o[((32*1)+31):(32*1)];
		subbytes_o[((32*0)+31):(32*0)] <= subbytes_o[((32*0)+31):(32*0)];
		subbytes_o[((32*3)+31):(32*3)] <= subbytes_o[((32*3)+31):(32*3)];
		counter <= counter + 3'd1;	
	end
	else if (c4)
	begin	
		subbytes_o[((32*3)+31):(32*3)] <= subbytes_o_w;
		subbytes_o[((32*1)+31):(32*1)] <= subbytes_o[((32*1)+31):(32*1)];
		subbytes_o[((32*0)+31):(32*0)] <= subbytes_o[((32*0)+31):(32*0)];
		subbytes_o[((32*2)+31):(32*2)] <= subbytes_o[((32*2)+31):(32*2)];
		counter <= 3'b0;	
		subbytes_flag <= 1'b1;
	end
	else
		begin	
		subbytes_o <= subbytes_o;
		counter <= counter + 3'd1;	
	end
	
end		

assign c0 = (counter == 3'd0) ? 1'b1 : 1'b0 ;		
assign c1 = (counter == 3'd1) ? 1'b1 : 1'b0 ;		
assign c2 = (counter == 3'd2) ? 1'b1 : 1'b0 ;		
assign c3 = (counter == 3'd3) ? 1'b1 : 1'b0 ;		
assign c4 = (counter == 3'd4) ? 1'b1 : 1'b0 ;	

Sbox U0 (.Sbox_i(MUX_o) , .Sbox_o(subbytes_o_w));

/*

always @ (posedge clk or negedge rst_n)
begin

	if (!rst_n || !en)
		subbytes_o <= 128'd0;
	else
		subbytes_o <= subbytes_o_w;
end

genvar k;

generate
		
						for(k=0; k<4; k=k+1)
						begin
							Sbox U0 (.Sbox_i(subbytes_i[((32*k)+31):(32*k)]) , .Sbox_o(subbytes_o_w[((32*k)+31):(32*k)]));
						end
				
endgenerate
*/
endmodule
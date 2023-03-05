module ShiftRows (
					input clk,rst_n,en,
					input [127:0]  shiftrows_i,
					output reg [127:0]  shiftrows_o 
				);
				

	always @ (posedge clk or negedge rst_n)
		begin

			if (!rst_n || !en)
				shiftrows_o <= 128'd0;
			else
				shiftrows_o[31:0] <= shiftrows_i[31:0];
				shiftrows_o[(8*7)+7:8*4] <= {shiftrows_i[(8*4)+7:8*4],shiftrows_i[(8*7)+7:8*7],shiftrows_i[(8*6)+7:8*5]};
				shiftrows_o[(8*11)+7:8*8] <= {shiftrows_i[(8*9)+7:8*8],shiftrows_i[(8*11)+7:8*10]};
				shiftrows_o[(8*15)+7:8*12] <= {shiftrows_i[(8*14)+7:8*12],shiftrows_i[(8*15)+7:8*15]};
		end		
			
endmodule			
					
					
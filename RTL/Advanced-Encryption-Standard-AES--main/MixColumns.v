module MixColumns (
					input clk,rst_n,en,
					input [127:0]  mixcolumns_i,
					output reg [127:0]  mixcolumns_o 
);

reg [127:0]  mixcolumns_o_w;



always @ (*)
begin

// last term in all expressions is to check the value the MSB of the two elements multiplied by 3 and 2 	if '0' then the term = 8'h00		if '1' then the term = 8'h1b

// 1st column	
		mixcolumns_o_w[(8*0)+7 : 8*0] = (mixcolumns_i[(8*0)+7 : 8*0] << 1) ^  (mixcolumns_i[(8*4)+7 : 8*4] << 1) ^ (mixcolumns_i[(8*4)+7 : 8*4]) ^ (mixcolumns_i[(8*8)+7 : 8*8]) ^ (mixcolumns_i[(8*12)+7 : 8*12])^({8{mixcolumns_i[(8*4)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*0)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*4)+7 : 8*4] = (mixcolumns_i[(8*0)+7 : 8*0]) ^  (mixcolumns_i[(8*4)+7 : 8*4] << 1) ^ (mixcolumns_i[(8*8)+7 : 8*8] << 1) ^ (mixcolumns_i[(8*8)+7 : 8*8]) ^ (mixcolumns_i[(8*12)+7 : 8*12])^({8{mixcolumns_i[(8*8)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*4)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*8)+7 : 8*8] = (mixcolumns_i[(8*0)+7 : 8*0] ) ^  (mixcolumns_i[(8*4)+7 : 8*4]) ^ (mixcolumns_i[(8*8)+7 : 8*8] << 1) ^ (mixcolumns_i[(8*12)+7 : 8*12] << 1) ^ (mixcolumns_i[(8*12)+7 : 8*12])^({8{mixcolumns_i[(8*12)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*8)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*12)+7 : 8*12] = (mixcolumns_i[(8*0)+7 : 8*0] << 1) ^  (mixcolumns_i[(8*0)+7 : 8*0]) ^ (mixcolumns_i[(8*4)+7 : 8*4] ) ^ (mixcolumns_i[(8*8)+7 : 8*8]) ^ (mixcolumns_i[(8*12)+7 : 8*12] << 1)^({8{mixcolumns_i[(8*0)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*12)+7]}} & 8'h1b);

// 2nd column	
		mixcolumns_o_w[(8*1)+7 : 8*1] = (mixcolumns_i[(8*1)+7 : 8*1] << 1) ^  (mixcolumns_i[(8*5)+7 : 8*5] << 1) ^ (mixcolumns_i[(8*5)+7 : 8*5]) ^ (mixcolumns_i[(8*9)+7 : 8*9]) ^ (mixcolumns_i[(8*13)+7 : 8*13])^({8{mixcolumns_i[(8*5)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*1)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*5)+7 : 8*5] = (mixcolumns_i[(8*1)+7 : 8*1]) ^  (mixcolumns_i[(8*5)+7 : 8*5] << 1) ^ (mixcolumns_i[(8*9)+7 : 8*9] << 1) ^ (mixcolumns_i[(8*9)+7 : 8*9]) ^ (mixcolumns_i[(8*13)+7 : 8*13])^({8{mixcolumns_i[(8*9)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*5)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*9)+7 : 8*9] = (mixcolumns_i[(8*1)+7 : 8*1] ) ^  (mixcolumns_i[(8*5)+7 : 8*5]) ^ (mixcolumns_i[(8*9)+7 : 8*9] << 1) ^ (mixcolumns_i[(8*13)+7 : 8*13] << 1) ^ (mixcolumns_i[(8*13)+7 : 8*13])^({8{mixcolumns_i[(8*13)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*9)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*13)+7 : 8*13] = (mixcolumns_i[(8*1)+7 : 8*1] << 1) ^  (mixcolumns_i[(8*1)+7 : 8*1]) ^ (mixcolumns_i[(8*5)+7 : 8*5] ) ^ (mixcolumns_i[(8*9)+7 : 8*9]) ^ (mixcolumns_i[(8*13)+7 : 8*13] << 1)^({8{mixcolumns_i[(8*1)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*13)+7]}} & 8'h1b);

// 3rd column
		mixcolumns_o_w[(8*2)+7 : 8*2] = (mixcolumns_i[(8*2)+7 : 8*2] << 1) ^  (mixcolumns_i[(8*6)+7 : 8*6] << 1) ^ (mixcolumns_i[(8*6)+7 : 8*6]) ^ (mixcolumns_i[(8*10)+7 : 8*10]) ^ (mixcolumns_i[(8*14)+7 : 8*14])^({8{mixcolumns_i[(8*6)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*2)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*6)+7 : 8*6] = (mixcolumns_i[(8*2)+7 : 8*2]) ^  (mixcolumns_i[(8*6)+7 : 8*6] << 1) ^ (mixcolumns_i[(8*10)+7 : 8*10] << 1) ^ (mixcolumns_i[(8*10)+7 : 8*10]) ^ (mixcolumns_i[(8*14)+7 : 8*14])^({8{mixcolumns_i[(8*10)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*6)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*10)+7 : 8*10] = (mixcolumns_i[(8*2)+7 : 8*2] ) ^  (mixcolumns_i[(8*6)+7 : 8*6]) ^ (mixcolumns_i[(8*10)+7 : 8*10] << 1) ^ (mixcolumns_i[(8*14)+7 : 8*14] << 1) ^ (mixcolumns_i[(8*14)+7 : 8*14])^({8{mixcolumns_i[(8*14)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*10)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*14)+7 : 8*14] = (mixcolumns_i[(8*2)+7 : 8*2] << 1) ^  (mixcolumns_i[(8*2)+7 : 8*2]) ^ (mixcolumns_i[(8*6)+7 : 8*6] ) ^ (mixcolumns_i[(8*10)+7 : 8*10]) ^ (mixcolumns_i[(8*14)+7 : 8*14] << 1)^({8{mixcolumns_i[(8*2)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*14)+7]}} & 8'h1b);

// 4th column	
		mixcolumns_o_w[(8*3)+7 : 8*3] = (mixcolumns_i[(8*3)+7 : 8*3] << 1) ^  (mixcolumns_i[(8*7)+7 : 8*7] << 1) ^ (mixcolumns_i[(8*7)+7 : 8*7]) ^ (mixcolumns_i[(8*11)+7 : 8*11]) ^ (mixcolumns_i[(8*15)+7 : 8*15])^({8{mixcolumns_i[(8*7)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*3)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*7)+7 : 8*7] = (mixcolumns_i[(8*3)+7 : 8*3]) ^  (mixcolumns_i[(8*7)+7 : 8*7] << 1) ^ (mixcolumns_i[(8*11)+7 : 8*11] << 1) ^ (mixcolumns_i[(8*11)+7 : 8*11]) ^ (mixcolumns_i[(8*15)+7 : 8*15])^({8{mixcolumns_i[(8*11)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*7)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*11)+7 : 8*11] = (mixcolumns_i[(8*3)+7 : 8*3] ) ^  (mixcolumns_i[(8*7)+7 : 8*7]) ^ (mixcolumns_i[(8*11)+7 : 8*11] << 1) ^ (mixcolumns_i[(8*15)+7 : 8*15] << 1) ^ (mixcolumns_i[(8*15)+7 : 8*15])^({8{mixcolumns_i[(8*15)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*11)+7]}} & 8'h1b);
		mixcolumns_o_w[(8*15)+7 : 8*15] = (mixcolumns_i[(8*3)+7 : 8*3] << 1) ^  (mixcolumns_i[(8*3)+7 : 8*3]) ^ (mixcolumns_i[(8*7)+7 : 8*7] ) ^ (mixcolumns_i[(8*11)+7 : 8*11]) ^ (mixcolumns_i[(8*15)+7 : 8*15] << 1)^({8{mixcolumns_i[(8*3)+7]}} & 8'h1b)^({8{mixcolumns_i[(8*15)+7]}} & 8'h1b);
	
end


always @ (posedge clk or negedge rst_n)
begin

	if (!rst_n || !en)
		mixcolumns_o <= 128'd0;
	else
		mixcolumns_o <= mixcolumns_o_w;
end

endmodule
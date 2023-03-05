module AddRoundKey (
					input clk,rst_n,en,
					input [127:0]  Data_i, Key_i,
					output reg [127:0]  addroundkey_o 
);

reg [127:0]  addroundkey_o_w;

always @ (*)
begin
		addroundkey_o_w = Data_i ^ Key_i;
end

/*always @ (*)
begin
		addroundkey_o_w[(8*0)+7 : 8*0] =   Data_i[(8*0)+7 : 8*0] ^ Key_i[(8*0)+7 : 8*0];  addroundkey_o_w[(8*1)+7 : 8*1] = Data_i[(8*1)+7 : 8*1] ^ Key_i[(8*1)+7 : 8*1]; addroundkey_o_w[(8*2)+7 : 8*2] = Data_i[(8*2)+7 : 8*2] ^ Key_i[(8*2)+7 : 8*2]; addroundkey_o_w[(8*3)+7 : 8*3] = Data_i[(8*3)+7 : 8*3] ^ Key_i[(8*3)+7 : 8*3];
		addroundkey_o_w[(8*4)+7 : 8*4] =   Data_i[(8*4)+7 : 8*4] ^ Key_i[(8*4)+7 : 8*4];  addroundkey_o_w[(8*5)+7 : 8*5] = Data_i[(8*5)+7 : 8*5] ^ Key_i[(8*5)+7 : 8*5]; addroundkey_o_w[(8*6)+7 : 8*6] = Data_i[(8*6)+7 : 8*6] ^ Key_i[(8*6)+7 : 8*6]; addroundkey_o_w[(8*7)+7 : 8*7] = Data_i[(8*7)+7 : 8*7] ^ Key_i[(8*7)+7 : 8*7];
		addroundkey_o_w[(8*8)+7 : 8*8] =   Data_i[(8*8)+7 : 8*8] ^ Key_i[(8*8)+7 : 8*8];  addroundkey_o_w[(8*9)+7 : 8*9] = Data_i[(8*9)+7 : 8*9] ^ Key_i[(8*9)+7 : 8*9]; addroundkey_o_w[(8*10)+7 : 8*10] = Data_i[(8*10)+7 : 8*10] ^ Key_i[(8*10)+7 : 8*10]; addroundkey_o_w[(8*11)+7 : 8*11] = Data_i[(8*11)+7 : 8*11] ^ Key_i[(8*11)+7 : 8*11];
		addroundkey_o_w[(8*12)+7 : 8*12] = Data_i[(8*12)+7 : 8*12] ^ Key_i[(8*12)+7 : 8*12];  addroundkey_o_w[(8*13)+7 : 8*13] = Data_i[(8*13)+7 : 8*13] ^ Key_i[(8*13)+7 : 8*13]; addroundkey_o_w[(8*14)+7 : 8*14] = Data_i[(8*14)+7 : 8*14] ^ Key_i[(8*14)+7 : 8*14]; addroundkey_o_w[(8*15)+7 : 8*15] = Data_i[(8*15)+7 : 8*15] ^ Key_i[(8*15)+7 : 8*15];

end */

always @ (posedge clk or negedge rst_n)
begin

	if (!rst_n || !en)
		addroundkey_o <= 128'd0;
	else
		addroundkey_o <= addroundkey_o_w;
end



endmodule
module AES (
				input clk,rst_n,en,
				input [127:0] CipherKey_i,Data_i,
				output reg [127:0]	AES_o
			
			);
			

wire en_KeySchedule_w, en_AddRoundKey_w, en_MixColumns_w,en_ShiftRows_w,en_SubBytes_w, sel_w, Key_flag_w, subbytes_flag_w,AES_flag_w;
wire initial_round_w, main_round_w, final_round_w	;
wire [7:0] RCON_w;

wire [127:0]	Key_o_w,addroundkey_o_w,mixcolumns_o_w,shiftrows_o_w, subbytes_o_w;
reg [127:0]		addroundkeyMUX_Data_o,addroundkeyMUX_Key_o;
//wire [127:0] MUX_o;
always @ (posedge clk or negedge rst_n)
begin
		if (!rst_n || !en || !AES_flag_w)
		AES_o <= 128'd0;
	else
		AES_o <= addroundkey_o_w;
end

// OUT MUX

/*always @ (*)
begin
		case (sel_w)
		1'b0	:	MUX_o = Data_i;
		1'b0	:	MUX_o = addroundkey_o_w;
		endcase
end
*/
AES_FSM FSM (
					.clk(clk),.rst_n(rst_n),.en(en),.Key_flag(Key_flag_w),.subbytes_flag(subbytes_flag_w),
					
					.en_KeySchedule(en_KeySchedule_w), .en_AddRoundKey(en_AddRoundKey_w),
					.initial_round(initial_round_w), .main_round(main_round_w), .final_round(final_round_w),
					.en_MixColumns(en_MixColumns_w),.en_ShiftRows(en_ShiftRows_w),.en_SubBytes(en_SubBytes_w), .sel(sel_w),
					.RCON(RCON_w), .AES_flag(AES_flag_w)
					
);	

KeySchedule U0 (
						.clk(clk),.rst_n(rst_n),.en(en_KeySchedule_w), .sel(sel_w),
						.RCON(RCON_w),
						.CipherKey_i(CipherKey_i),
						.Key_flag(Key_flag_w),
						.Key_o(Key_o_w)
);	

// AddRoundKey MUX
always @ (*)
begin
		case ({initial_round_w, main_round_w, final_round_w})
		3'b001 : begin
					addroundkeyMUX_Data_o	= shiftrows_o_w;
					addroundkeyMUX_Key_o	= 	Key_o_w;
				 end		 

		3'b010 : begin
					addroundkeyMUX_Data_o	= mixcolumns_o_w;
					addroundkeyMUX_Key_o	= 	Key_o_w;
				 end
		3'b100 : begin
					addroundkeyMUX_Data_o	= Data_i;
					addroundkeyMUX_Key_o	= 	CipherKey_i;
				 end	
		default : begin
					addroundkeyMUX_Data_o	= Data_i;
					addroundkeyMUX_Key_o	= 	CipherKey_i;
				 end	
		endcase		 
end

AddRoundKey U1 (
					.clk(clk),.rst_n(rst_n),.en(en_AddRoundKey_w),
					.Data_i(addroundkeyMUX_Data_o), .Key_i(addroundkeyMUX_Key_o),
					.addroundkey_o(addroundkey_o_w) 
);	

MixColumns U2 (
					.clk(clk),.rst_n(rst_n),.en(en_MixColumns_w),
					.mixcolumns_i(shiftrows_o_w),
					.mixcolumns_o(mixcolumns_o_w) 
);

ShiftRows U3 (
					.clk(clk),.rst_n(rst_n),.en(en_ShiftRows_w),
					.shiftrows_i(subbytes_o_w),
					.shiftrows_o(shiftrows_o_w) 
				);
				
SubBytes U4 (
					.clk(clk),.rst_n(rst_n),.en(en_SubBytes_w),
					.subbytes_i(addroundkey_o_w),
					.subbytes_o(subbytes_o_w),
					.subbytes_flag(subbytes_flag_w)
);	

endmodule			
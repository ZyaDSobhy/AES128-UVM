module KeySchedule (
						input clk,rst_n,en,sel,
						input [7:0] RCON,
						input [127:0] CipherKey_i,
						output reg Key_flag,
						output reg [127:0] Key_o
);


wire counter_flag, c0, c1, c2, c3;//, final_key;

reg en_subbytes, en_rotword, en_XOR;
reg [2:0] counter;	

reg [127:0]  XOR_Key_o_w;

reg [31:0] Key_o_RotWord,Key_o_w,MUX_o;

wire [31:0] subbyte_Key_o_w;

wire [31:0]  subbytes_i;

//wire [79:0] RCON;

//assign RCON = {8'h01,8'h02,8'h04,8'h08,8'h10,8'h20,8'h40,8'h80,8'h1b,8'h36};

localparam [1:0]	IDLE     = 'b00,
					RotWord  = 'b01,
					SubBytes = 'b11,
					XOR 	 = 'b10;
					
reg [1:0] current_state, next_state;		

//assign final_key = (RCON == 8'h36) ? 1'b1 : 1'b0;			

always @ (posedge clk or negedge rst_n)
begin
	if(!rst_n || !en)
		current_state <= IDLE;
	else
		current_state <= next_state;
end


always @ (*)
begin
							Key_flag = 1'b0;
							en_rotword = 1'b0;
							en_subbytes = 1'b0;
							en_XOR = 1'b0;
							
						
		case (current_state)
		
							
		IDLE :    begin 	Key_flag = 1'b0;
							en_rotword = 1'b0;
							en_subbytes = 1'b0;
							en_XOR = 1'b0;
						if (en)	
							next_state = RotWord;
						else	
							next_state = IDLE;
							
				  end
		
		RotWord : begin 
							en_rotword = 1'b1;
							next_state = SubBytes;
				  end
		SubBytes : begin 
							en_subbytes = 1'b1;
							next_state = XOR;
				  end
		
		XOR :     begin 
							en_XOR = 1'b1;
							if(!counter_flag)
								next_state = XOR;
							/*else if (final_key)
							begin
								next_state = IDLE;
								Key_flag = 1'b1;
							end*/	
							else
							begin
								next_state = RotWord;
								Key_flag = 1'b1;
							end
				  end
		endcase			
				
end

always @ (posedge clk or negedge rst_n)		
begin

	if (!rst_n || !en )
	begin
	Key_o <= 128'b0;
	Key_o_RotWord <= 128'b0; 
	end
	else 
	begin
	Key_o <= XOR_Key_o_w;
	Key_o_RotWord <= Key_o_w;
	end
end

// Rotate Word Logic
always @ (*)
begin
		if(en_rotword)
		begin
		Key_o_w = 'b0;
		Key_o_w[(8*0)+7 : 8*0] = CipherKey_i[(8*7)+7 : 8*7]; Key_o_w[(8*1)+7 : 8*1] = CipherKey_i[(8*11)+7 : 8*11]; Key_o_w[(8*2)+7 : 8*2] = CipherKey_i[(8*15)+7 : 8*15]; Key_o_w[(8*3)+7 : 8*3] = CipherKey_i[(8*3)+7 : 8*3];
		
		end
		else
		Key_o_w = 'b0;
end	

//Input MUX

always @ (*)
begin
		case (sel)
			
		1'b0	:	MUX_o =  CipherKey_i;
		1'b1	:	MUX_o =  Key_o;
		endcase
end

// SubBytes Logic
reg [31:0] subbytes_o;
wire [31:0] subbytes_o_w;

assign subbytes_i = Key_o_RotWord;
assign subbyte_Key_o_w = subbytes_o;

Sbox U0 (.Sbox_i(subbytes_i) , .Sbox_o(subbytes_o_w));

always @ (posedge clk or negedge rst_n)
begin

	if (!rst_n || !en_subbytes)
		subbytes_o <= 32'd0;
	else
		subbytes_o <= subbytes_o_w;
end

/*SubBytes KeySchedule_SubBytes (
					.clk(clk),.rst_n(rst_n),.en(en_subbytes),
					.subbytes_i(subbytes_i),
					.subbytes_o(subbyte_Key_o_w)
);
*/

// XOR stage Logic	
assign counter_flag = (counter == 3'd4) ? 1'b1 : 1'b0 ;		

always @ (*)
begin	
	if(c0) begin	
		XOR_Key_o_w = 'b0;		
		XOR_Key_o_w[(8*0)+7 : 8*0] = subbyte_Key_o_w[(8*0)+7 : 8*0]     ^ RCON ^ CipherKey_i[(8*0)+7 : 8*0];
		XOR_Key_o_w[(8*4)+7 : 8*4] = subbyte_Key_o_w[(8*1)+7 : 8*1]     ^ CipherKey_i[(8*4)+7 : 8*4];
		XOR_Key_o_w[(8*8)+7 : 8*8] = subbyte_Key_o_w[(8*2)+7 : 8*2]     ^ CipherKey_i[(8*8)+7 : 8*8];
		XOR_Key_o_w[(8*12)+7 : 8*12] = subbyte_Key_o_w[(8*3)+7 : 8*3] ^ CipherKey_i[(8*12)+7 : 8*12];
	end
	else if(c1) begin	
		XOR_Key_o_w = XOR_Key_o_w;
		XOR_Key_o_w[(8*1)+7 : 8*1] =   Key_o[(8*0)+7 : 8*0]         ^ CipherKey_i[(8*1)+7 : 8*1];
		XOR_Key_o_w[(8*5)+7 : 8*5] =   Key_o[(8*4)+7 : 8*4]         ^ CipherKey_i[(8*5)+7 : 8*5];
		XOR_Key_o_w[(8*9)+7 : 8*9] =   Key_o[(8*8)+7 : 8*8]         ^ CipherKey_i[(8*9)+7 : 8*9];
		XOR_Key_o_w[(8*13)+7 : 8*13] = Key_o[(8*12)+7 : 8*12]         ^ CipherKey_i[(8*13)+7 : 8*13];	
	end
	else if(c2) begin	
		XOR_Key_o_w = XOR_Key_o_w;
		XOR_Key_o_w[(8*2)+7 : 8*2] =   Key_o[(8*1)+7 : 8*1]         ^ CipherKey_i[(8*2)+7 : 8*2];
		XOR_Key_o_w[(8*6)+7 : 8*6] =   Key_o[(8*5)+7 : 8*5]         ^ CipherKey_i[(8*6)+7 : 8*6];
		XOR_Key_o_w[(8*10)+7 : 8*10] =   Key_o[(8*9)+7 : 8*9]         ^ CipherKey_i[(8*10)+7 : 8*10];
		XOR_Key_o_w[(8*14)+7 : 8*14] = Key_o[(8*13)+7 : 8*13]         ^ CipherKey_i[(8*14)+7 : 8*14];	
	end
	else if(c3) begin	
		XOR_Key_o_w = XOR_Key_o_w;
		XOR_Key_o_w[(8*3)+7 : 8*3] =   Key_o[(8*2)+7 : 8*2]         ^ CipherKey_i[(8*3)+7 : 8*3];
		XOR_Key_o_w[(8*7)+7 : 8*7] =   Key_o[(8*6)+7 : 8*6]         ^ CipherKey_i[(8*7)+7 : 8*7];
		XOR_Key_o_w[(8*11)+7 : 8*11] =   Key_o[(8*10)+7 : 8*10]     ^ CipherKey_i[(8*11)+7 : 8*11];
		XOR_Key_o_w[(8*15)+7 : 8*14] = Key_o[(8*14)+7 : 8*13]       ^ CipherKey_i[(8*15)+7 : 8*14];	
	end
	else
		XOR_Key_o_w = 'd0;
end

// Counter for XOR state
always @ (posedge clk or negedge rst_n)		
begin

	if (!rst_n || !en_XOR || counter_flag)
	counter <= 3'b0;
	else
	counter <= counter + 3'd1;	
end		

assign c0 = (counter == 3'd0) ? 1'b1 : 1'b0 ;		
assign c1 = (counter == 3'd1) ? 1'b1 : 1'b0 ;		
assign c2 = (counter == 3'd2) ? 1'b1 : 1'b0 ;		
assign c3 = (counter == 3'd3) ? 1'b1 : 1'b0 ;		

endmodule
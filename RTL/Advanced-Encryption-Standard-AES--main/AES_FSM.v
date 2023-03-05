module AES_FSM (
					input clk,rst_n,en,Key_flag,subbytes_flag,
					output reg en_KeySchedule, en_AddRoundKey, en_MixColumns,en_ShiftRows,en_SubBytes, sel, AES_flag, initial_round, main_round, final_round,
					output reg [7:0]	RCON
					
);

reg [1:0] current_state, next_state;
reg [3:0] counter_main_rounds;
reg [1:0] counter_main_round;

reg counter_en;
wire  main_rounds_flag, main_round_flag;

localparam [1:0] Idle = 'b00,
			  Initial_Round = 'b01,
			  Main_Rounds = 'b11,
			  Final_Round = 'b10;
			  

always @ (posedge clk or negedge rst_n)
begin
		if (!rst_n || !en)
			current_state <= Idle;
		else
			current_state <= next_state;
end			


always @ (*)
begin
		en_KeySchedule = 1'b0; 
		en_AddRoundKey = 1'b0; 
		en_MixColumns = 1'b0;
		en_ShiftRows = 1'b0;
		en_SubBytes  = 1'b0;
		sel = 1'b0;
		//RCON = 1'b0;
		AES_flag = 1'b0;
		initial_round = 1'b0; 
		main_round = 1'b0; 
		final_round = 1'b0;
		case (current_state)
		
			Idle : begin
					if (en)
						next_state = Initial_Round;
					else	
						next_state = Idle;
				   end		
				   
			Initial_Round : begin
								en_KeySchedule = 1'b1; 
								en_AddRoundKey = 1'b1; 
								initial_round = 1'b1; 
								next_state = Main_Rounds;
					
							end			
			Main_Rounds : begin
								en_KeySchedule = 1'b1; 
								counter_en = 1'b1;
								main_round = 1'b1;
								sel = 1'b1;
								if(!subbytes_flag)
									en_SubBytes    = 1'b1; 
								else if(counter_main_round == 4'd1)	
									en_ShiftRows = 1'b1;
								else if(counter_main_round == 4'd2)	
									en_MixColumns = 1'b1;
								else if(Key_flag)	
									en_AddRoundKey = 1'b1;	
								else	begin
									en_SubBytes    = 1'b0; 
									en_ShiftRows = 1'b0;
									en_MixColumns = 1'b0;
									en_AddRoundKey = 1'b0;	
								end		
			
									
								if(main_rounds_flag)
									next_state = Final_Round;
								else	
									next_state = Main_Rounds;
							end	
			Final_Round : begin
								en_KeySchedule = 1'b1; 
								sel = 1'b1;
								final_round = 1'b1;
								AES_flag   = 1'b0;
								if(!subbytes_flag)
									en_SubBytes    = 1'b1; 
								else if(counter_main_round == 4'd1)	
									en_ShiftRows = 1'b1;
								else if(Key_flag)	
									en_AddRoundKey = 1'b1;		
								else	begin
									en_SubBytes    = 1'b0; 
									en_ShiftRows = 1'b0;
									en_MixColumns = 1'b0;
									en_AddRoundKey = 1'b0;	
								end	
								
								if(counter_main_round)
								begin
									next_state = Idle;
									AES_flag   = 1'b1;
								end
								else	
									next_state = Final_Round;
					
							end							
		endcase


end

always @ (*)
begin
		case (counter_main_rounds)
			
			2'd1	:	RCON = 8'h01;
			2'd2	:	RCON = 8'h02;
			2'd3	:	RCON = 8'h04;
			2'd4	:	RCON = 8'h08;
			2'd5	:	RCON = 8'h10;
			2'd6	:	RCON = 8'h20;
			2'd7	:	RCON = 8'h40;
			2'd8	:	RCON = 8'h80;
			2'd9	:	RCON = 8'h1b;
			default :	RCON = 8'h36;
		endcase	
end


always @ (posedge clk or negedge rst_n)
begin
		
		if(!rst_n || !en || !counter_en)
			counter_main_rounds <= 4'b0;
		else
			counter_main_rounds <= counter_main_rounds + 4'b1;
end

assign main_rounds_flag = (counter_main_rounds == 4'd9)? 1'b1 : 1'b0;

//assign AES_flag = (main_rounds_flag );

always @ (posedge clk or negedge rst_n)
begin
		
		if(!rst_n || !en || !subbytes_flag )
			counter_main_round <= 2'b0;
		else
			counter_main_round <= counter_main_rounds + 2'b1;
end

assign main_round_flag = (counter_main_round == 2'd2)? 1'b1 : 1'b0;

  endmodule
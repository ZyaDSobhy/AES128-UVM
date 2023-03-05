

//MixColumn output 	8'h4c,8'h7a,8'h9a,8'he5,8'h26,8'hd3,8'h19,8'h81,8'h6,8'hf8,8'hcb,8'h66,8'h28,8'h48,8'he0,8'h4


module KeySchedule_tb();

					 reg clk_tb,rst_n_tb,en_tb;
					 reg [7:0] RCON_tb;
					 reg [127:0]  CipherKey_i_tb;
					 wire 		   Key_flag_tb;
					 wire [127:0]  Key_o_tb;
					
					
					always #5 clk_tb = ~clk_tb;
					
					initial
					begin
							$dumpfile("Key_flag.vcd") ;
							$dumpvars ;
							clk_tb = 1'b0;
							rst_n_tb = 1'b1;
							en_tb= 1'b1;
							#4 
							rst_n_tb = 1'b0;
							#3
							rst_n_tb = 1'b1;
							
							
							//addroundkey_i_tb = {8'h34,8'hA2,8'h8D,8'hA8,8'h07,8'h98,8'h30,8'hf6,8'h37,8'h31,8'h5A,8'h43,8'hE0,8'h31,8'h88,8'h32};
							CipherKey_i_tb = {8'h3c,8'h88,8'ha6,8'h16,8'h4f,8'h15,8'hd2,8'h15,8'hcf,8'hf7,8'hae,8'h7e,8'h09,8'hab,8'h28,8'h2b};
							
							RCON_tb = 8'h01;
							//Key_i_tb = {}
							
							#70
							$display ("********* Test Case 1 *******************") ;
							$display ("OUT 0 = %0h OUT 1 = %0h OUT 2 = %0h OUT 3 = %0h ", Key_o_tb[(8*0)+7:8*0], Key_o_tb[(8*1)+7:8*1], Key_o_tb[(8*2)+7:8*2], Key_o_tb[(8*3)+7:8*3]) ; // $display ("OUT 1 = %0h ") ;$display ("OUT 2 = %0h ") ;$display ("OUT 3 = %0h ") ;
							$display ("OUT 4 = %0h OUT 5 = %0h OUT 6 = %0h OUT 7 = %0h ", Key_o_tb[(8*4)+7:8*4], Key_o_tb[(8*5)+7:8*5], Key_o_tb[(8*6)+7:8*6], Key_o_tb[(8*7)+7:8*7]) ; //  $display ("OUT 5 = %0h ") ;$display ("OUT 6 = %0h ") ;$display ("OUT 7 = %0h ") ;
							$display ("OUT 8 = %0h OUT 9 = %0h OUT 10 = %0h OUT 11 = %0h ", Key_o_tb[(8*8)+7:8*8], Key_o_tb[(8*9)+7:8*9], Key_o_tb[(8*10)+7:8*10], Key_o_tb[(8*11)+7:8*11]) ; //$display ("OUT 9 = %0h ") ; $display ("OUT 10 = %0h ") ; $display ("OUT 11 = %0h ") ;
							$display ("OUT 12 = %0h OUT 13 = %0h OUT 14 = %0h OUT 15 = %0h ", Key_o_tb[(8*12)+7:8*12], Key_o_tb[(8*13)+7:8*13], Key_o_tb[(8*14)+7:8*14], Key_o_tb[(8*15)+7:8*15]) ;//$display ("OUT 13 = %0h ") ;$display ("OUT 14 = %0h ") ;$display ("OUT 15 = %0h ") ;
							$display ("    ");
							$display ("8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h",Key_o_tb[(8*15)+7:8*15],Key_o_tb[(8*14)+7:8*14],Key_o_tb[(8*13)+7:8*13],Key_o_tb[(8*12)+7:8*12],Key_o_tb[(8*11)+7:8*11],Key_o_tb[(8*10)+7:8*10],Key_o_tb[(8*9)+7:8*9],Key_o_tb[(8*8)+7:8*8],Key_o_tb[(8*7)+7:8*7],Key_o_tb[(8*6)+7:8*6],Key_o_tb[(8*5)+7:8*5],Key_o_tb[(8*4)+7:8*4],Key_o_tb[(8*3)+7:8*3],Key_o_tb[(8*2)+7:8*2],Key_o_tb[(8*1)+7:8*1],Key_o_tb[(8*0)+7:8*0]);
							
							CipherKey_i_tb = {8'h05,8'h39,8'hb1,8'h17,8'h76,8'h39,8'h2c,8'hFE,8'h6c,8'ha3,8'h54,8'hfa,8'h2a,8'h23,8'h88,8'ha0};
							RCON_tb = 8'h02;
							#78
							$display ("********* Test Case 2 *******************") ;
							$display ("OUT 0 = %0h OUT 1 = %0h OUT 2 = %0h OUT 3 = %0h ", Key_o_tb[(8*0)+7:8*0], Key_o_tb[(8*1)+7:8*1], Key_o_tb[(8*2)+7:8*2], Key_o_tb[(8*3)+7:8*3]) ; // $display ("OUT 1 = %0h ") ;$display ("OUT 2 = %0h ") ;$display ("OUT 3 = %0h ") ;
							$display ("OUT 4 = %0h OUT 5 = %0h OUT 6 = %0h OUT 7 = %0h ", Key_o_tb[(8*4)+7:8*4], Key_o_tb[(8*5)+7:8*5], Key_o_tb[(8*6)+7:8*6], Key_o_tb[(8*7)+7:8*7]) ; //  $display ("OUT 5 = %0h ") ;$display ("OUT 6 = %0h ") ;$display ("OUT 7 = %0h ") ;
							$display ("OUT 8 = %0h OUT 9 = %0h OUT 10 = %0h OUT 11 = %0h ", Key_o_tb[(8*8)+7:8*8], Key_o_tb[(8*9)+7:8*9], Key_o_tb[(8*10)+7:8*10], Key_o_tb[(8*11)+7:8*11]) ; //$display ("OUT 9 = %0h ") ; $display ("OUT 10 = %0h ") ; $display ("OUT 11 = %0h ") ;
							$display ("OUT 12 = %0h OUT 13 = %0h OUT 14 = %0h OUT 15 = %0h ", Key_o_tb[(8*12)+7:8*12], Key_o_tb[(8*13)+7:8*13], Key_o_tb[(8*14)+7:8*14], Key_o_tb[(8*15)+7:8*15]) ;//$display ("OUT 13 = %0h ") ;$display ("OUT 14 = %0h ") ;$display ("OUT 15 = %0h ") ;
							$display ("    ");
							$display ("8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h",Key_o_tb[(8*15)+7:8*15],Key_o_tb[(8*14)+7:8*14],Key_o_tb[(8*13)+7:8*13],Key_o_tb[(8*12)+7:8*12],Key_o_tb[(8*11)+7:8*11],Key_o_tb[(8*10)+7:8*10],Key_o_tb[(8*9)+7:8*9],Key_o_tb[(8*8)+7:8*8],Key_o_tb[(8*7)+7:8*7],Key_o_tb[(8*6)+7:8*6],Key_o_tb[(8*5)+7:8*5],Key_o_tb[(8*4)+7:8*4],Key_o_tb[(8*3)+7:8*3],Key_o_tb[(8*2)+7:8*2],Key_o_tb[(8*1)+7:8*1],Key_o_tb[(8*0)+7:8*0]);
							
							CipherKey_i_tb = {8'h6e,8'h41,8'h21,8'hf3,8'h00,8'h29,8'hdc,8'h66,8'h5c,8'hd1,8'hfa,8'h77,8'h57,8'h28,8'h19,8'hac};
							RCON_tb = 8'h36;
							#90
							$display ("********* Test Case 3 *******************") ;
							$display ("OUT 0 = %0h OUT 1 = %0h OUT 2 = %0h OUT 3 = %0h ", Key_o_tb[(8*0)+7:8*0], Key_o_tb[(8*1)+7:8*1], Key_o_tb[(8*2)+7:8*2], Key_o_tb[(8*3)+7:8*3]) ; // $display ("OUT 1 = %0h ") ;$display ("OUT 2 = %0h ") ;$display ("OUT 3 = %0h ") ;
							$display ("OUT 4 = %0h OUT 5 = %0h OUT 6 = %0h OUT 7 = %0h ", Key_o_tb[(8*4)+7:8*4], Key_o_tb[(8*5)+7:8*5], Key_o_tb[(8*6)+7:8*6], Key_o_tb[(8*7)+7:8*7]) ; //  $display ("OUT 5 = %0h ") ;$display ("OUT 6 = %0h ") ;$display ("OUT 7 = %0h ") ;
							$display ("OUT 8 = %0h OUT 9 = %0h OUT 10 = %0h OUT 11 = %0h ", Key_o_tb[(8*8)+7:8*8], Key_o_tb[(8*9)+7:8*9], Key_o_tb[(8*10)+7:8*10], Key_o_tb[(8*11)+7:8*11]) ; //$display ("OUT 9 = %0h ") ; $display ("OUT 10 = %0h ") ; $display ("OUT 11 = %0h ") ;
							$display ("OUT 12 = %0h OUT 13 = %0h OUT 14 = %0h OUT 15 = %0h ", Key_o_tb[(8*12)+7:8*12], Key_o_tb[(8*13)+7:8*13], Key_o_tb[(8*14)+7:8*14], Key_o_tb[(8*15)+7:8*15]) ;//$display ("OUT 13 = %0h ") ;$display ("OUT 14 = %0h ") ;$display ("OUT 15 = %0h ") ;
							$display ("    ");
							$display ("8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h",Key_o_tb[(8*15)+7:8*15],Key_o_tb[(8*14)+7:8*14],Key_o_tb[(8*13)+7:8*13],Key_o_tb[(8*12)+7:8*12],Key_o_tb[(8*11)+7:8*11],Key_o_tb[(8*10)+7:8*10],Key_o_tb[(8*9)+7:8*9],Key_o_tb[(8*8)+7:8*8],Key_o_tb[(8*7)+7:8*7],Key_o_tb[(8*6)+7:8*6],Key_o_tb[(8*5)+7:8*5],Key_o_tb[(8*4)+7:8*4],Key_o_tb[(8*3)+7:8*3],Key_o_tb[(8*2)+7:8*2],Key_o_tb[(8*1)+7:8*1],Key_o_tb[(8*0)+7:8*0]);
							
							$finish		;				
					end

KeySchedule U6 (
					.clk(clk_tb),.rst_n(rst_n_tb),.en(en_tb),
					.RCON(RCON_tb),
					.CipherKey_i(CipherKey_i_tb),
					.Key_flag(Key_flag_tb),
					.Key_o(Key_o_tb)
);
					endmodule
module AES_tb();

				reg clk_tb,rst_n_tb,en_tb;
				reg [127:0] CipherKey_i_tb,Data_i_tb;
				wire [127:0]	AES_o;
				
always #5 clk_tb = ~clk_tb;
					
					initial
					begin
							$dumpfile("AES.vcd") ;
							$dumpvars ;
							clk_tb = 1'b0;
							rst_n_tb = 1'b1;
							en_tb= 1'b1;
							#4 
							rst_n_tb = 1'b0;
							#3
							rst_n_tb = 1'b1;
							
							
							
							CipherKey_i_tb = {8'h3c,8'h88,8'ha6,8'h16,8'h4f,8'h15,8'hd2,8'h15,8'hcf,8'hf7,8'hae,8'h7e,8'h09,8'hab,8'h28,8'h2b};
							Data_i_tb = {8'h34,8'hA2,8'h8D,8'hA8,8'h07,8'h98,8'h30,8'hf6,8'h37,8'h31,8'h5A,8'h43,8'hE0,8'h31,8'h88,8'h32};
							
							
							
							#1000
							$display ("********* Test Case 1 *******************") ;
							$display ("OUT 0 = %0h OUT 1 = %0h OUT 2 = %0h OUT 3 = %0h ", AES_o[(8*0)+7:8*0], AES_o[(8*1)+7:8*1], AES_o[(8*2)+7:8*2], AES_o[(8*3)+7:8*3]) ; // $display ("OUT 1 = %0h ") ;$display ("OUT 2 = %0h ") ;$display ("OUT 3 = %0h ") ;
							$display ("OUT 4 = %0h OUT 5 = %0h OUT 6 = %0h OUT 7 = %0h ", AES_o[(8*4)+7:8*4], AES_o[(8*5)+7:8*5], AES_o[(8*6)+7:8*6], AES_o[(8*7)+7:8*7]) ; //  $display ("OUT 5 = %0h ") ;$display ("OUT 6 = %0h ") ;$display ("OUT 7 = %0h ") ;
							$display ("OUT 8 = %0h OUT 9 = %0h OUT 10 = %0h OUT 11 = %0h ", AES_o[(8*8)+7:8*8], AES_o[(8*9)+7:8*9], AES_o[(8*10)+7:8*10], AES_o[(8*11)+7:8*11]) ; //$display ("OUT 9 = %0h ") ; $display ("OUT 10 = %0h ") ; $display ("OUT 11 = %0h ") ;
							$display ("OUT 12 = %0h OUT 13 = %0h OUT 14 = %0h OUT 15 = %0h ", AES_o[(8*12)+7:8*12], AES_o[(8*13)+7:8*13], AES_o[(8*14)+7:8*14], AES_o[(8*15)+7:8*15]) ;//$display ("OUT 13 = %0h ") ;$display ("OUT 14 = %0h ") ;$display ("OUT 15 = %0h ") ;
							$display ("    ");
							$display ("8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h",AES_o[(8*15)+7:8*15],AES_o[(8*14)+7:8*14],AES_o[(8*13)+7:8*13],AES_o[(8*12)+7:8*12],AES_o[(8*11)+7:8*11],AES_o[(8*10)+7:8*10],AES_o[(8*9)+7:8*9],AES_o[(8*8)+7:8*8],AES_o[(8*7)+7:8*7],AES_o[(8*6)+7:8*6],AES_o[(8*5)+7:8*5],AES_o[(8*4)+7:8*4],AES_o[(8*3)+7:8*3],AES_o[(8*2)+7:8*2],AES_o[(8*1)+7:8*1],AES_o[(8*0)+7:8*0]);
							
							
							$finish		;				
					end



AES U8 (
				.clk(clk_tb),.rst_n(rst_n_tb),.en(en_tb),
				.CipherKey_i(CipherKey_i_tb),.Data_i(Data_i_tb),
				.AES_o(AES_o)
			
			);
endmodule				
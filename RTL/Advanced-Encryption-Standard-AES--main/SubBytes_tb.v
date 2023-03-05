module SuBytes_tb();

					 reg clk_tb,rst_n_tb,en_tb;
					 reg [127:0]  subbytes_i_tb;
					 wire [127:0]  subbytes_o_tb;
					
					
					always #5 clk_tb = ~clk_tb;
					
					initial
					begin
							$dumpfile("subbytes.vcd") ;
							$dumpvars ;
							clk_tb = 1'b0;
							rst_n_tb = 1'b1;
							
							#4 
							rst_n_tb = 1'b0;
							#3
							rst_n_tb = 1'b1;
							
							
							//subbytes_i_tb = {8'h34,8'hA2,8'h8D,8'hA8,8'h07,8'h98,8'h30,8'hf6,8'h37,8'h31,8'h5A,8'h43,8'hE0,8'h31,8'h88,8'h32};
							
							subbytes_i_tb = {8'h08,8'h2a,8'h2b,8'hbe,8'h48,8'h8d,8'he2,8'he3,8'hf8,8'hc6,8'hf4,8'h3d,8'hE9,8'h9a,8'ha0,8'h19};
							en_tb= 1'b1;
							#50
							$display ("********* Test Case 1 *******************") ;
							$display ("OUT 0 = %0h OUT 1 = %0h OUT 2 = %0h OUT 3 = %0h ", subbytes_o_tb[(8*0)+7:8*0], subbytes_o_tb[(8*1)+7:8*1], subbytes_o_tb[(8*2)+7:8*2], subbytes_o_tb[(8*3)+7:8*3]) ; // $display ("OUT 1 = %0h ") ;$display ("OUT 2 = %0h ") ;$display ("OUT 3 = %0h ") ;
							$display ("OUT 4 = %0h OUT 5 = %0h OUT 6 = %0h OUT 7 = %0h ", subbytes_o_tb[(8*4)+7:8*4], subbytes_o_tb[(8*5)+7:8*5], subbytes_o_tb[(8*6)+7:8*6], subbytes_o_tb[(8*7)+7:8*7]) ; //  $display ("OUT 5 = %0h ") ;$display ("OUT 6 = %0h ") ;$display ("OUT 7 = %0h ") ;
							$display ("OUT 8 = %0h OUT 9 = %0h OUT 10 = %0h OUT 11 = %0h ", subbytes_o_tb[(8*8)+7:8*8], subbytes_o_tb[(8*9)+7:8*9], subbytes_o_tb[(8*10)+7:8*10], subbytes_o_tb[(8*11)+7:8*11]) ; //$display ("OUT 9 = %0h ") ; $display ("OUT 10 = %0h ") ; $display ("OUT 11 = %0h ") ;
							$display ("OUT 12 = %0h OUT 13 = %0h OUT 14 = %0h OUT 15 = %0h ", subbytes_o_tb[(8*12)+7:8*12], subbytes_o_tb[(8*13)+7:8*13], subbytes_o_tb[(8*14)+7:8*14], subbytes_o_tb[(8*15)+7:8*15]) ;//$display ("OUT 13 = %0h ") ;$display ("OUT 14 = %0h ") ;$display ("OUT 15 = %0h ") ;
							$display ("    ");
							$display ("8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h",subbytes_o_tb[(8*15)+7:8*15],subbytes_o_tb[(8*14)+7:8*14],subbytes_o_tb[(8*13)+7:8*13],subbytes_o_tb[(8*12)+7:8*12],subbytes_o_tb[(8*11)+7:8*11],subbytes_o_tb[(8*10)+7:8*10],subbytes_o_tb[(8*9)+7:8*9],subbytes_o_tb[(8*8)+7:8*8],subbytes_o_tb[(8*7)+7:8*7],subbytes_o_tb[(8*6)+7:8*6],subbytes_o_tb[(8*5)+7:8*5],subbytes_o_tb[(8*4)+7:8*4],subbytes_o_tb[(8*3)+7:8*3],subbytes_o_tb[(8*2)+7:8*2],subbytes_o_tb[(8*1)+7:8*1],subbytes_o_tb[(8*0)+7:8*0]);
							
							subbytes_i_tb = {8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h09,8'h3c,8'h4f,8'hcf};
							#10
							$display ("********* Test Case 2 *******************") ;
							$display ("OUT 0 = %0h ", subbytes_o_tb[(8*0)+7:8*0]) ;  $display ("OUT 1 = %0h ", subbytes_o_tb[(8*1)+7:8*1]) ;$display ("OUT 2 = %0h ", subbytes_o_tb[(8*2)+7:8*2]) ;$display ("OUT 3 = %0h ", subbytes_o_tb[(8*3)+7:8*3]) ;
							$display ("OUT 4 = %0h ", subbytes_o_tb[(8*4)+7:8*4]) ;  $display ("OUT 5 = %0h ", subbytes_o_tb[(8*5)+7:8*5]) ;$display ("OUT 6 = %0h ", subbytes_o_tb[(8*6)+7:8*6]) ;$display ("OUT 7 = %0h ", subbytes_o_tb[(8*7)+7:8*7]) ;
							$display ("OUT 8 = %0h ", subbytes_o_tb[(8*8)+7:8*8]) ; $display ("OUT 9 = %0h ", subbytes_o_tb[(8*9)+7:8*9]) ; $display ("OUT 10 = %0h ", subbytes_o_tb[(8*10)+7:8*10]) ; $display ("OUT 11 = %0h ", subbytes_o_tb[(8*11)+7:8*11]) ;
							$display ("OUT 12 = %0h ", subbytes_o_tb[(8*12)+7:8*12]) ;$display ("OUT 13 = %0h ", subbytes_o_tb[(8*13)+7:8*13]) ;$display ("OUT 14 = %0h ", subbytes_o_tb[(8*14)+7:8*14]) ;$display ("OUT 15 = %0h ", subbytes_o_tb[(8*15)+7:8*15]) ;
							
							$finish		;				
					end

SubBytes U6 (
					.clk(clk_tb),.rst_n(rst_n_tb),.en(en_tb),
					.subbytes_i(subbytes_i_tb),
					.subbytes_o(subbytes_o_tb)
);
					endmodule
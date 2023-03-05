/*OUT 0 = d4 
# OUT 1 = e0 
# OUT 2 = b8 
# OUT 3 = 1e 
# OUT 4 = 27 
# OUT 5 = bf 
# OUT 6 = b4 
# OUT 7 = 41 
# OUT 8 = 11 
# OUT 9 = 98 
# OUT 10 = 5d 
# OUT 11 = 52 
# OUT 12 = ae 
# OUT 13 = f1 
# OUT 14 = e5 
# OUT 15 = 30 

*/
module ShiftRows_tb();

					 reg clk_tb,rst_n_tb,en_tb;
					 reg [127:0]  shiftrows_i_tb;
					 wire [127:0]  shiftrows_o_tb;
					
					
					always #5 clk_tb = ~clk_tb;
					
					initial
					begin
							$dumpfile("ShiftRows.vcd") ;
							$dumpvars ;
							clk_tb = 1'b0;
							rst_n_tb = 1'b1;
							en_tb= 1'b1;
							#4 
							rst_n_tb = 1'b0;
							#3
							rst_n_tb = 1'b1;
							
							
							//shiftrows_i_tb = {8'h34,8'hA2,8'h8D,8'hA8,8'h07,8'h98,8'h30,8'hf6,8'h37,8'h31,8'h5A,8'h43,8'hE0,8'h31,8'h88,8'h32};
							
							shiftrows_i_tb = {8'h30,8'he5,8'hf1,8'hae,8'h52,8'h5d,8'h98,8'h11,8'h41,8'hb4,8'hbf,8'h27,8'h1e,8'hb8,8'he0,8'hd4};
							
							#10
							$display ("********* Test Case 1 *******************") ;
							$display ("OUT  0 = {%0h} OUT  1 = {%0h} OUT  2 = {%0h} OUT  3 = {%0h} ", shiftrows_o_tb[(8*0)+7:8*0], shiftrows_o_tb[(8*1)+7:8*1], shiftrows_o_tb[(8*2)+7:8*2], shiftrows_o_tb[(8*3)+7:8*3]) ; // $display ("OUT 1 = {%0h} ") ;$display ("OUT 2 = {%0h} ") ;$display ("OUT 3 = {%0h} ") ;
							$display ("OUT  4 = {%0h} OUT  5 = {%0h} OUT  6 = {%0h} OUT  7 = {%0h} ", shiftrows_o_tb[(8*4)+7:8*4], shiftrows_o_tb[(8*5)+7:8*5], shiftrows_o_tb[(8*6)+7:8*6], shiftrows_o_tb[(8*7)+7:8*7]) ; //  $display ("OUT 5 = {%0h} ") ;$display ("OUT 6 = {%0h} ") ;$display ("OUT 7 = {%0h} ") ;
							$display ("OUT  8 = {%0h} OUT  9 = {%0h} OUT 10 = {%0h} OUT 11 = {%0h} ", shiftrows_o_tb[(8*8)+7:8*8], shiftrows_o_tb[(8*9)+7:8*9], shiftrows_o_tb[(8*10)+7:8*10], shiftrows_o_tb[(8*11)+7:8*11]) ; //$display ("OUT 9 = {%0h} ") ; $display ("OUT 10 = {%0h} ") ; $display ("OUT 11 = {%0h} ") ;
							$display ("OUT 12 = {%0h} OUT 13 = {%0h} OUT 14 = {%0h} OUT 15 = {%0h} ", shiftrows_o_tb[(8*12)+7:8*12], shiftrows_o_tb[(8*13)+7:8*13], shiftrows_o_tb[(8*14)+7:8*14], shiftrows_o_tb[(8*15)+7:8*15]) ;//$display ("OUT 13 = {%0h} ") ;$display ("OUT 14 = {%0h} ") ;$display ("OUT 15 = {%0h} ") ;
							$display ("    ");
							$display ("8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h,8'h%0h",shiftrows_o_tb[(8*15)+7:8*15],shiftrows_o_tb[(8*14)+7:8*14],shiftrows_o_tb[(8*13)+7:8*13],shiftrows_o_tb[(8*12)+7:8*12],shiftrows_o_tb[(8*11)+7:8*11],shiftrows_o_tb[(8*10)+7:8*10],shiftrows_o_tb[(8*9)+7:8*9],shiftrows_o_tb[(8*8)+7:8*8],shiftrows_o_tb[(8*7)+7:8*7],shiftrows_o_tb[(8*6)+7:8*6],shiftrows_o_tb[(8*5)+7:8*5],shiftrows_o_tb[(8*4)+7:8*4],shiftrows_o_tb[(8*3)+7:8*3],shiftrows_o_tb[(8*2)+7:8*2],shiftrows_o_tb[(8*1)+7:8*1],shiftrows_o_tb[(8*0)+7:8*0]);
							/*ShiftRows_i_tb = {8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h00,8'h09,8'h3c,8'h4f,8'hcf};
							#10
							$display ("********* Test Case 2 *******************") ;
							$display ("OUT  0 = {%0h} ", shiftrows_o_tb[(8*0)+7:8*0]) ;  $display ("OUT 1 = {%0h} ", shiftrows_o_tb[(8*1)+7:8*1]) ;$display ("OUT 2 = {%0h} ", shiftrows_o_tb[(8*2)+7:8*2]) ;$display ("OUT 3 = {%0h} ", shiftrows_o_tb[(8*3)+7:8*3]) ;
							$display ("OUT  4 = {%0h} ", shiftrows_o_tb[(8*4)+7:8*4]) ;  $display ("OUT 5 = {%0h} ", shiftrows_o_tb[(8*5)+7:8*5]) ;$display ("OUT 6 = {%0h} ", shiftrows_o_tb[(8*6)+7:8*6]) ;$display ("OUT 7 = {%0h} ", shiftrows_o_tb[(8*7)+7:8*7]) ;
							$display ("OUT  8 = {%0h} ", shiftrows_o_tb[(8*8)+7:8*8]) ; $display ("OUT 9 = {%0h} ", shiftrows_o_tb[(8*9)+7:8*9]) ; $display ("OUT 10 = {%0h} ", shiftrows_o_tb[(8*10)+7:8*10]) ; $display ("OUT 11 = {%0h} ", shiftrows_o_tb[(8*11)+7:8*11]) ;
							$display ("OUT 12 = {%0h} ", shiftrows_o_tb[(8*12)+7:8*12]) ;$display ("OUT 13 = {%0h} ", shiftrows_o_tb[(8*13)+7:8*13]) ;$display ("OUT 14 = {%0h} ", shiftrows_o_tb[(8*14)+7:8*14]) ;$display ("OUT 15 = {%0h} ", shiftrows_o_tb[(8*15)+7:8*15]) ;
							*/
							$finish		;				
					end

ShiftRows U6 (
					.clk(clk_tb),.rst_n(rst_n_tb),.en(en_tb),
					.shiftrows_i(shiftrows_i_tb),
					.shiftrows_o(shiftrows_o_tb)
);
					endmodule
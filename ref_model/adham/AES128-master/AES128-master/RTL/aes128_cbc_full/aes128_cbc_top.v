`timescale 1ns / 1ps


module aes128_cbc_top(
    input wire clk,
    input wire reset,
    
    input wire [31:0] key_0,
    input wire [31:0] key_1,
    input wire [31:0] key_2,
    input wire [31:0] key_3,
    
    input wire [31:0] vector_0,
    input wire [31:0] vector_1,
    input wire [31:0] vector_2,
    input wire [31:0] vector_3,
    
    input wire [31:0] plain_text_0,
    input wire [31:0] plain_text_1,
    input wire [31:0] plain_text_2,
    input wire [31:0] plain_text_3,
    
//    output wire [1407:0] expanded_key,
    
    output wire [31:0] cipher_text_0,   
    output wire [31:0] cipher_text_1,  
    output wire [31:0] cipher_text_2,    
    output wire [31:0] cipher_text_3,
    
    output wire [31:0] decrypted_plain_text_0,   
    output wire [31:0] decrypted_plain_text_1,  
    output wire [31:0] decrypted_plain_text_2,    
    output wire [31:0] decrypted_plain_text_3 
	);
	
	
	
	wire [127:0] round1_key, round2_key, round3_key, round4_key, round5_key,
				 round6_key, round7_key, round8_key, round9_key, round10_key;
	
	
	wire [1407:0] expanded_key_out;	
	wire [127:0] cipher_out;
	wire [127:0] decrypted_plain_text_out;
	
	reg [127:0] key;
	reg [127:0] vector;	
	reg [127:0] plain_text;
	
	
//	always @(posedge clk)
//    begin
//        key[127:0] <= 128'h100F0E0D0C0B0A090807060504030201;
//	    
//    end
    
    always @*
    begin
	    vector[31:0] = vector_0;
     	vector[63:32] = vector_1;
     	vector[95:64] = vector_2;
     	vector[127:96] = vector_3;  
	    
	    key[31:0] = key_0;
     	key[63:32] = key_1;
     	key[95:64] = key_2;
     	key[127:96] = key_3;  
	    
		plain_text[31:0] = plain_text_0;
     	plain_text[63:32] = plain_text_1;
     	plain_text[95:64] = plain_text_2;
     	plain_text[127:96] = plain_text_3;    
    end
    
//	assign expanded_key = expanded_key_out;
    
	assign cipher_text_0 = cipher_out[31:0];
    assign cipher_text_1 = cipher_out[63:32];
    assign cipher_text_2 = cipher_out[95:64];
    assign cipher_text_3 = cipher_out[127:96];
    
    assign decrypted_plain_text_0 = decrypted_plain_text_out[31:0];
    assign decrypted_plain_text_1 = decrypted_plain_text_out[63:32];
    assign decrypted_plain_text_2 = decrypted_plain_text_out[95:64];
    assign decrypted_plain_text_3 = decrypted_plain_text_out[127:96];
    
	expand_key_top i_expand_key_top(
		.clk(clk), 
	    .reset(reset),		
		.key(key),
		.expanded_key(expanded_key_out));

	key_scheduler i_key_scheduler(
	    . clk(clk),
	    . reset(reset),
	    . expanded_key(expanded_key_out),
	    . round1_key(round1_key),
	    . round2_key(round2_key),
	    . round3_key(round3_key),
	    . round4_key(round4_key),
	    . round5_key(round5_key),
	    . round6_key(round6_key),
	    . round7_key(round7_key),
	    . round8_key(round8_key),
	    . round9_key(round9_key),
	    . round10_key(round10_key));

	encrypt_top i_encrypt_top(
		. clk(clk),
		. reset(reset),
		. key(key),
		. vector(vector),
		. round1_key(round1_key),
	    . round2_key(round2_key),
	    . round3_key(round3_key),
	    . round4_key(round4_key),
	    . round5_key(round5_key),
	    . round6_key(round6_key),
	    . round7_key(round7_key),
	    . round8_key(round8_key),
	    . round9_key(round9_key),
	    . round10_key(round10_key),
		. plain_text(plain_text), 
		. cipher_text(cipher_out));
    
    decrypt_top i_decrypt_top(
		. clk(clk),
		. reset(reset),
		. vector(vector),
		. key(key), 
		. round1_key(round1_key),
	    . round2_key(round2_key),
	    . round3_key(round3_key),
	    . round4_key(round4_key),
	    . round5_key(round5_key),
	    . round6_key(round6_key),
	    . round7_key(round7_key),
	    . round8_key(round8_key),
	    . round9_key(round9_key),
	    . round10_key(round10_key),
		. cipher_text(cipher_out),
		. decrypted_plain_text(decrypted_plain_text_out) );

endmodule 
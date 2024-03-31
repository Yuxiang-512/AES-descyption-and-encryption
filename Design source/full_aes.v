`timescale 1ns / 1ps

module full_aes(
        input clk, input kld, input reset,
        input [127:0] plain_text,
        input [127:0] cipher_key,
        output [127:0] cipher_text,
        output [127:0] aes_output
    );
    
    // DEFINE PARAMETERS FOR KEY EXPANSION
    parameter nk = 4; parameter nr = 10;
    wire [0 : (128 * (nr + 1 )) - 1] round_keys;
    
    // INSTANTIATE KEY EXPANSION MODULE
    keyExpansion #(.nk(nk), .nr(nr)) uut (
        .key(cipher_key), 
        .w(round_keys)
    );
    
    // Instantitate Encryption Module
    aes_encryption_unrolled encrypt(
        .clk(clk),
        .kld(kld),
        .reset(reset),
        .round_keys(round_keys),
        .text(plain_text),
        .aes_output(cipher_text)
    );
    
    // Instantiate Decryption Module
    aes_decryption_unrolled decrypt(
        .clk(clk),
        .kld(kld),
        .reset(reset),
        .round_keys(round_keys),
        .encrypted_text(cipher_text),
        .aes_output(aes_output)
    );
    
endmodule

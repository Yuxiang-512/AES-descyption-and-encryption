`timescale 1ns / 10ps

module full_aes_tb;

    // Inputs
    reg clk; reg kld; reg reset; reg enable;
    reg [127:0] cipher_key;
    reg [127:0] plain_text;

    // Outputs
    //wire [127:0] round_key;
    wire [127:0] cipher_text;
    wire [127:0] aes_output;

    // Instantiate AES Module
    full_aes uut(
        .clk(clk),
        .kld(kld),
        .reset(reset),
        .plain_text(plain_text),
        .cipher_key(cipher_key),
        .cipher_text(cipher_text),
        .aes_output(aes_output)
    );


    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock with period of 10ns
    end

    // Test Stimulus
    initial begin
        // Initialize Inputs
        enable = 0;
        kld = 0; reset = 1;
        cipher_key = 128'he2d9a9bca6096344854d07f9acf2833a;         // Cipher Key
        plain_text  = 128'h000102030405060708090a0b0c0d0e0f;        // Plain Text
        
        //encryption_output = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;  // Cipher Text
        
        // Wait for global reset
        #10; reset = 0;
        enable = 1;

        // Load the key
        kld = 1; #10; kld = 0;

        // Wait for some time to observe the outputs
        #1500;

        // Finish the simulation
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time = %t, Encryption Output = %h, Decryption Output = %h", $time, cipher_text, aes_output);
    end

endmodule
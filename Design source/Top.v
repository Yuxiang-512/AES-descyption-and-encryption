module aes_decryption_128 (
    input clk, input kld, input reset, input enable,
    input [127:0] key, 
    input [127:0] encrypted_text, 
    output [127:0] round_key, 
    output [127:0] aes_output
);

reg [31:0] w[3:0];
wire [31:0] tmp_w;
wire [31:0] subword;
wire [31:0] rcon;
integer round_count;

// Declare storage for round_key
reg [127:0] roundkey_array [11:0];
reg [3:0] arrayIndex = 0;
integer i;

// Generate Round Key in reverse
// Key generation remains the same; decryption uses the keys in reverse order
always @(posedge clk) begin
    // Set Round Keys
    w[0] <= #1 kld ? key[127:096] : w[0]^subword^rcon;
    w[1] <= #1 kld ? key[095:064] : w[0]^w[1]^subword^rcon;
    w[2] <= #1 kld ? key[063:032] : w[0]^w[2]^w[1]^subword^rcon;
    w[3] <= #1 kld ? key[031:000] : w[0]^w[3]^w[2]^w[1]^subword^rcon;
    
    // Storing round_key in an array 
    if (!kld && arrayIndex < 12) begin
        roundkey_array[arrayIndex] = {w[0], w[1], w[2], w[3]};
        arrayIndex <= arrayIndex + 1;
    end
    
    // Increasing Round Count Per Clk
    round_count <= #1 kld ? 0 : round_count + 1;
end

// ASSIGN ROUND KEY: Keep this the same; decryption process uses the keys in reverse
assign round_key = {w[0], w[1], w[2], w[3]};
assign tmp_w = w[3];

// Inverse operations for decryption
SubBytes u0(    .matrix_in(tmp_w[23:16]), .matrix_out(subword[31:24]));
SubBytes u1(    .matrix_in(tmp_w[15:08]), .matrix_out(subword[23:16]));
SubBytes u2(    .matrix_in(tmp_w[07:00]), .matrix_out(subword[15:08]));
SubBytes u3(    .matrix_in(tmp_w[31:24]), .matrix_out(subword[07:00]));
aes_rcon r0(    .clk(clk), .kld(kld), .out(rcon));

// Define Round End Output
wire [127:0] round_end [11:0];
wire [127:0] inv_sb_output [10:0];
wire [127:0] inv_sr_output [10:0];
wire [127:0] inv_mc_input [10:0];

// Start Round Loops for decryption
genvar rounds; 
assign round_end[11] = roundkey_array[11] ^ encrypted_text; // Starting point uses the last key
generate
    for (rounds = 11; rounds > 0; rounds = rounds - 1) begin
        // ROUND START
        // InvShift Rows
        inv_shift_rows inv_sr(
            .enable(enable),
            .reset(reset),
            .clock(clk),
            .State_Out(round_end[rounds]),
            .Inv_State_Out(inv_sr_output[rounds-1])
        );
        
        // Round Input InvSubBytes
        inv_subbytes_128 inv_sb(
            .sb_input(inv_sr_output[rounds-1]),
            .sb_output(inv_sb_output[rounds-1])
        );
        
        assign inv_mc_input[rounds-1] = inv_sb_output[rounds-1] ^ roundkey_array[rounds-1];

        // InvMixColumns except for the last round
        if (rounds > 1) begin // No InvMixColumns in the final round
            inv_MixColumns inv_mc(
                .clk(clk),
                .reset(reset),
                .state_in(inv_mc_input[rounds-1]),
                .state_out(round_end[rounds-1])
            );
            
        end
    end
endgenerate

// ASSIGN OUTPUT
assign aes_output = inv_mc_input[1];
endmodule


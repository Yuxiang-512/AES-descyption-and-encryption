module aes_decryption_unrolled (
    input clk, input kld, input reset,
    input [0:1407] round_keys, 
    input [127:0] encrypted_text, 
    output [127:0] aes_output
);

// Define Round End Output
wire [127:0] round_end [11:0];
wire [127:0] inv_sb_output [10:0];
wire [127:0] inv_sr_output [10:0];
wire [127:0] inv_mc_input [10:0];

// ROUND START
assign round_end[11] = round_keys[1280:1407] ^ encrypted_text;
// InvShift Rows
inv_shift_rows inv_sr11(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[11]),
    .Inv_State_Out(inv_sr_output[10])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb11(
    .sb_input(inv_sr_output[10]),
    .sb_output(inv_sb_output[10])
);

assign inv_mc_input[10] = inv_sb_output[10] ^ round_keys[1152:1279];

// InvMixColumns except for the last round

inv_MixColumns inv_mc11(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[10]),
    .state_out(round_end[10])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr10(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[10]),
    .Inv_State_Out(inv_sr_output[9])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb10(
    .sb_input(inv_sr_output[9]),
    .sb_output(inv_sb_output[9])
);

assign inv_mc_input[9] = inv_sb_output[9] ^ round_keys[1024:1151];

// InvMixColumns except for the last round

inv_MixColumns inv_mc10(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[9]),
    .state_out(round_end[9])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr9(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[9]),
    .Inv_State_Out(inv_sr_output[8])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb9(
    .sb_input(inv_sr_output[8]),
    .sb_output(inv_sb_output[8])
);

assign inv_mc_input[8] = inv_sb_output[8] ^ round_keys[896:1023];

// InvMixColumns except for the last round

inv_MixColumns inv_mc9(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[8]),
    .state_out(round_end[8])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr8(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[8]),
    .Inv_State_Out(inv_sr_output[7])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb8(
    .sb_input(inv_sr_output[7]),
    .sb_output(inv_sb_output[7])
);

assign inv_mc_input[7] = inv_sb_output[7] ^ round_keys[768:895];

// InvMixColumns except for the last round

inv_MixColumns inv_mc8(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[7]),
    .state_out(round_end[7])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr7(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[7]),
    .Inv_State_Out(inv_sr_output[6])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb7(
    .sb_input(inv_sr_output[6]),
    .sb_output(inv_sb_output[6])
);

assign inv_mc_input[6] = inv_sb_output[6] ^ round_keys[640:767];

// InvMixColumns except for the last round

inv_MixColumns inv_mc7(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[6]),
    .state_out(round_end[6])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr6(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[6]),
    .Inv_State_Out(inv_sr_output[5])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb6(
    .sb_input(inv_sr_output[5]),
    .sb_output(inv_sb_output[5])
);

assign inv_mc_input[5] = inv_sb_output[5] ^ round_keys[512:639];

// InvMixColumns except for the last round

inv_MixColumns inv_mc6(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[5]),
    .state_out(round_end[5])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr5(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[5]),
    .Inv_State_Out(inv_sr_output[4])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb5(
    .sb_input(inv_sr_output[4]),
    .sb_output(inv_sb_output[4])
);

assign inv_mc_input[4] = inv_sb_output[4] ^ round_keys[384:511];

// InvMixColumns except for the last round

inv_MixColumns inv_mc5(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[4]),
    .state_out(round_end[4])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr4(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[4]),
    .Inv_State_Out(inv_sr_output[3])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb4(
    .sb_input(inv_sr_output[3]),
    .sb_output(inv_sb_output[3])
);

assign inv_mc_input[3] = inv_sb_output[3] ^ round_keys[256:383];

// InvMixColumns except for the last round

inv_MixColumns inv_mc4(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[3]),
    .state_out(round_end[3])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr3(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[3]),
    .Inv_State_Out(inv_sr_output[2])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb3(
    .sb_input(inv_sr_output[2]),
    .sb_output(inv_sb_output[2])
);

assign inv_mc_input[2] = inv_sb_output[2] ^ round_keys[128:255];

// InvMixColumns except for the last round

inv_MixColumns inv_mc3(
    .clk(clk),
    .reset(reset),
    .state_in(inv_mc_input[2]),
    .state_out(round_end[2])
);
// ROUND END

// ROUND START
// InvShift Rows
inv_shift_rows inv_sr2(
    .reset(reset),
    .clock(clk),
    .State_Out(round_end[2]),
    .Inv_State_Out(inv_sr_output[1])
);

// Round Input InvSubBytes
inv_subbytes_128 inv_sb2(
    .sb_input(inv_sr_output[1]),
    .sb_output(inv_sb_output[1])
);

assign inv_mc_input[1] = inv_sb_output[1] ^ round_keys[0:127];

// ROUND END

// ASSIGN OUTPUT
assign aes_output = inv_mc_input[1];
endmodule


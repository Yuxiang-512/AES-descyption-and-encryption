`timescale 1ns / 10ps

module aes_encryption_unrolled (
    input clk, input kld, input reset,
    input [0:1407] round_keys, 
    input [127:0] text, 
    output [127:0] aes_output
);

// Define Round End Output
wire [127:0] round_end [10:0];
wire [127:0] sb_output [9:0];
wire [127:0] sr_output [9:0];
wire [127:0] mc_output [9:0];

// ROUND 0:
assign round_end[0] = text ^ round_keys[0:127];

// ROUND START: ROUND 1
// Round Input SubBytes: WORKING
SubBytes_128 sb1(
    .sb_input(round_end[0]),
    .sb_output(sb_output[0])
);

// Shift Rows: FIREST ROUND WORKING
shift_rows sr1(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[0]),
    .State_Out(sr_output[0])
);

// MIX COLUMNS
MixColumns mc1(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[0]),
    .state_out(mc_output[0])
);

// End Round Key XOR Operation
assign round_end[1] = mc_output[0] ^ round_keys[128:255];
// END OF ROUND

// ROUND START
// Round Input SubBytes: WORKING
SubBytes_128 sb2(
    .sb_input(round_end[1]),
    .sb_output(sb_output[1])
);

// Shift Rows: FIREST ROUND WORKING
shift_rows sr2(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[1]),
    .State_Out(sr_output[1])
);

// MIX COLUMNS

MixColumns mc2(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[1]),
    .state_out(mc_output[1])
);

// End Round Key XOR Operation
assign round_end[2] = mc_output[1] ^ round_keys[256:383];
// END OF ROUND

// ROUND START
// Round Input SubBytes: WORKING
SubBytes_128 sb3(
    .sb_input(round_end[2]),
    .sb_output(sb_output[2])
);

// Shift Rows: FIREST ROUND WORKING
shift_rows sr3(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[2]),
    .State_Out(sr_output[2])
);

// MIX COLUMNS

MixColumns mc3(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[2]),
    .state_out(mc_output[2])
);

// End Round Key XOR Operation
assign round_end[3] = mc_output[2] ^ round_keys[384:511];
// END OF ROUND

// ROUND START
// Round Input SubBytes: WORKING
SubBytes_128 sb4(
    .sb_input(round_end[3]),
    .sb_output(sb_output[3])
);

// Shift Rows: FIREST ROUND WORKING
shift_rows sr4(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[3]),
    .State_Out(sr_output[3])
);

// MIX COLUMNS

MixColumns mc4(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[3]),
    .state_out(mc_output[3])
);

// End Round Key XOR Operation
assign round_end[4] = mc_output[3] ^ round_keys[512:639];
// END OF ROUND

// ROUND START
// Round Input SubBytes: WORKING
SubBytes_128 sb5(
    .sb_input(round_end[4]),
    .sb_output(sb_output[4])
);

// Shift Rows: FIREST ROUND WORKING
shift_rows sr5(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[4]),
    .State_Out(sr_output[4])
);

// MIX COLUMNS

MixColumns mc5(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[4]),
    .state_out(mc_output[4])
);

// End Round Key XOR Operation
assign round_end[5] = mc_output[4] ^ round_keys[640:767];
// END OF ROUND

// ROUND START
// Round Input SubBytes: WORKING
SubBytes_128 sb6(
    .sb_input(round_end[5]),
    .sb_output(sb_output[5])
);

// Shift Rows: FIREST ROUND WORKING
shift_rows sr6(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[5]),
    .State_Out(sr_output[5])
);

// MIX COLUMNS

MixColumns mc6(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[5]),
    .state_out(mc_output[5])
);

// End Round Key XOR Operation
assign round_end[6] = mc_output[5] ^ round_keys[768:895];
// END OF ROUND

// ROUND START
// Round Input SubBytes: WORKING
SubBytes_128 sb7(
    .sb_input(round_end[6]),
    .sb_output(sb_output[6])
);

// Shift Rows: FIREST ROUND WORKING
shift_rows sr7(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[6]),
    .State_Out(sr_output[6])
);

// MIX COLUMNS

MixColumns mc7(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[6]),
    .state_out(mc_output[6])
);

// End Round Key XOR Operation
assign round_end[7] = mc_output[6] ^ round_keys[896:1023];
// END OF ROUND

// ROUND START
// Round Input SubBytes
SubBytes_128 sb8(
    .sb_input(round_end[7]),
    .sb_output(sb_output[7])
);

// Shift Rows
shift_rows sr8(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[7]),
    .State_Out(sr_output[7])
);

// MIX COLUMNS

MixColumns mc8(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[7]),
    .state_out(mc_output[7])
);

// End Round Key XOR Operation
assign round_end[8] = mc_output[7] ^ round_keys[1024:1151];
// END OF ROUND

// ROUND START
// Round Input SubBytes
SubBytes_128 sb9(
    .sb_input(round_end[8]),
    .sb_output(sb_output[8])
);

// Shift Rows
shift_rows sr9(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[8]),
    .State_Out(sr_output[8])
);

// MIX COLUMNS

MixColumns mc9(
    .clk(clk),
    .reset(reset),
    .state_in(sr_output[8]),
    .state_out(mc_output[8])
);

// End Round Key XOR Operation
assign round_end[9] = mc_output[8] ^ round_keys[1152:1279];
// END OF ROUND

// ROUND START
// Round Input SubBytes
SubBytes_128 sb10(
    .sb_input(round_end[9]),
    .sb_output(sb_output[9])
);

// Shift Rows
shift_rows sr10(
    .reset(reset),
    .clock(clk),
    .State_In(sb_output[9]),
    .State_Out(sr_output[9])
);

// End Round Key XOR Operation
assign round_end[10] = sr_output[9] ^ round_keys[1280:1407];
// END OF FINAL ROUND

// ASSIGN OUTPUT
assign aes_output = round_end[10];
endmodule

`timescale 1ns / 1ps

//by Yuxiang

module inv_MixColumns(
    input clk,                     // Clock signal
    input [127:0] state_in,        // Input state (128 bits)
    output reg [127:0] state_out,  // Output state (128 bits)
    input reset                    // Asynchronous reset
);

// Define matrix sizes
wire [7:0] result_matrix [3:0][3:0][3:0]; // Temporary storage for intermediate values

PolyMult u1(.a(8'h0E), .b(state_in[127-:8]), .ab(result_matrix[0][0][0]));
PolyMult u2(.a(8'h0B), .b(state_in[119-:8]), .ab(result_matrix[0][0][1]));
PolyMult u3(.a(8'h0D), .b(state_in[111-:8]), .ab(result_matrix[0][0][2]));
PolyMult u4(.a(8'h09), .b(state_in[103-:8]), .ab(result_matrix[0][0][3]));
PolyMult u5(.a(8'h09), .b(state_in[127-:8]), .ab(result_matrix[0][1][0]));
PolyMult u6(.a(8'h0E), .b(state_in[119-:8]), .ab(result_matrix[0][1][1]));
PolyMult u7(.a(8'h0B), .b(state_in[111-:8]), .ab(result_matrix[0][1][2]));
PolyMult u8(.a(8'h0D), .b(state_in[103-:8]), .ab(result_matrix[0][1][3]));
PolyMult u9(.a(8'h0D), .b(state_in[127-:8]), .ab(result_matrix[0][2][0]));
PolyMult u0(.a(8'h09), .b(state_in[119-:8]), .ab(result_matrix[0][2][1]));
PolyMult ua(.a(8'h0E), .b(state_in[111-:8]), .ab(result_matrix[0][2][2]));
PolyMult ub(.a(8'h0B), .b(state_in[103-:8]), .ab(result_matrix[0][2][3]));
PolyMult uc(.a(8'h0B), .b(state_in[127-:8]), .ab(result_matrix[0][3][0]));
PolyMult ud(.a(8'h0D), .b(state_in[119-:8]), .ab(result_matrix[0][3][1]));
PolyMult ue(.a(8'h09), .b(state_in[111-:8]), .ab(result_matrix[0][3][2]));
PolyMult uf(.a(8'h0E), .b(state_in[103-:8]), .ab(result_matrix[0][3][3]));
PolyMult v1(.a(8'h0E), .b(state_in[95-:8]), .ab(result_matrix[1][0][0]));
PolyMult v2(.a(8'h0B), .b(state_in[87-:8]), .ab(result_matrix[1][0][1]));
PolyMult v3(.a(8'h0D), .b(state_in[79-:8]), .ab(result_matrix[1][0][2]));
PolyMult v4(.a(8'h09), .b(state_in[71-:8]), .ab(result_matrix[1][0][3]));
PolyMult v5(.a(8'h09), .b(state_in[95-:8]), .ab(result_matrix[1][1][0]));
PolyMult v6(.a(8'h0E), .b(state_in[87-:8]), .ab(result_matrix[1][1][1]));
PolyMult v7(.a(8'h0B), .b(state_in[79-:8]), .ab(result_matrix[1][1][2]));
PolyMult v8(.a(8'h0D), .b(state_in[71-:8]), .ab(result_matrix[1][1][3]));
PolyMult v9(.a(8'h0D), .b(state_in[95-:8]), .ab(result_matrix[1][2][0]));
PolyMult v0(.a(8'h09), .b(state_in[87-:8]), .ab(result_matrix[1][2][1]));
PolyMult va(.a(8'h0E), .b(state_in[79-:8]), .ab(result_matrix[1][2][2]));
PolyMult vb(.a(8'h0B), .b(state_in[71-:8]), .ab(result_matrix[1][2][3]));
PolyMult vc(.a(8'h0B), .b(state_in[95-:8]), .ab(result_matrix[1][3][0]));
PolyMult vd(.a(8'h0D), .b(state_in[87-:8]), .ab(result_matrix[1][3][1]));
PolyMult ve(.a(8'h09), .b(state_in[79-:8]), .ab(result_matrix[1][3][2]));
PolyMult vf(.a(8'h0E), .b(state_in[71-:8]), .ab(result_matrix[1][3][3]));
PolyMult w1(.a(8'h0E), .b(state_in[63-:8]), .ab(result_matrix[2][0][0]));
PolyMult w2(.a(8'h0B), .b(state_in[55-:8]), .ab(result_matrix[2][0][1]));
PolyMult w3(.a(8'h0D), .b(state_in[47-:8]), .ab(result_matrix[2][0][2]));
PolyMult w4(.a(8'h09), .b(state_in[39-:8]), .ab(result_matrix[2][0][3]));
PolyMult w5(.a(8'h09), .b(state_in[63-:8]), .ab(result_matrix[2][1][0]));
PolyMult w6(.a(8'h0E), .b(state_in[55-:8]), .ab(result_matrix[2][1][1]));
PolyMult w7(.a(8'h0B), .b(state_in[47-:8]), .ab(result_matrix[2][1][2]));
PolyMult w8(.a(8'h0D), .b(state_in[39-:8]), .ab(result_matrix[2][1][3]));
PolyMult w9(.a(8'h0D), .b(state_in[63-:8]), .ab(result_matrix[2][2][0]));
PolyMult w0(.a(8'h09), .b(state_in[55-:8]), .ab(result_matrix[2][2][1]));
PolyMult wa(.a(8'h0E), .b(state_in[47-:8]), .ab(result_matrix[2][2][2]));
PolyMult wb(.a(8'h0B), .b(state_in[39-:8]), .ab(result_matrix[2][2][3]));
PolyMult wc(.a(8'h0B), .b(state_in[63-:8]), .ab(result_matrix[2][3][0]));
PolyMult wd(.a(8'h0D), .b(state_in[55-:8]), .ab(result_matrix[2][3][1]));
PolyMult we(.a(8'h09), .b(state_in[47-:8]), .ab(result_matrix[2][3][2]));
PolyMult wf(.a(8'h0E), .b(state_in[39-:8]), .ab(result_matrix[2][3][3]));
PolyMult x1(.a(8'h0E), .b(state_in[31-:8]), .ab(result_matrix[3][0][0]));
PolyMult x2(.a(8'h0B), .b(state_in[23-:8]), .ab(result_matrix[3][0][1]));
PolyMult x3(.a(8'h0D), .b(state_in[15-:8]), .ab(result_matrix[3][0][2]));
PolyMult x4(.a(8'h09), .b(state_in[7-:8]), .ab(result_matrix[3][0][3]));
PolyMult x5(.a(8'h09), .b(state_in[31-:8]), .ab(result_matrix[3][1][0]));
PolyMult x6(.a(8'h0E), .b(state_in[23-:8]), .ab(result_matrix[3][1][1]));
PolyMult x7(.a(8'h0B), .b(state_in[15-:8]), .ab(result_matrix[3][1][2]));
PolyMult x8(.a(8'h0D), .b(state_in[7-:8]), .ab(result_matrix[3][1][3]));
PolyMult x9(.a(8'h0D), .b(state_in[31-:8]), .ab(result_matrix[3][2][0]));
PolyMult x0(.a(8'h09), .b(state_in[23-:8]), .ab(result_matrix[3][2][1]));
PolyMult xa(.a(8'h0E), .b(state_in[15-:8]), .ab(result_matrix[3][2][2]));
PolyMult xb(.a(8'h0B), .b(state_in[7-:8]), .ab(result_matrix[3][2][3]));
PolyMult xc(.a(8'h0B), .b(state_in[31-:8]), .ab(result_matrix[3][3][0]));
PolyMult xd(.a(8'h0D), .b(state_in[23-:8]), .ab(result_matrix[3][3][1]));
PolyMult xe(.a(8'h09), .b(state_in[15-:8]), .ab(result_matrix[3][3][2]));
PolyMult xf(.a(8'h0E), .b(state_in[7-:8]), .ab(result_matrix[3][3][3]));

// Initialize matrices on reset
always @(posedge clk) begin
    if (reset) begin
        // Reset logic
        state_out <= 0;
    end 
    else begin
        state_out[127:120] <= result_matrix[0][0][0] ^ result_matrix[0][0][1] ^ result_matrix[0][0][2] ^ result_matrix[0][0][3];
        state_out[119:112] <= result_matrix[0][1][0] ^ result_matrix[0][1][1] ^ result_matrix[0][1][2] ^ result_matrix[0][1][3];
        state_out[111:104] <= result_matrix[0][2][0] ^ result_matrix[0][2][1] ^ result_matrix[0][2][2] ^ result_matrix[0][2][3];
        state_out[103:96]  <= result_matrix[0][3][0] ^ result_matrix[0][3][1] ^ result_matrix[0][3][2] ^ result_matrix[0][3][3];

        state_out[95:88]   <= result_matrix[1][0][0] ^ result_matrix[1][0][1] ^ result_matrix[1][0][2] ^ result_matrix[1][0][3];
        state_out[87:80]   <= result_matrix[1][1][0] ^ result_matrix[1][1][1] ^ result_matrix[1][1][2] ^ result_matrix[1][1][3];
        state_out[79:72]   <= result_matrix[1][2][0] ^ result_matrix[1][2][1] ^ result_matrix[1][2][2] ^ result_matrix[1][2][3];
        state_out[71:64]   <= result_matrix[1][3][0] ^ result_matrix[1][3][1] ^ result_matrix[1][3][2] ^ result_matrix[1][3][3];

        state_out[63:56]   <= result_matrix[2][0][0] ^ result_matrix[2][0][1] ^ result_matrix[2][0][2] ^ result_matrix[2][0][3];
        state_out[55:48]   <= result_matrix[2][1][0] ^ result_matrix[2][1][1] ^ result_matrix[2][1][2] ^ result_matrix[2][1][3];
        state_out[47:40]   <= result_matrix[2][2][0] ^ result_matrix[2][2][1] ^ result_matrix[2][2][2] ^ result_matrix[2][2][3];
        state_out[39:32]   <= result_matrix[2][3][0] ^ result_matrix[2][3][1] ^ result_matrix[2][3][2] ^ result_matrix[2][3][3];

        state_out[31:24]   <= result_matrix[3][0][0] ^ result_matrix[3][0][1] ^ result_matrix[3][0][2] ^ result_matrix[3][0][3];
        state_out[23:16]   <= result_matrix[3][1][0] ^ result_matrix[3][1][1] ^ result_matrix[3][1][2] ^ result_matrix[3][1][3];
        state_out[15:8]    <= result_matrix[3][2][0] ^ result_matrix[3][2][1] ^ result_matrix[3][2][2] ^ result_matrix[3][2][3];
        state_out[7:0]     <= result_matrix[3][3][0] ^ result_matrix[3][3][1] ^ result_matrix[3][3][2] ^ result_matrix[3][3][3];
    end
        
end
endmodule


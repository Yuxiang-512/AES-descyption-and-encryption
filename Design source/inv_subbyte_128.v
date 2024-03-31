`timescale 1ns / 1ps

// SUBBYTE WORKING WITH 128BIT INPUTS
module inv_subbytes_128(
    input wire [127:0] sb_input, 
    output wire [127:0] sb_output
);

wire [7:0] bits [15:0];

genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin
        reverse_SubBytes pb (
            .matrix_in(sb_input[i*8 +: 8]), // Selects 8 bits from the input
            .matrix_out(bits[i]) // Connects to the corresponding output wire
        );
    end
endgenerate

assign sb_output = {bits[15], bits[14], bits[13], bits[12],
                    bits[11], bits[10], bits[9], bits[8],
                    bits[7], bits[6], bits[5], bits[4],
                    bits[3], bits[2], bits[1], bits[0]};
endmodule

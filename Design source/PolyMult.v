module PolyMult(
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] ab
);

    // ???????? (x^8 + x^4 + x^3 + x + 1)
    parameter MOD_POL = 9'b1_0001_1011;
    
    reg [15:0] p;
    integer i;

    always @(a, b) begin
        ab = 8'b0;
        p = 0;

        // ?????
        for (i = 0; i < 8; i = i + 1) begin
            if (b[i]) begin
                p = p ^ (a << i);
            end
        end

        // ?2?? (???????)
        for (i = 15; i >= 8; i = i - 1) begin
            if (p[i]) begin
                p = p ^ (MOD_POL << (i - 8));
            end
        end

        ab = p[7:0];
    end
endmodule

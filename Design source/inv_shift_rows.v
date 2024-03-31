`timescale 1ns / 1ps

module inv_shift_rows(
	input clock, reset,
	input wire [0:127] State_Out,
	output reg [0:127] Inv_State_Out);

always @(posedge clock) begin
    if (reset) begin
        Inv_State_Out = 128'h0;
	end
    else begin
        Inv_State_Out[0 +:8] <= State_Out[0 +:8];
        Inv_State_Out[32+:8] <= State_Out[32+:8];
        Inv_State_Out[64+:8] <= State_Out[64+:8];
        Inv_State_Out[96+:8] <= State_Out[96+:8];
    
        Inv_State_Out[8  +:8] <= State_Out[104+:8];
        Inv_State_Out[40 +:8] <= State_Out[8  +:8];
        Inv_State_Out[72 +:8] <= State_Out[40 +:8];
        Inv_State_Out[104+:8] <= State_Out[72 +:8];

        Inv_State_Out[16 +:8] <= State_Out[80 +:8];
        Inv_State_Out[48 +:8] <= State_Out[112+:8];
        Inv_State_Out[80 +:8] <= State_Out[16 +:8];
        Inv_State_Out[112+:8] <= State_Out[48 +:8];
    
        Inv_State_Out[24 +:8] <= State_Out[56 +:8];
        Inv_State_Out[56 +:8] <= State_Out[88 +:8];
        Inv_State_Out[88 +:8] <= State_Out[120+:8];
        Inv_State_Out[120+:8] <= State_Out[24 +:8];   
    end
end
endmodule
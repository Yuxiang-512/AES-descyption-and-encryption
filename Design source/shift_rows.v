`timescale 1ns / 1ps

module shift_rows(
	input clock, reset,
	input [0:127] State_In,
	output reg [0:127] State_Out
	);
	
always @(posedge clock) begin
    if (reset) begin
        State_Out = 128'h0;
    end
    else  begin
        State_Out[0   +:8] <= State_In[0   +:8];
        State_Out[32  +:8] <= State_In[32  +:8];
        State_Out[64  +:8] <= State_In[64  +:8];
        State_Out[96  +:8] <= State_In[96  +:8];
        State_Out[8   +:8] <= State_In[40  +:8];
        State_Out[40  +:8] <= State_In[72  +:8];
        State_Out[72  +:8] <= State_In[104 +:8];
        State_Out[104 +:8] <= State_In[8   +:8];
        State_Out[16  +:8] <= State_In[80  +:8];
        State_Out[48  +:8] <= State_In[112 +:8];
        State_Out[80  +:8] <= State_In[16  +:8];
        State_Out[112 +:8] <= State_In[48  +:8];
        State_Out[24  +:8] <= State_In[120 +:8];
        State_Out[56  +:8] <= State_In[24  +:8];
        State_Out[88  +:8] <= State_In[56  +:8];
        State_Out[120 +:8] <= State_In[88  +:8];
    end
end	   
  
endmodule
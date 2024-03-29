// D flip flop

module dflipflop(q,d,clk,reset);
output q;
input d,clk,reset;
reg q;
always@(posedge reset or negedge clk)
if(reset)
q<=1'b0;
else
q<=d;
endmodule


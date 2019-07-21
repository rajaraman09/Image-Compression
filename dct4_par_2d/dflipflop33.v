// D flip flop

module dflipflop33(q,d,clk,reset);
output [32:0] q;
input [32:0] d;
input clk,reset;
reg q;
always@(posedge clk)
if(reset)
q<=33'b0;
else
q<=d;
endmodule


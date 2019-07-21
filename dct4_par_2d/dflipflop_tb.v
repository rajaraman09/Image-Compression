//test bench for 4 point forward dct

`include "dflipflop.v"

module dflipflop_tb;

wire q;
reg d,clk,reset;

dflipflop dfd(q,d,clk,reset);

initial
begin

reset=1'b0;
d=1'b1;
clk=1'b0;

#2
d=1'b0;

#2
d=1'b1;

#2
d=1'b1;

#2
d=1'b0;

end

always
begin
#1 clk=~clk;
end

always 
begin
#30 $finish;
end 

initial
$monitor($time,"q=%b",q);

endmodule

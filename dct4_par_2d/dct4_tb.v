//test bench for 4 point forward dct

`include "dct_4.v"

module dct4_tb;

reg x0s,x1s,x2s,x3s;//input ports
reg [7:0] x0e,x1e,x2e,x3e;
reg [23:0] x0,x1,x2,x3; 

wire y0s,y1s,y2s,y3s;//output ports
wire [7:0] y0e,y1e,y2e,y3e;
wire [23:0] y0,y1,y2,y3;

dct_4 dfd(x0s,x1s,x2s,x3s,x0e,x1e,x2e,x3e,x0,x1,x2,x3,
y0s,y1s,y2s,y3s,y0e,y1e,y2e,y3e,y0,y1,y2,y3);

initial
begin

x0s=1'b0;//2.5
x0e=8'b10000000;
x0=24'b101000000000000000000000;

x1s=1'b1;//4
x1e=8'b10000001;
x1=24'b100000000000000000000000;

x2s=1'b0;//5.6
x2e=8'b10000001;
x2=24'b101100110011001100110011;

x3s=1'b0;//7
x3e=8'b10000001;
x3=24'b111000000000000000000000;

end

initial
$monitor($time,"y0s=%b,y0e=%b,y0=%b,y1s=%b,y1e=%b,y1=%b,y2s=%b,y2e=%b,y2=%b,y3s=%b,y3e=%b,y3=%b",y0s,y0e,y0,y1s,y1e,y1,y2s,y2e,y2,y3s,y3e,y3);

endmodule

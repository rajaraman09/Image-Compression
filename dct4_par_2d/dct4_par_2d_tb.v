`include "dct4_par_2d.v"

module dct4_par_2d_tb;

reg x0s,x1s,x2s,x3s;//input ports
reg [7:0] x0e,x1e,x2e,x3e;
reg [23:0] x0,x1,x2,x3; 

wire y0s,y1s,y2s,y3s;//output ports
wire [7:0] y0e,y1e,y2e,y3e;
wire [23:0] y0,y1,y2,y3;

output yy0s,yy1s,yy2s,yy3s;//output from 1D-DCT
output [7:0] yy0e,yy1e,yy2e,yy3e;
output [23:0] yy0,yy1,yy2,yy3; 

wire yy0s,yy1s,yy2s,yy3s;//output from 1D-DCT
wire [7:0] yy0e,yy1e,yy2e,yy3e;
wire [23:0] yy0,yy1,yy2,yy3;

reg clk,reset;
wire [32:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,ry1,ry2,ry3,ry4,ry5,ry6,ry7,ry8,ry9,ry10,ry11,ry12,m1,m2,m3,m4;

dct4_par_2d fd(x0s,x1s,x2s,x3s,x0e,x1e,x2e,x3e,x0,x1,x2,x3,               y0s,y1s,y2s,y3s,y0e,y1e,y2e,y3e,y0,y1,y2,y3,clk,reset,
yy0s,yy1s,yy2s,yy3s,yy0e,yy1e,yy2e,yy3e,yy0,yy1,yy2,yy3

);

initial
begin

reset=1'b1;
clk=1'b0;

#2
reset=1'b0;

x0s=1'b0;//2 //first row input values
x0e=8'b10000000;
x0=24'b100000000000000000000000;

x1s=1'b0;//4
x1e=8'b10000001;
x1=24'b100000000000000000000000;

x2s=1'b0;//5
x2e=8'b10000001;
x2=24'b101000000000000000000000;

x3s=1'b0;//7
x3e=8'b10000001;
x3=24'b111000000000000000000000;

#2
//in=1'b0;
x0s=1'b0;//2 //first row input values
x0e=8'b10000000;
x0=24'b100000000000000000000000;

x1s=1'b0;//4
x1e=8'b10000001;
x1=24'b100000000000000000000000;

x2s=1'b0;//5
x2e=8'b10000001;
x2=24'b101000000000000000000000;

x3s=1'b0;//7
x3e=8'b10000001;
x3=24'b111000000000000000000000;

#2 //third row input values

x0s=1'b0;//2 //first row input values
x0e=8'b10000000;
x0=24'b100000000000000000000000;

x1s=1'b0;//2
x1e=8'b10000000;
x1=24'b100000000000000000000000;

x2s=1'b0;//5
x2e=8'b10000001;
x2=24'b101000000000000000000000;

x3s=1'b0;//7
x3e=8'b10000001;
x3=24'b111000000000000000000000;

#2 //fourth row input values

x0s=1'b0;//2 //first row input values
x0e=8'b10000000;
x0=24'b100000000000000000000000;

x1s=1'b0;//2
x1e=8'b10000000;
x1=24'b100000000000000000000000;

x2s=1'b0;//5
x2e=8'b10000001;
x2=24'b101000000000000000000000;

x3s=1'b0;//7
x3e=8'b10000001;
x3=24'b111000000000000000000000;



end
always
begin
#1 clk=~clk;
end

always 
begin
#15 $finish;
end 

initial
$monitor($time,"y0s=%b,y0e=%b,y0=%b,y1s=%b,y1e=%b,y1=%b,y2s=%b,y2e=%b,y2=%b,y3s=%b,y3e=%b,y3=%b",y0s,y0e,y0,y1s,y1e,y1,y2s,y2e,y2,y3s,y3e,y3);


//$monitor($time,"yy0s=%b,yy0e=%b,yy0=%b,yy1s=%b,yy1e=%b,yy1=%b,yy2s=%b,yy2e=%b,yy2=%b,yy3s=%b,yy3e=%b,yy3=%b",yy0s,yy0e,yy0,yy1s,yy1e,yy1,yy2s,yy2e,yy2,yy3s,yy3e,yy3);

endmodule





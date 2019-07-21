
`include "mux2_33.v"
`include "mux4_33.v"
`include "dct_4.v"
`include "float_adder.v"
`include "wallacer2.v"
`include "recurse.v"
`include "recurse40.v"
`include "recurse8.v"
`include "recursive_stage1.v"
`include "kgp.v"
`include "kgp_carry.v"
`include "fulladd.v"
`include "halfadd.v"
`include "dflipflop33.v"



module dct4_par_2d(x0s,x1s,x2s,x3s,x0e,x1e,x2e,x3e,x0,x1,x2,x3,               y0s,y1s,y2s,y3s,y0e,y1e,y2e,y3e,y0,y1,y2,y3,clk,reset,
yy0s,yy1s,yy2s,yy3s,yy0e,yy1e,yy2e,yy3e,yy0,yy1,yy2,yy3);

input x0s,x1s,x2s,x3s;//input ports
input [7:0] x0e,x1e,x2e,x3e;
input [23:0] x0,x1,x2,x3; 

output y0s,y1s,y2s,y3s;//output ports
output [7:0] y0e,y1e,y2e,y3e;
output [23:0] y0,y1,y2,y3;

output yy0s,yy1s,yy2s,yy3s;//output from 1D-DCT
output [7:0] yy0e,yy1e,yy2e,yy3e;
output [23:0] yy0,yy1,yy2,yy3; 

input clk,reset;


wire y0s,y1s,y2s,y3s;//output ports 
wire [7:0] y0e,y1e,y2e,y3e;
wire [23:0] y0,y1,y2,y3;
wire [32:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,ry1,ry2,ry3,ry4,ry5,ry6,ry7,ry8,ry9,ry10,ry11,ry12,m1,m2,m3,m4;

dct_4 dct1(x0s,x1s,x2s,x3s,x0e,x1e,x2e,x3e,x0,x1,x2,x3,
yy0s,yy1s,yy2s,yy3s,yy0e,yy1e,yy2e,yy3e,yy0,yy1,yy2,yy3);

dflipflop33 d1(d,{yy0s,yy0e,yy0},clk,reset);
dflipflop33 d2(c,d,clk,reset);
dflipflop33 d3(b,c,clk,reset);
dflipflop33 d4(a,b,clk,reset);
dflipflop33 d5(ry1,a,clk,reset);
dflipflop33 d6(ry2,ry1,clk,reset);
dflipflop33 d7(ry3,ry2,clk,reset);

dflipflop33 d8(ry4,{yy1s,yy1e,yy1},clk,reset);
dflipflop33 d9(h,ry4,clk,reset);
dflipflop33 d10(g,h,clk,reset);
dflipflop33 d11(f,g,clk,reset);
dflipflop33 d12(e,f,clk,reset);
dflipflop33 d13(ry5,e,clk,reset);
dflipflop33 d14(ry6,ry5,clk,reset);

dflipflop33 d15(ry7,{yy2s,yy2e,yy2},clk,reset);
dflipflop33 d16(ry8,ry7,clk,reset);
dflipflop33 d17(l,ry8,clk,reset);
dflipflop33 d18(k,l,clk,reset);
dflipflop33 d19(j,k,clk,reset);
dflipflop33 d20(i,j,clk,reset);
dflipflop33 d21(ry9,i,clk,reset);

dflipflop33 d22(ry10,{yy3s,yy3e,yy3},clk,reset);
dflipflop33 d23(ry11,ry10,clk,reset);
dflipflop33 d24(ry12,ry11,clk,reset);
dflipflop33 d25(p,ry12,clk,reset);
dflipflop33 d26(o,p,clk,reset);
dflipflop33 d27(n,o,clk,reset);
dflipflop33 d28(m,n,clk,reset);

reg [1:0] s;
always@(posedge clk)
	begin
		if(reset==1'b1)
			s<=2'b00;
		else
			s<=s+1'b1;
	end


mux4_33 m4_0(m1,a,e,i,m,s);
mux4_33 m4_1(m2,b,f,j,n,s);
mux4_33 m4_2(m3,c,g,k,o,s);
mux4_33 m4_3(m4,d,h,l,p,s);

dct_4 dct2(m1[32],m2[32],m3[32],m4[32],m1[31:24],m2[31:24],m3[31:24],m4[31:24],m1[23:0],m2[23:0],m3[23:0],m4[23:0],
y0s,y1s,y2s,y3s,y0e,y1e,y2e,y3e,y0,y1,y2,y3);

endmodule

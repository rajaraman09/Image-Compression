//4-point forward dct

//`include "float_adder.v"
//`include "wallacer2.v"

module dct_4(x0s,x1s,x2s,x3s,x0e,x1e,x2e,x3e,x0,x1,x2,x3,
y0s,y1s,y2s,y3s,y0e,y1e,y2e,y3e,y0,y1,y2,y3);

input x0s,x1s,x2s,x3s;//input ports
input [7:0] x0e,x1e,x2e,x3e;
input [23:0] x0,x1,x2,x3; 

output y0s,y1s,y2s,y3s;//output ports
output [7:0] y0e,y1e,y2e,y3e;
output [23:0] y0,y1,y2,y3; 

wire y0s,y1s,y2s,y3s;//output ports
wire [7:0] y0e,y1e,y2e,y3e;
wire [23:0] y0,y1,y2,y3; 

wire [32:0] d0,d1,d2,d3,d4,d5,d6,d7,d8;

float_adder fa1(x0s,x0e,x0,x3s,x3e,x3,d0[32],d0[31:24],d0[23:0]);
float_adder fa2(x0s,x0e,x0,(~x3s),x3e,x3,d1[32],d1[31:24],d1[23:0]);
float_adder fa3(x1s,x1e,x1,(~x2s),x2e,x2,d2[32],d2[31:24],d2[23:0]);
float_adder fa4(x1s,x1e,x1,x2s,x2e,x2,d3[32],d3[31:24],d3[23:0]);

float_adder  w1(d0[32],d0[31:24],d0[23:0],d3[32],d3[31:24],d3[23:0],y0s,y0e,y0);

wallacer2 w2(d1[32],d1[31:24],d1[23:0],1'b0,8'b01111110,24'b111011001000010010110101,d4[32],d4[31:24],d4[23:0]);//*with 0.9239
wallacer2 w3(d2[32],d2[31:24],d2[23:0],1'b0,8'b01111101,24'b110000111111000101000001,d5[32],d5[31:24],d5[23:0]);//*with 0.3827
float_adder fa5(d4[32],d4[31:24],d4[23:0],d5[32],d5[31:24],d5[23:0],y1s,y1e,y1);

float_adder fa6(d0[32],d0[31:24],d0[23:0],(~d3[32]),d3[31:24],d3[23:0],d6[32],d6[31:24],d6[23:0]);
wallacer2 w4(d6[32],d6[31:24],d6[23:0],1'b0,8'b01111110,24'b101101001111110111110011,y2s,y2e,y2);//*with 0.707

wallacer2 w5(d1[32],d1[31:24],d1[23:0],1'b0,8'b01111101,24'b110000111111000101000001,d7[32],d7[31:24],d7[23:0]);//*with 0.3827
wallacer2 w6(d2[32],d2[31:24],d2[23:0],1'b0,8'b01111110,24'b111011001000010010110101,d8[32],d8[31:24],d8[23:0]);//*with 0.9239
float_adder fa7(d7[32],d7[31:24],d7[23:0],(~d8[32]),d8[31:24],d8[23:0],y3s,y3e,y3);


/*wire p0s;
wire [7:0] p0e;
wire [23:0] p0;

assign p0s=d2[32];
assign p0e=d2[31:24];
assign p0=d2[23:0];*/

endmodule

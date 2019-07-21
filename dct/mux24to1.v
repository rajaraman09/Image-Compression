//mux24t01
//`include "mux4to1.v"

module mux24to1(out,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,s4,s3,s2,s1,s0);
input i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,s4,s3,s2,s1,s0;
output out;

//reg out;
//always@(i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7 or i8 or i9 or i10 or i11 or i12 or i13 or i14 or i15 or i16 or i17 or i18 or i19 or i20 or i21 or i22 or i23 or s4 or s3 or s2 or s1 or s0)
//begin 
//case({s4,s3,s2,s1,s0})
//5'b00000: out = i0;
//5'b00001: out = i1;
//5'b00010: out = i2;
//5'b00011: out = i3;
//5'b00100: out = i4;
//5'b00101: out = i5;
//5'b00110: out = i6;
//5'b00111: out = i7;
//5'b01000: out = i8;
//5'b01001: out = i9;
//5'b01010: out = i10;
//5'b01011: out = i11;
//5'b01100: out = i12;
//5'b01101: out = i13;
//5'b01110: out = i14;
//5'b01111: out = i15;
//5'b10000: out = i16;
//5'b10001: out = i17;
//5'b10010: out = i18;
//5'b10011: out = i19;
//5'b10100: out = i20;
//5'b10101: out = i21;
//5'b10110: out = i22;
//5'b10111: out = i23;
//default: out = 1'bx;
//endcase
//end 

wire y1,y2,y3,y4,y5,y6,y7,out;
wire [1:0] t1,t2,t3;
assign t1={s1,s0};
assign t2={s3,s2};
assign t3={s4,s2};

mux4to1 m1(i3,i2,i1,i0,y1,t1);
mux4to1 m2(i7,i6,i5,i4,y2,t1);
mux4to1 m3(i19,i18,i17,i16,y3,t1);
mux4to1 m4(i23,i22,i21,i20,y4,t1);
mux4to1 m5(i11,i10,i9,i8,y6,t1);
mux4to1 m6(i15,i14,i13,i12,y7,t1);
mux4to1 m7(y4,y3,y2,y1,y5,t3);
mux4to1 m8(y7,y6,y5,y5,out,t2);

endmodule


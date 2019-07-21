//mux48to1

//`include "mux4to1.v"

module mux48to1(out,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i40,i41,i42,i43,i44,i45,i46,i47,s7,s6,s5,s4,s3,s2,s1,s0);
input i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i34,i33,i35,i36,i37,i38,i39,i40,i41,i42,i43,i44,i45,i46,i47,s7,s6,s5,s4,s3,s2,s1,s0;
output out;

/*reg out;
always@(i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7 or i8 or i9 or i10 or i11 or i12 or i13 or i14 or i15 or i16 or i17 or i18 or i19 or i20 or i21 or i22 or i23 or i24 or i25 or i26 or i27 or i28 or i29 or i30 or i31 or i32 or i33 or i34 or i35 or i36 or i37 or i38 or i39 or i40 or i41 or i42 or i43 or i44 or i45 or i46 or i47 or s7 or s6 or s5 or s4 or s3 or s2 or s1 or s0)
begin 
case({s7,s6,s5,s4,s3,s2,s1,s0})
8'b00000000: out = i0;
8'b00000001: out = i1;
8'b00000010: out = i2;
8'b00000011: out = i3;
8'b00000100: out = i4;
8'b00000101: out = i5;
8'b00000110: out = i6;
8'b00000111: out = i7;
8'b00001000: out = i8;
8'b00001001: out = i9;
8'b00001010: out = i10;
8'b00001011: out = i11;
8'b00001100: out = i12;
8'b00001101: out = i13;
8'b00001110: out = i14;
8'b00001111: out = i15;
8'b00010000: out = i16;
8'b00010001: out = i17;
8'b00010010: out = i18;
8'b00010011: out = i19;
8'b00010100: out = i20;
8'b00010101: out = i21;
8'b00010110: out = i22;
8'b00010111: out = i23;
8'b00011000: out = i24;
8'b00011001: out = i25;
8'b00011010: out = i26;
8'b00011011: out = i27;
8'b00011100: out = i28;
8'b00011101: out = i29;
8'b00011110: out = i30;
8'b00011111: out = i31;
8'b00100000: out = i32;
8'b00100001: out = i33;
8'b00100010: out = i34;
8'b00100011: out = i35;
8'b00100100: out = i36;
8'b00100101: out = i37;
8'b00100110: out = i38;
8'b00100111: out = i39;
8'b00101000: out = i40;
8'b00101001: out = i41;
8'b00101010: out = i42;
8'b00101011: out = i43;
8'b00101100: out = i44;
8'b00101101: out = i45;
8'b00101110: out = i46;
8'b00101111: out = i47;

default: out = 1'bx;
endcase
end */

wire out;
wire o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,a;
assign a=1'b0;
wire [1:0] t1,t2,t3;
assign t1={s1,s0};
assign t2={s3,s2};
assign t3={s5,s4};

mux4to1 m01(i3,i2,i1,i0,o1,t1);
mux4to1 m02(i7,i6,i5,i4,o2,t1);
mux4to1 m03(i11,i10,i9,i8,o3,t1);
mux4to1 m04(i15,i14,i13,i12,o4,t1);
mux4to1 m05(i19,i18,i17,i16,o5,t1);
mux4to1 m06(i23,i22,i21,i20,o6,t1);
mux4to1 m07(i27,i26,i25,i24,o7,t1);
mux4to1 m08(i31,i30,i29,i28,o8,t1);
mux4to1 m09(i35,i34,i33,i32,o9,t1);
mux4to1 m10(i39,i38,i37,i36,o10,t1);
mux4to1 m11(i43,i42,i41,i40,o11,t1);
mux4to1 m12(i47,i46,i45,i44,o12,t1);
mux4to1 m13(o4,o3,o2,o1,o13,t2);
mux4to1 m14(o8,o7,o6,o5,o14,t2);
mux4to1 m15(o12,o11,o10,o9,o15,t2);
mux4to1 m16(a,o15,o14,o13,out,t3);

endmodule





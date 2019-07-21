//mux4to1

module mux4to1(in0,in1,in2,in3,y,sel);

input in0,in1,in2,in3;
input [1:0] sel;
output y;

reg y;
always@(in0 or in1 or in2 or in3 or sel)
begin
case(sel)
2'b00:y=in3;  
2'b01:y=in2;
2'b10:y=in1;	
2'b11:y=in0;  
//default:y=1'bx;
endcase   
end

/*wire a,b,c,d,s0,s1,e,f,g,h,y;
assign s0=~sel[0];
assign s1=~sel[1];
assign a=s0&s1;
assign b=s1&sel[0];
assign c=sel[1]&s0;
assign d=sel[1]&sel[0];
assign e=a&in3;
assign f=b&in2;
assign g=c&in1;
assign h=d&in0;
assign y=e|f|g|h;*/

endmodule

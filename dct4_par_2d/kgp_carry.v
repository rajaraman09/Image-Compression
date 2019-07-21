
module kgp_carry(a,b,carry);

input [1:0] a,b;
output carry;
//reg carry;

//always@(a or b)
//begin
//case(a)
//2'b00:carry=1'b0;  
//2'b11:carry=1'b1;
//2'b01:carry=b[0];
//2'b10:carry=b[0];
//default:carry=1'bx;
//endcase
//end

wire carry;

wire f,g;
assign g=a[0] & a[1];
assign f=a[0] ^ a[1];

assign carry=g|(b[0] & f);

endmodule

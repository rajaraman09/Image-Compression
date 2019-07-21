// Full Adder Module
module fulladd(sum, carry, x,y,z);

output sum,carry;
input x,y,z;

wire w;	
	assign 	 w = x ^ y;
        assign	 sum = w ^ z;
	assign 	 carry = (x & y)|(w & z);
endmodule

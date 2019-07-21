
// half Adder Module
module halfadd(sum, carry, x,y);

output sum,carry;
input x,y;

	assign	 sum = x ^ y;
	assign 	 carry = x & y;
	
endmodule

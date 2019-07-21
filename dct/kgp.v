//kgp

module kgp(a,b,y);

input a,b;
output [1:0] y;
//reg [1:0] y;

//always@(a or b)
//begin
//case({a,b})
//2'b00:y=2'b00;  //kill
//2'b11:y=2'b11;	  //generate
//2'b01:y=2'b01;	//propagate
//2'b10:y=2'b01;  //propagate
//endcase   //y[1]=ab  y[0]=a+b  
//end

assign y[0]=a | b;
assign y[1]=a & b;

endmodule

//single precision floating point adder

/*`include "recurse8.v"
`include "recurse.v"
`include "kgp.v"
`include "kgp_carry.v"
`include "recursive_stage1.v"*/

module float_adder(nps3,npe3,np3,nps4,npe4,np4,is,ie,i);

input nps3,nps4;
input [7:0] npe3,npe4;
input [23:0] np3,np4;
output is;
output [7:0] ie;
output [23:0] i;

reg [7:0] s11,s22;
reg [23:0] oopnn,ooann;
reg [7:0] npee;

wire z11;
assign z11=nps3 ^ nps4;

always@(npe3 or npe4 or np3 or np4 or z11)
	begin
		if(npe3>npe4)
			begin
				s11=npe3-npe4;
				npee=npe3;
				s22=8'b000;
			end
		else if (npe3<npe4)
			begin
				s22=npe4-npe3;
				npee=npe4;
				s11=8'b00;
			end
		else if (z11==1'b1 && npe3==npe4 && np3==np4)
			begin
				npee=8'b00000000;
				s11=8'b00;
				s22=8'b00;
			end
		else if (npe3==npe4)
			begin
				npee=npe4;
				s11=8'b00;
				s22=8'b00;
			end		
	end

wire [23:0] ooo;
assign ooo=24'b000;	
wire [47:0] pp33,opp;

assign pp33[47:0]={np4[23:0],ooo[23:0]};

//barrel48 b211(opp,pp33,s11);	
assign opp=pp33>>s11;
wire i11;

wire [26:0] op11;
wire [23:0] op22;
assign i11= opp[21] | opp[20] | opp[19] | opp[18] | opp[17] | opp[16] | opp[15] | opp[14] | opp[13] | opp[12] | opp[11] | opp[10] | opp[9] | opp[8] | opp[7] | opp[6] | opp[5] | opp[4] | opp[3] | opp[2] | opp[1] | opp[0];
assign op11[26:0]={opp[47:22],i11};
assign op22[23:0]=op11[26:3];

wire [47:0] a11,oaa;

assign a11[47:0]={np3[23:0],ooo[23:0]};
//barrel48 b122(oaa,a11,s22); 
assign oaa=a11>>s22;
wire i22;

wire [26:0] oa11;
wire [23:0] oa22;
assign i22= oaa[21] | oaa[20] | oaa[19] | oaa[18] | oaa[17] | oaa[16] | oaa[15] | oaa[14] | oaa[13] | oaa[12] |oaa[11] | oaa[10] | oaa[9] | oaa[8] | oaa[7] | oaa[6] | oaa[5] | oaa[4] | oaa[3] | oaa[2] | oaa[1] | oaa[0];
assign oa11[26:0]={oaa[47:22],i22};
assign oa22[23:0]=oa11[26:3];

always@(op11 or op22)
	begin	
		if((op11[2]==1)&&(op11[1]==1))      //G=1,R=1,round up (add 1 to lsb)
			begin
				 oopnn=op22+1;			
			end
		else if(op11[2]==0)	//G=0 round down (no change)	
			begin
				 oopnn=op22;
			end
		else if((op11[2]==1) && (op11[1]==0) && (op11[0]==1))	//G=1,R=0,S=1,round up (add 1 to lsb)
			begin
				 oopnn=op22+1;
			end
		else if((op11[2]==1)&&(op11[1]==0)&&(op11[0]==0)&&(op11[3]==0)) //G=1,R=0,S=0,round to nearest even (leave it if lsb is 0)
			begin
				 oopnn=op22;
			end
		else if((op11[2]==1)&&(op11[1]==0)&&(op11[0]==0)&&(op11[3]==1)) //G=1,R=0,S=0,round to nearest even (add 1 to lsb if lsb is 1)
			begin
			 oopnn=op22+1;			
			end
	end
	
always@(oa11 or oa22)
	begin	
		if((oa11[2]==1)&&(oa11[1]==1))      //G=1,R=1,round up (add 1 to lsb)
			begin
				ooann=oa22+1;				
			end
		else if(oa11[2]==0)	//G=0, round down (no change)	
			begin
				 ooann=oa22;
			end
		else if((oa11[2]==1) && (oa11[1]==0) && (oa11[0]==1))	//G=1,R=0,S=1,round up (add 1 to lsb)
			begin
				 ooann=oa22+1;
			end
		else if((oa11[2]==1)&&(oa11[1]==0)&&(oa11[0]==0)&&(oa11[3]==0)) //G=1,R=0,S=0,round to nearest even (leave it if lsb is 0)
			begin
				 ooann=oa22;
			end
		else if((oa11[2]==1)&&(oa11[1]==0)&&(oa11[0]==0)&&(oa11[3]==1)) //G=1,R=0,S=0,round to nearest even (add 1 to lsb if lsb is 1)
			begin
				 ooann = oa22+1;				
			end
	end
//////////////////////	
	
wire [23:0] np2222,r11,r22;
assign np2222=(~oopnn)+1;
wire c11,c22;

///////////////////////////////////////////////////////////

wire c10,c20;
wire [31:0] r111,r222;

recurse c1(r111,c10,{8'b0,ooann},{8'b0,np2222});
recurse c2(r222,c20,{8'b0,ooann},{8'b0,oopnn});

assign r11=r111[23:0];
assign r22=r222[23:0];
assign c11=r111[24];
assign c22=r222[24];

/////////////////////////////////////////////////////////////

reg [23:0] pp11;
reg [7:0] pnee;
reg is;
always@(c11 or r11 or c22 or r22 or nps3 or np3 or np4 or nps4 or npe3 or npe4 or npee or z11)
	begin
	
	 if (c22==1 && z11==0 && np3!=24'b000 && np4!=24'b000)
		begin
			is=nps3;
			pnee=npee+1;
			pp11={c22,r22[23:1]};
		end
	else if (c22==0 && z11==0 && np3!=24'b000 && np4!=24'b000)   
		begin
			is=nps3;
			pnee=npee;
			pp11=r22;
		end			
	 else if (c11==0 && z11==1 && np3!=24'b000 && np4!=24'b000)
		begin
			is=(~nps3);
			pnee=npee;
			pp11=(~r11)+1;
		end
	else if (c11==1 && z11==1 && np3!=24'b000 && np4!=24'b000)
		begin
			is=nps3;
			pnee=npee;
			pp11=r11;
		end
	else if (np3!=24'b0000 && np4==24'b000)
		begin
		   	is=nps3;
			pnee=npe3;
			pp11=np3;
		end
	else if (np4!=24'b0000 && np3==24'b000)
		begin
		   	is=nps4;
			pnee=npe4;
			pp11=np4;
		end	
	else if (np4==24'b0000 && np3==24'b000)
		begin
		   	is=1'b0;
			pnee=8'b00;
			pp11=24'b00;
		end		

	end

reg [4:0] sl11;
always @(pp11)				//normalization
begin 
	if(pp11[23]==1'b1)
		begin
			sl11=5'b00000;
		end
	else if(pp11[23:22]==2'b01)
		begin
			sl11=5'b00001;              	
		end
	else if(pp11[23:21]==3'b001)
		begin
			sl11=5'b00010;
		end
	else if(pp11[23:20]==4'b0001)
		begin
			sl11=5'b00011;
		end
	else if(pp11[23:19]==5'b00001)
		begin
			sl11=5'b00100;
		end
	else if(pp11[23:18]==6'b000001)
		begin
			sl11=5'b00101;
		end
	else if(pp11[23:17]==7'b0000001)
		begin
			sl11=5'b00110;
		end
	else if(pp11[23:16]==8'b00000001)
		begin
			sl11=5'b00111;
		end
	else if(pp11[23:15]==9'b000000001)
		begin
			sl11=5'b01000;
		end
	else if(pp11[23:14]==10'b0000000001)
		begin
			sl11=5'b01001;
		end
	else if(pp11[23:13]==11'b00000000001)
		begin
			sl11=5'b01010;
		end
	else if(pp11[23:12]==12'b000000000001)
		begin
			sl11=5'b01011;
		end
	else if(pp11[23:11]==13'b0000000000001)
		begin
			sl11=5'b01100;
		end
	else if(pp11[23:10]==14'b00000000000001)
		begin
			sl11=5'b01101;
		end
	else if(pp11[23:9]==15'b000000000000001)
		begin
			sl11=5'b01110;
		end
	else if(pp11[23:8]==16'b0000000000000001)
		begin
			sl11=5'b01111;
		end
	else if(pp11[23:7]==17'b00000000000000001)
		begin
			sl11=5'b10000;
		end
	else if(pp11[23:6]==18'b000000000000000001)
		begin
			sl11=5'b10001;
		end
	else if(pp11[23:5]==19'b0000000000000000001)
		begin
			sl11=5'b10010;
		end
	else if(pp11[23:4]==20'b00000000000000000001)
		begin
			sl11=5'b10011;
		end
	else if(pp11[23:3]==21'b000000000000000000001)
		begin
			sl11=5'b10100;
		end
	else if(pp11[23:2]==22'b0000000000000000000001)
		begin
			sl11=5'b10101;
		end
	else if(pp11[23:1]==23'b00000000000000000000001)
		begin
			sl11=5'b10110;
		end
	else if(pp11[23:0]==24'b000000000000000000000001)
		begin
			sl11=5'b10111;
		end
	else if(pp11[23:0]==24'b000000000000000000000000)
		begin
			sl11=5'b00000;
		end
end 
wire [23:0] ii,i;

wire [7:0] sl3,sl2,iie;
wire c7,c8;
assign sl2=~{3'b000,sl11}; 
recurse8 r801(sl3,c7,sl2,8'b00000001);
recurse8 r811(iie,c8,pnee,sl3);
reg [7:0] ie;

assign ii=pp11<<sl11;

always@(iie or ii)
 begin
   if(ii==24'b00000)
	ie=8'b00000;
   else
	ie=iie;
 end

assign i=ii;

endmodule

//32 bit recursive doubling technique

/*`include "kgp.v"
`include "kgp_carry.v"
`include "recursive_stage1.v"*/

module recurse(sum,carry,a,b); 

output [31:0] sum;
output  carry;
input [31:0] a,b;

wire [65:0] x;

assign x[1:0]=2'b00;  // kgp generation

//assign {x[3:2]}=(a[0]==b[0])?((a[0]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[5:4]}=(a[1]==b[1])?((a[1]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[7:6]}=(a[2]==b[2])?((a[2]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[9:8]}=(a[3]==b[3])?((a[3]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[11:10]}=(a[4]==b[4])?((a[4]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[13:12]}=(a[5]==b[5])?((a[5]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[15:14]}=(a[6]==b[6])?((a[6]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[17:16]}=(a[7]==b[7])?((a[7]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[19:18]}=(a[8]==b[8])?((a[8]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[21:20]}=(a[9]==b[9])?((a[9]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[23:22]}=(a[10]==b[10])?((a[10]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[25:24]}=(a[11]==b[11])?((a[11]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[27:26]}=(a[12]==b[12])?((a[12]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[29:28]}=(a[13]==b[13])?((a[13]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[31:30]}=(a[14]==b[14])?((a[14]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[33:32]}=(a[15]==b[15])?((a[15]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[35:34]}=(a[16]==b[16])?((a[16]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[37:36]}=(a[17]==b[17])?((a[17]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[39:38]}=(a[18]==b[18])?((a[18]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[41:40]}=(a[19]==b[19])?((a[19]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[43:42]}=(a[20]==b[20])?((a[20]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[45:44]}=(a[21]==b[21])?((a[21]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[47:46]}=(a[22]==b[22])?((a[22]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[49:48]}=(a[23]==b[23])?((a[23]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[51:50]}=(a[24]==b[24])?((a[24]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[53:52]}=(a[25]==b[25])?((a[25]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[55:54]}=(a[26]==b[26])?((a[26]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[57:56]}=(a[27]==b[27])?((a[27]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[59:58]}=(a[28]==b[28])?((a[28]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[61:60]}=(a[29]==b[29])?((a[29]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[63:62]}=(a[30]==b[30])?((a[30]==1'b1)?2'b11:2'b00):2'b01;
//assign {x[65:64]}=(a[31]==b[31])?((a[31]==1'b1)?2'b11:2'b00):2'b01;

kgp a00(a[0],b[0],x[3:2]);
kgp a01(a[1],b[1],x[5:4]);
kgp a02(a[2],b[2],x[7:6]);
kgp a03(a[3],b[3],x[9:8]);
kgp a04(a[4],b[4],x[11:10]);
kgp a05(a[5],b[5],x[13:12]);
kgp a06(a[6],b[6],x[15:14]);
kgp a07(a[7],b[7],x[17:16]);
kgp a08(a[8],b[8],x[19:18]);
kgp a09(a[9],b[9],x[21:20]);
kgp a10(a[10],b[10],x[23:22]);
kgp a11(a[11],b[11],x[25:24]);
kgp a12(a[12],b[12],x[27:26]);
kgp a13(a[13],b[13],x[29:28]);
kgp a14(a[14],b[14],x[31:30]);
kgp a15(a[15],b[15],x[33:32]);
kgp a16(a[16],b[16],x[35:34]);
kgp a17(a[17],b[17],x[37:36]);
kgp a18(a[18],b[18],x[39:38]);
kgp a19(a[19],b[19],x[41:40]);
kgp a20(a[20],b[20],x[43:42]);
kgp a21(a[21],b[21],x[45:44]);
kgp a22(a[22],b[22],x[47:46]);
kgp a23(a[23],b[23],x[49:48]);
kgp a24(a[24],b[24],x[51:50]);
kgp a25(a[25],b[25],x[53:52]);
kgp a26(a[26],b[26],x[55:54]);
kgp a27(a[27],b[27],x[57:56]);
kgp a28(a[28],b[28],x[59:58]);
kgp a29(a[29],b[29],x[61:60]);
kgp a30(a[30],b[30],x[63:62]);
kgp a31(a[31],b[31],x[65:64]);

wire [63:0] x1;  //recursive doubling stage 1
assign x1[1:0]=x[1:0];

recursive_stage1 s00(x[1:0],x[3:2],x1[3:2]);
recursive_stage1 s01(x[3:2],x[5:4],x1[5:4]);
recursive_stage1 s02(x[5:4],x[7:6],x1[7:6]);
recursive_stage1 s03(x[7:6],x[9:8],x1[9:8]);
recursive_stage1 s04(x[9:8],x[11:10],x1[11:10]);
recursive_stage1 s05(x[11:10],x[13:12],x1[13:12]);
recursive_stage1 s06(x[13:12],x[15:14],x1[15:14]);
recursive_stage1 s07(x[15:14],x[17:16],x1[17:16]);
recursive_stage1 s08(x[17:16],x[19:18],x1[19:18]);
recursive_stage1 s09(x[19:18],x[21:20],x1[21:20]);
recursive_stage1 s10(x[21:20],x[23:22],x1[23:22]);
recursive_stage1 s11(x[23:22],x[25:24],x1[25:24]);
recursive_stage1 s12(x[25:24],x[27:26],x1[27:26]);
recursive_stage1 s13(x[27:26],x[29:28],x1[29:28]);
recursive_stage1 s14(x[29:28],x[31:30],x1[31:30]);
recursive_stage1 s15(x[31:30],x[33:32],x1[33:32]);
recursive_stage1 s16(x[33:32],x[35:34],x1[35:34]);
recursive_stage1 s17(x[35:34],x[37:36],x1[37:36]);
recursive_stage1 s18(x[37:36],x[39:38],x1[39:38]);
recursive_stage1 s19(x[39:38],x[41:40],x1[41:40]);
recursive_stage1 s20(x[41:40],x[43:42],x1[43:42]);
recursive_stage1 s21(x[43:42],x[45:44],x1[45:44]);
recursive_stage1 s22(x[45:44],x[47:46],x1[47:46]);
recursive_stage1 s23(x[47:46],x[49:48],x1[49:48]);
recursive_stage1 s24(x[49:48],x[51:50],x1[51:50]);
recursive_stage1 s25(x[51:50],x[53:52],x1[53:52]);
recursive_stage1 s26(x[53:52],x[55:54],x1[55:54]);
recursive_stage1 s27(x[55:54],x[57:56],x1[57:56]);
recursive_stage1 s28(x[57:56],x[59:58],x1[59:58]);
recursive_stage1 s29(x[59:58],x[61:60],x1[61:60]);
recursive_stage1 s30(x[61:60],x[63:62],x1[63:62]);

wire [63:0] x2;  //recursive doubling stage2
assign x2[3:0]=x1[3:0];

recursive_stage1 s101(x1[1:0],x1[5:4],x2[5:4]);
recursive_stage1 s102(x1[3:2],x1[7:6],x2[7:6]);
recursive_stage1 s103(x1[5:4],x1[9:8],x2[9:8]);
recursive_stage1 s104(x1[7:6],x1[11:10],x2[11:10]);
recursive_stage1 s105(x1[9:8],x1[13:12],x2[13:12]);
recursive_stage1 s106(x1[11:10],x1[15:14],x2[15:14]);
recursive_stage1 s107(x1[13:12],x1[17:16],x2[17:16]);
recursive_stage1 s108(x1[15:14],x1[19:18],x2[19:18]);
recursive_stage1 s109(x1[17:16],x1[21:20],x2[21:20]);
recursive_stage1 s110(x1[19:18],x1[23:22],x2[23:22]);
recursive_stage1 s111(x1[21:20],x1[25:24],x2[25:24]);
recursive_stage1 s112(x1[23:22],x1[27:26],x2[27:26]);
recursive_stage1 s113(x1[25:24],x1[29:28],x2[29:28]);
recursive_stage1 s114(x1[27:26],x1[31:30],x2[31:30]);
recursive_stage1 s115(x1[29:28],x1[33:32],x2[33:32]);
recursive_stage1 s116(x1[31:30],x1[35:34],x2[35:34]);
recursive_stage1 s117(x1[33:32],x1[37:36],x2[37:36]);
recursive_stage1 s118(x1[35:34],x1[39:38],x2[39:38]);
recursive_stage1 s119(x1[37:36],x1[41:40],x2[41:40]);
recursive_stage1 s120(x1[39:38],x1[43:42],x2[43:42]);
recursive_stage1 s121(x1[41:40],x1[45:44],x2[45:44]);
recursive_stage1 s122(x1[43:42],x1[47:46],x2[47:46]);
recursive_stage1 s123(x1[45:44],x1[49:48],x2[49:48]);
recursive_stage1 s124(x1[47:46],x1[51:50],x2[51:50]);
recursive_stage1 s125(x1[49:48],x1[53:52],x2[53:52]);
recursive_stage1 s126(x1[51:50],x1[55:54],x2[55:54]);
recursive_stage1 s127(x1[53:52],x1[57:56],x2[57:56]);
recursive_stage1 s128(x1[55:54],x1[59:58],x2[59:58]);
recursive_stage1 s129(x1[57:56],x1[61:60],x2[61:60]);
recursive_stage1 s130(x1[59:58],x1[63:62],x2[63:62]);

wire [63:0] x3;  //recursive doubling stage3
assign x3[7:0]=x2[7:0];

recursive_stage1 s203(x2[1:0],x2[9:8],x3[9:8]);
recursive_stage1 s204(x2[3:2],x2[11:10],x3[11:10]);
recursive_stage1 s205(x2[5:4],x2[13:12],x3[13:12]);
recursive_stage1 s206(x2[7:6],x2[15:14],x3[15:14]);
recursive_stage1 s207(x2[9:8],x2[17:16],x3[17:16]);
recursive_stage1 s208(x2[11:10],x2[19:18],x3[19:18]);
recursive_stage1 s209(x2[13:12],x2[21:20],x3[21:20]);
recursive_stage1 s210(x2[15:14],x2[23:22],x3[23:22]);
recursive_stage1 s211(x2[17:16],x2[25:24],x3[25:24]);
recursive_stage1 s212(x2[19:18],x2[27:26],x3[27:26]);
recursive_stage1 s213(x2[21:20],x2[29:28],x3[29:28]);
recursive_stage1 s214(x2[23:22],x2[31:30],x3[31:30]);
recursive_stage1 s215(x2[25:24],x2[33:32],x3[33:32]);
recursive_stage1 s216(x2[27:26],x2[35:34],x3[35:34]);
recursive_stage1 s217(x2[29:28],x2[37:36],x3[37:36]);
recursive_stage1 s218(x2[31:30],x2[39:38],x3[39:38]);
recursive_stage1 s219(x2[33:32],x2[41:40],x3[41:40]);
recursive_stage1 s220(x2[35:34],x2[43:42],x3[43:42]);
recursive_stage1 s221(x2[37:36],x2[45:44],x3[45:44]);
recursive_stage1 s222(x2[39:38],x2[47:46],x3[47:46]);
recursive_stage1 s223(x2[41:40],x2[49:48],x3[49:48]);
recursive_stage1 s224(x2[43:42],x2[51:50],x3[51:50]);
recursive_stage1 s225(x2[45:44],x2[53:52],x3[53:52]);
recursive_stage1 s226(x2[47:46],x2[55:54],x3[55:54]);
recursive_stage1 s227(x2[49:48],x2[57:56],x3[57:56]);
recursive_stage1 s228(x2[51:50],x2[59:58],x3[59:58]);
recursive_stage1 s229(x2[53:52],x2[61:60],x3[61:60]);
recursive_stage1 s230(x2[55:54],x2[63:62],x3[63:62]);

wire [63:0] x4;  //recursive doubling stage 4
assign x4[15:0]=x3[15:0];

recursive_stage1 s307(x3[1:0],x3[17:16],x4[17:16]);
recursive_stage1 s308(x3[3:2],x3[19:18],x4[19:18]);
recursive_stage1 s309(x3[5:4],x3[21:20],x4[21:20]);
recursive_stage1 s310(x3[7:6],x3[23:22],x4[23:22]);
recursive_stage1 s311(x3[9:8],x3[25:24],x4[25:24]);
recursive_stage1 s312(x3[11:10],x3[27:26],x4[27:26]);
recursive_stage1 s313(x3[13:12],x3[29:28],x4[29:28]);
recursive_stage1 s314(x3[15:14],x3[31:30],x4[31:30]);
recursive_stage1 s315(x3[17:16],x3[33:32],x4[33:32]);
recursive_stage1 s316(x3[19:18],x3[35:34],x4[35:34]);
recursive_stage1 s317(x3[21:20],x3[37:36],x4[37:36]);
recursive_stage1 s318(x3[23:22],x3[39:38],x4[39:38]);
recursive_stage1 s319(x3[25:24],x3[41:40],x4[41:40]);
recursive_stage1 s320(x3[27:26],x3[43:42],x4[43:42]);
recursive_stage1 s321(x3[29:28],x3[45:44],x4[45:44]);
recursive_stage1 s322(x3[31:30],x3[47:46],x4[47:46]);
recursive_stage1 s323(x3[33:32],x3[49:48],x4[49:48]);
recursive_stage1 s324(x3[35:34],x3[51:50],x4[51:50]);
recursive_stage1 s325(x3[37:36],x3[53:52],x4[53:52]);
recursive_stage1 s326(x3[39:38],x3[55:54],x4[55:54]);
recursive_stage1 s327(x3[41:40],x3[57:56],x4[57:56]);
recursive_stage1 s328(x3[43:42],x3[59:58],x4[59:58]);
recursive_stage1 s329(x3[45:44],x3[61:60],x4[61:60]);
recursive_stage1 s330(x3[47:46],x3[63:62],x4[63:62]);

wire [63:0] x5;  //recursive doubling stage 5
assign x5[31:0]=x4[31:0];

recursive_stage1 s415(x4[1:0],x4[33:32],x5[33:32]);
recursive_stage1 s416(x4[3:2],x4[35:34],x5[35:34]);
recursive_stage1 s417(x4[5:4],x4[37:36],x5[37:36]);
recursive_stage1 s418(x4[7:6],x4[39:38],x5[39:38]);
recursive_stage1 s419(x4[9:8],x4[41:40],x5[41:40]);
recursive_stage1 s420(x4[11:10],x4[43:42],x5[43:42]);
recursive_stage1 s421(x4[13:12],x4[45:44],x5[45:44]);
recursive_stage1 s422(x4[15:14],x4[47:46],x5[47:46]);
recursive_stage1 s423(x4[17:16],x4[49:48],x5[49:48]);
recursive_stage1 s424(x4[19:18],x4[51:50],x5[51:50]);
recursive_stage1 s425(x4[21:20],x4[53:52],x5[53:52]);
recursive_stage1 s426(x4[23:22],x4[55:54],x5[55:54]);
recursive_stage1 s427(x4[25:24],x4[57:56],x5[57:56]);
recursive_stage1 s428(x4[27:26],x4[59:58],x5[59:58]);
recursive_stage1 s429(x4[29:28],x4[61:60],x5[61:60]);
recursive_stage1 s430(x4[31:30],x4[63:62],x5[63:62]);

 // final sum and carry

assign sum[0]=a[0]^b[0]^x5[0];
assign sum[1]=a[1]^b[1]^x5[2];
assign sum[2]=a[2]^b[2]^x5[4];
assign sum[3]=a[3]^b[3]^x5[6];
assign sum[4]=a[4]^b[4]^x5[8];
assign sum[5]=a[5]^b[5]^x5[10];
assign sum[6]=a[6]^b[6]^x5[12];
assign sum[7]=a[7]^b[7]^x5[14];
assign sum[8]=a[8]^b[8]^x5[16];
assign sum[9]=a[9]^b[9]^x5[18];
assign sum[10]=a[10]^b[10]^x5[20];
assign sum[11]=a[11]^b[11]^x5[22];
assign sum[12]=a[12]^b[12]^x5[24];
assign sum[13]=a[13]^b[13]^x5[26];
assign sum[14]=a[14]^b[14]^x5[28];
assign sum[15]=a[15]^b[15]^x5[30];
assign sum[16]=a[16]^b[16]^x5[32];
assign sum[17]=a[17]^b[17]^x5[34];
assign sum[18]=a[18]^b[18]^x5[36];
assign sum[19]=a[19]^b[19]^x5[38];
assign sum[20]=a[20]^b[20]^x5[40];
assign sum[21]=a[21]^b[21]^x5[42];
assign sum[22]=a[22]^b[22]^x5[44];
assign sum[23]=a[23]^b[23]^x5[46];
assign sum[24]=a[24]^b[24]^x5[48];
assign sum[25]=a[25]^b[25]^x5[50];
assign sum[26]=a[26]^b[26]^x5[52];
assign sum[27]=a[27]^b[27]^x5[54];
assign sum[28]=a[28]^b[28]^x5[56];
assign sum[29]=a[29]^b[29]^x5[58];
assign sum[30]=a[30]^b[30]^x5[60];
assign sum[31]=a[31]^b[31]^x5[62];


kgp_carry kkc(x[65:64],x5[63:62],carry);

endmodule

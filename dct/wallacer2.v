// radix2 Wallace tree based single precision floating point multiplier

//`include "recurse8.v"
//`include "recurse40.v"
//`include "fulladd.v"
//`include "halfadd.v"
//include "kgp.v"
//`include "kgp_carry.v"
//`include "recursive_stage1.v"

module wallacer2(as,ae,a,bs,be,b,ms,me,m);
input as,bs;
input [23:0] a,b;
input [7:0] ae,be;
output ms;
output [7:0] me;
output [23:0] m;

wire [47:0] r1;
wire [47:0] r;
wire [23:0] p0;
wire [23:0] p1;
wire [23:0] p2;
wire [23:0] p3;
wire [23:0] p4;
wire [23:0] p5;
wire [23:0] p6;
wire [23:0] p7;
wire [23:0] p8;
wire [23:0] p9;
wire [23:0] p10;
wire [23:0] p11;
wire [23:0] p12;
wire [23:0] p13;
wire [23:0] p14;
wire [23:0] p15;
wire [23:0] p16;
wire [23:0] p17;
wire [23:0] p18;
wire [23:0] p19;
wire [23:0] p20;
wire [23:0] p21;
wire [23:0] p22;
wire [23:0] p23;

wire [25:0] sum1;
wire [25:0] sum2;
wire [25:0] sum3;
wire [25:0] sum4;
wire [25:0] sum5;
wire [25:0] sum6;
wire [25:0] sum7;
wire [25:0] sum8;
wire [28:0] sum9;
wire [26:0] sum10;
wire [28:0] sum11;
wire [26:0] sum12;
wire [28:0] sum13;
wire [31:0] sum14;
wire [30:0] sum15;
wire [32:0] sum16;
wire [37:0] sum18;
wire [36:0] sum19;
wire [46:0] sum20;
wire [31:0] sum21;
wire [46:0] sum22;
wire [47:0] sum23;

wire [23:0] carry1;
wire [23:0] carry2;
wire [23:0] carry3;
wire [23:0] carry4;
wire [23:0] carry5;
wire [23:0] carry6;
wire [23:0] carry7;
wire [23:0] carry8;
wire [23:0] carry9;
wire [25:0] carry10;
wire [23:0] carry11;
wire [25:0] carry12;
wire [23:0] carry13;
wire [25:0] carry14;
wire [26:0] carry15;
wire [25:0] carry16;
wire [27:0] carry18;
wire [28:0] carry19;
wire [32:0] carry20;
wire [23:0] carry21;
wire [40:0] carry22;
wire [39:0] carry23;

wire c_in0,c_in1,c_in2,c_in3,c_in4,c_in5,c_in6,c_in7,c_in8,c_in9,carry_in;
assign carry_in=1'b0;

assign p0[23:0] = b[0] ? a[23:0] : 24'b000000000000000000000000;
assign p1[23:0] = b[1] ? a[23:0] : 24'b000000000000000000000000;
assign p2[23:0] = b[2] ? a[23:0] : 24'b000000000000000000000000;
assign p3[23:0] = b[3] ? a[23:0] : 24'b000000000000000000000000;    
assign p4[23:0] = b[4] ? a[23:0] : 24'b000000000000000000000000;
assign p5[23:0] = b[5] ? a[23:0] : 24'b000000000000000000000000;
assign p6[23:0] = b[6] ? a[23:0] : 24'b000000000000000000000000;
assign p7[23:0] = b[7] ? a[23:0] : 24'b000000000000000000000000;
assign p8[23:0] = b[8] ? a[23:0] : 24'b000000000000000000000000;
assign p9[23:0] = b[9] ? a[23:0] : 24'b000000000000000000000000;
assign p10[23:0] = b[10] ? a[23:0] : 24'b000000000000000000000000;
assign p11[23:0] = b[11] ? a[23:0] : 24'b000000000000000000000000;    
assign p12[23:0] = b[12] ? a[23:0] : 24'b000000000000000000000000;
assign p13[23:0] = b[13] ? a[23:0] : 24'b000000000000000000000000;
assign p14[23:0] = b[14] ? a[23:0] : 24'b000000000000000000000000;
assign p15[23:0] = b[15] ? a[23:0] : 24'b000000000000000000000000;
assign p16[23:0] = b[16] ? a[23:0] : 24'b000000000000000000000000;
assign p17[23:0] = b[17] ? a[23:0] : 24'b000000000000000000000000;
assign p18[23:0] = b[18] ? a[23:0] : 24'b000000000000000000000000;
assign p19[23:0] = b[19] ? a[23:0] : 24'b000000000000000000000000;    
assign p20[23:0] = b[20] ? a[23:0] : 24'b000000000000000000000000;
assign p21[23:0] = b[21] ? a[23:0] : 24'b000000000000000000000000;
assign p22[23:0] = b[22] ? a[23:0] : 24'b000000000000000000000000;
assign p23[23:0] = b[23] ? a[23:0] : 24'b000000000000000000000000;

//csa 1

assign sum1[0]=p0[0];
halfadd h11(sum1[1],carry1[0],p0[1],p1[0]);
fulladd f101(sum1[2],carry1[1],p0[2],p1[1],p2[0]);
fulladd f102(sum1[3],carry1[2],p0[3],p1[2],p2[1]);
fulladd f103(sum1[4],carry1[3],p0[4],p1[3],p2[2]);
fulladd f104(sum1[5],carry1[4],p0[5],p1[4],p2[3]);
fulladd f105(sum1[6],carry1[5],p0[6],p1[5],p2[4]);
fulladd f106(sum1[7],carry1[6],p0[7],p1[6],p2[5]);
fulladd f107(sum1[8],carry1[7],p0[8],p1[7],p2[6]);
fulladd f108(sum1[9],carry1[8],p0[9],p1[8],p2[7]);
fulladd f109(sum1[10],carry1[9],p0[10],p1[9],p2[8]);
fulladd f110(sum1[11],carry1[10],p0[11],p1[10],p2[9]);
fulladd f111(sum1[12],carry1[11],p0[12],p1[11],p2[10]);
fulladd f112(sum1[13],carry1[12],p0[13],p1[12],p2[11]);
fulladd f113(sum1[14],carry1[13],p0[14],p1[13],p2[12]);
fulladd f114(sum1[15],carry1[14],p0[15],p1[14],p2[13]);
fulladd f115(sum1[16],carry1[15],p0[16],p1[15],p2[14]);
fulladd f116(sum1[17],carry1[16],p0[17],p1[16],p2[15]);
fulladd f117(sum1[18],carry1[17],p0[18],p1[17],p2[16]);
fulladd f118(sum1[19],carry1[18],p0[19],p1[18],p2[17]);
fulladd f119(sum1[20],carry1[19],p0[20],p1[19],p2[18]);
fulladd f120(sum1[21],carry1[20],p0[21],p1[20],p2[19]);
fulladd f121(sum1[22],carry1[21],p0[22],p1[21],p2[20]);
fulladd f122(sum1[23],carry1[22],p0[23],p1[22],p2[21]);
halfadd h12(sum1[24],carry1[23],p1[23],p2[22]);
assign sum1[25]=p2[23];

//csa 2

assign sum2[0]=p3[0];
halfadd h21(sum2[1],carry2[0],p3[1],p4[0]);
fulladd f201(sum2[2],carry2[1],p3[2],p4[1],p5[0]);
fulladd f202(sum2[3],carry2[2],p3[3],p4[2],p5[1]);
fulladd f203(sum2[4],carry2[3],p3[4],p4[3],p5[2]);
fulladd f204(sum2[5],carry2[4],p3[5],p4[4],p5[3]);
fulladd f205(sum2[6],carry2[5],p3[6],p4[5],p5[4]);
fulladd f206(sum2[7],carry2[6],p3[7],p4[6],p5[5]);
fulladd f207(sum2[8],carry2[7],p3[8],p4[7],p5[6]);
fulladd f208(sum2[9],carry2[8],p3[9],p4[8],p5[7]);
fulladd f209(sum2[10],carry2[9],p3[10],p4[9],p5[8]);
fulladd f210(sum2[11],carry2[10],p3[11],p4[10],p5[9]);
fulladd f211(sum2[12],carry2[11],p3[12],p4[11],p5[10]);
fulladd f212(sum2[13],carry2[12],p3[13],p4[12],p5[11]);
fulladd f213(sum2[14],carry2[13],p3[14],p4[13],p5[12]);
fulladd f214(sum2[15],carry2[14],p3[15],p4[14],p5[13]);
fulladd f215(sum2[16],carry2[15],p3[16],p4[15],p5[14]);
fulladd f216(sum2[17],carry2[16],p3[17],p4[16],p5[15]);
fulladd f217(sum2[18],carry2[17],p3[18],p4[17],p5[16]);
fulladd f218(sum2[19],carry2[18],p3[19],p4[18],p5[17]);
fulladd f219(sum2[20],carry2[19],p3[20],p4[19],p5[18]);
fulladd f220(sum2[21],carry2[20],p3[21],p4[20],p5[19]);
fulladd f221(sum2[22],carry2[21],p3[22],p4[21],p5[20]);
fulladd f222(sum2[23],carry2[22],p3[23],p4[22],p5[21]);
halfadd h22(sum2[24],carry2[23],p4[23],p5[22]);
assign sum2[25]=p5[23];

//csa 3

assign sum3[0]=p6[0];
halfadd h31(sum3[1],carry3[0],p6[1],p7[0]);
fulladd f301(sum3[2],carry3[1],p6[2],p7[1],p8[0]);
fulladd f302(sum3[3],carry3[2],p6[3],p7[2],p8[1]);
fulladd f303(sum3[4],carry3[3],p6[4],p7[3],p8[2]);
fulladd f304(sum3[5],carry3[4],p6[5],p7[4],p8[3]);
fulladd f305(sum3[6],carry3[5],p6[6],p7[5],p8[4]);
fulladd f306(sum3[7],carry3[6],p6[7],p7[6],p8[5]);
fulladd f307(sum3[8],carry3[7],p6[8],p7[7],p8[6]);
fulladd f308(sum3[9],carry3[8],p6[9],p7[8],p8[7]);
fulladd f309(sum3[10],carry3[9],p6[10],p7[9],p8[8]);
fulladd f310(sum3[11],carry3[10],p6[11],p7[10],p8[9]);
fulladd f311(sum3[12],carry3[11],p6[12],p7[11],p8[10]);
fulladd f312(sum3[13],carry3[12],p6[13],p7[12],p8[11]);
fulladd f313(sum3[14],carry3[13],p6[14],p7[13],p8[12]);
fulladd f314(sum3[15],carry3[14],p6[15],p7[14],p8[13]);
fulladd f315(sum3[16],carry3[15],p6[16],p7[15],p8[14]);
fulladd f316(sum3[17],carry3[16],p6[17],p7[16],p8[15]);
fulladd f317(sum3[18],carry3[17],p6[18],p7[17],p8[16]);
fulladd f318(sum3[19],carry3[18],p6[19],p7[18],p8[17]);
fulladd f319(sum3[20],carry3[19],p6[20],p7[19],p8[18]);
fulladd f320(sum3[21],carry3[20],p6[21],p7[20],p8[19]);
fulladd f321(sum3[22],carry3[21],p6[22],p7[21],p8[20]);
fulladd f322(sum3[23],carry3[22],p6[23],p7[22],p8[21]);
halfadd h32(sum3[24],carry3[23],p7[23],p8[22]);
assign sum3[25]=p8[23];

//csa 4

assign sum4[0]=p9[0];
halfadd h41(sum4[1],carry4[0],p9[1],p10[0]);
fulladd f401(sum4[2],carry4[1],p9[2],p10[1],p11[0]);
fulladd f402(sum4[3],carry4[2],p9[3],p10[2],p11[1]);
fulladd f403(sum4[4],carry4[3],p9[4],p10[3],p11[2]);
fulladd f404(sum4[5],carry4[4],p9[5],p10[4],p11[3]);
fulladd f405(sum4[6],carry4[5],p9[6],p10[5],p11[4]);
fulladd f406(sum4[7],carry4[6],p9[7],p10[6],p11[5]);
fulladd f407(sum4[8],carry4[7],p9[8],p10[7],p11[6]);
fulladd f408(sum4[9],carry4[8],p9[9],p10[8],p11[7]);
fulladd f409(sum4[10],carry4[9],p9[10],p10[9],p11[8]);
fulladd f410(sum4[11],carry4[10],p9[11],p10[10],p11[9]);
fulladd f411(sum4[12],carry4[11],p9[12],p10[11],p11[10]);
fulladd f412(sum4[13],carry4[12],p9[13],p10[12],p11[11]);
fulladd f413(sum4[14],carry4[13],p9[14],p10[13],p11[12]);
fulladd f414(sum4[15],carry4[14],p9[15],p10[14],p11[13]);
fulladd f415(sum4[16],carry4[15],p9[16],p10[15],p11[14]);
fulladd f416(sum4[17],carry4[16],p9[17],p10[16],p11[15]);
fulladd f417(sum4[18],carry4[17],p9[18],p10[17],p11[16]);
fulladd f418(sum4[19],carry4[18],p9[19],p10[18],p11[17]);
fulladd f419(sum4[20],carry4[19],p9[20],p10[19],p11[18]);
fulladd f420(sum4[21],carry4[20],p9[21],p10[20],p11[19]);
fulladd f421(sum4[22],carry4[21],p9[22],p10[21],p11[20]);
fulladd f422(sum4[23],carry4[22],p9[23],p10[22],p11[21]);
halfadd h42(sum4[24],carry4[23],p10[23],p11[22]);
assign sum4[25]=p11[23];

//csa 5

assign sum5[0]=p12[0];
halfadd h51(sum5[1],carry5[0],p12[1],p13[0]);
fulladd f501(sum5[2],carry5[1],p12[2],p13[1],p14[0]);
fulladd f502(sum5[3],carry5[2],p12[3],p13[2],p14[1]);
fulladd f503(sum5[4],carry5[3],p12[4],p13[3],p14[2]);
fulladd f504(sum5[5],carry5[4],p12[5],p13[4],p14[3]);
fulladd f505(sum5[6],carry5[5],p12[6],p13[5],p14[4]);
fulladd f506(sum5[7],carry5[6],p12[7],p13[6],p14[5]);
fulladd f507(sum5[8],carry5[7],p12[8],p13[7],p14[6]);
fulladd f508(sum5[9],carry5[8],p12[9],p13[8],p14[7]);
fulladd f509(sum5[10],carry5[9],p12[10],p13[9],p14[8]);
fulladd f510(sum5[11],carry5[10],p12[11],p13[10],p14[9]);
fulladd f511(sum5[12],carry5[11],p12[12],p13[11],p14[10]);
fulladd f512(sum5[13],carry5[12],p12[13],p13[12],p14[11]);
fulladd f513(sum5[14],carry5[13],p12[14],p13[13],p14[12]);
fulladd f514(sum5[15],carry5[14],p12[15],p13[14],p14[13]);
fulladd f515(sum5[16],carry5[15],p12[16],p13[15],p14[14]);
fulladd f516(sum5[17],carry5[16],p12[17],p13[16],p14[15]);
fulladd f517(sum5[18],carry5[17],p12[18],p13[17],p14[16]);
fulladd f518(sum5[19],carry5[18],p12[19],p13[18],p14[17]);
fulladd f519(sum5[20],carry5[19],p12[20],p13[19],p14[18]);
fulladd f520(sum5[21],carry5[20],p12[21],p13[20],p14[19]);
fulladd f521(sum5[22],carry5[21],p12[22],p13[21],p14[20]);
fulladd f522(sum5[23],carry5[22],p12[23],p13[22],p14[21]);
halfadd h52(sum5[24],carry5[23],p13[23],p14[22]);
assign sum5[25]=p14[23];

//csa 6

assign sum6[0]=p15[0];
halfadd h61(sum6[1],carry6[0],p15[1],p16[0]);
fulladd f601(sum6[2],carry6[1],p15[2],p16[1],p17[0]);
fulladd f602(sum6[3],carry6[2],p15[3],p16[2],p17[1]);
fulladd f603(sum6[4],carry6[3],p15[4],p16[3],p17[2]);
fulladd f604(sum6[5],carry6[4],p15[5],p16[4],p17[3]);
fulladd f605(sum6[6],carry6[5],p15[6],p16[5],p17[4]);
fulladd f606(sum6[7],carry6[6],p15[7],p16[6],p17[5]);
fulladd f607(sum6[8],carry6[7],p15[8],p16[7],p17[6]);
fulladd f608(sum6[9],carry6[8],p15[9],p16[8],p17[7]);
fulladd f609(sum6[10],carry6[9],p15[10],p16[9],p17[8]);
fulladd f610(sum6[11],carry6[10],p15[11],p16[10],p17[9]);
fulladd f611(sum6[12],carry6[11],p15[12],p16[11],p17[10]);
fulladd f612(sum6[13],carry6[12],p15[13],p16[12],p17[11]);
fulladd f613(sum6[14],carry6[13],p15[14],p16[13],p17[12]);
fulladd f614(sum6[15],carry6[14],p15[15],p16[14],p17[13]);
fulladd f615(sum6[16],carry6[15],p15[16],p16[15],p17[14]);
fulladd f616(sum6[17],carry6[16],p15[17],p16[16],p17[15]);
fulladd f617(sum6[18],carry6[17],p15[18],p16[17],p17[16]);
fulladd f618(sum6[19],carry6[18],p15[19],p16[18],p17[17]);
fulladd f619(sum6[20],carry6[19],p15[20],p16[19],p17[18]);
fulladd f620(sum6[21],carry6[20],p15[21],p16[20],p17[19]);
fulladd f621(sum6[22],carry6[21],p15[22],p16[21],p17[20]);
fulladd f622(sum6[23],carry6[22],p15[23],p16[22],p17[21]);
halfadd h62(sum6[24],carry6[23],p16[23],p17[22]);
assign sum6[25]=p17[23];

//csa 7

assign sum7[0]=p18[0];
halfadd h71(sum7[1],carry7[0],p18[1],p19[0]);
fulladd f701(sum7[2],carry7[1],p18[2],p19[1],p20[0]);
fulladd f702(sum7[3],carry7[2],p18[3],p19[2],p20[1]);
fulladd f703(sum7[4],carry7[3],p18[4],p19[3],p20[2]);
fulladd f704(sum7[5],carry7[4],p18[5],p19[4],p20[3]);
fulladd f705(sum7[6],carry7[5],p18[6],p19[5],p20[4]);
fulladd f706(sum7[7],carry7[6],p18[7],p19[6],p20[5]);
fulladd f707(sum7[8],carry7[7],p18[8],p19[7],p20[6]);
fulladd f708(sum7[9],carry7[8],p18[9],p19[8],p20[7]);
fulladd f709(sum7[10],carry7[9],p18[10],p19[9],p20[8]);
fulladd f710(sum7[11],carry7[10],p18[11],p19[10],p20[9]);
fulladd f711(sum7[12],carry7[11],p18[12],p19[11],p20[10]);
fulladd f712(sum7[13],carry7[12],p18[13],p19[12],p20[11]);
fulladd f713(sum7[14],carry7[13],p18[14],p19[13],p20[12]);
fulladd f714(sum7[15],carry7[14],p18[15],p19[14],p20[13]);
fulladd f715(sum7[16],carry7[15],p18[16],p19[15],p20[14]);
fulladd f716(sum7[17],carry7[16],p18[17],p19[16],p20[15]);
fulladd f717(sum7[18],carry7[17],p18[18],p19[17],p20[16]);
fulladd f718(sum7[19],carry7[18],p18[19],p19[18],p20[17]);
fulladd f719(sum7[20],carry7[19],p18[20],p19[19],p20[18]);
fulladd f720(sum7[21],carry7[20],p18[21],p19[20],p20[19]);
fulladd f721(sum7[22],carry7[21],p18[22],p19[21],p20[20]);
fulladd f722(sum7[23],carry7[22],p18[23],p19[22],p20[21]);
halfadd h72(sum7[24],carry7[23],p19[23],p20[22]);
assign sum7[25]=p20[23];

//csa 8

assign sum8[0]=p21[0];
halfadd h81(sum8[1],carry8[0],p21[1],p22[0]);
fulladd f801(sum8[2],carry8[1],p21[2],p22[1],p23[0]);
fulladd f802(sum8[3],carry8[2],p21[3],p22[2],p23[1]);
fulladd f803(sum8[4],carry8[3],p21[4],p22[3],p23[2]);
fulladd f804(sum8[5],carry8[4],p21[5],p22[4],p23[3]);
fulladd f805(sum8[6],carry8[5],p21[6],p22[5],p23[4]);
fulladd f806(sum8[7],carry8[6],p21[7],p22[6],p23[5]);
fulladd f807(sum8[8],carry8[7],p21[8],p22[7],p23[6]);
fulladd f808(sum8[9],carry8[8],p21[9],p22[8],p23[7]);
fulladd f89(sum8[10],carry8[9],p21[10],p22[9],p23[8]);
fulladd f810(sum8[11],carry8[10],p21[11],p22[10],p23[9]);
fulladd f811(sum8[12],carry8[11],p21[12],p22[11],p23[10]);
fulladd f812(sum8[13],carry8[12],p21[13],p22[12],p23[11]);
fulladd f813(sum8[14],carry8[13],p21[14],p22[13],p23[12]);
fulladd f814(sum8[15],carry8[14],p21[15],p22[14],p23[13]);
fulladd f815(sum8[16],carry8[15],p21[16],p22[15],p23[14]);
fulladd f816(sum8[17],carry8[16],p21[17],p22[16],p23[15]);
fulladd f817(sum8[18],carry8[17],p21[18],p22[17],p23[16]);
fulladd f818(sum8[19],carry8[18],p21[19],p22[18],p23[17]);
fulladd f819(sum8[20],carry8[19],p21[20],p22[19],p23[18]);
fulladd f820(sum8[21],carry8[20],p21[21],p22[20],p23[19]);
fulladd f821(sum8[22],carry8[21],p21[22],p22[21],p23[20]);
fulladd f822(sum8[23],carry8[22],p21[23],p22[22],p23[21]);
halfadd h82(sum8[24],carry8[23],p22[23],p23[22]);
assign sum8[25]=p23[23];

//csa 9

assign sum9[1:0]=sum1[1:0];
halfadd h991(sum9[2],carry9[0],sum1[2],carry1[0]);
fulladd f901(sum9[3],carry9[1],sum1[3],carry1[1],sum2[0]);
fulladd f902(sum9[4],carry9[2],sum1[4],carry1[2],sum2[1]);
fulladd f903(sum9[5],carry9[3],sum1[5],carry1[3],sum2[2]);
fulladd f904(sum9[6],carry9[4],sum1[6],carry1[4],sum2[3]);
fulladd f905(sum9[7],carry9[5],sum1[7],carry1[5],sum2[4]);
fulladd f906(sum9[8],carry9[6],sum1[8],carry1[6],sum2[5]);
fulladd f907(sum9[9],carry9[7],sum1[9],carry1[7],sum2[6]);
fulladd f908(sum9[10],carry9[8],sum1[10],carry1[8],sum2[7]);
fulladd f909(sum9[11],carry9[9],sum1[11],carry1[9],sum2[8]);
fulladd f910(sum9[12],carry9[10],sum1[12],carry1[10],sum2[9]);
fulladd f911(sum9[13],carry9[11],sum1[13],carry1[11],sum2[10]);
fulladd f912(sum9[14],carry9[12],sum1[14],carry1[12],sum2[11]);
fulladd f913(sum9[15],carry9[13],sum1[15],carry1[13],sum2[12]);
fulladd f914(sum9[16],carry9[14],sum1[16],carry1[14],sum2[13]);
fulladd f915(sum9[17],carry9[15],sum1[17],carry1[15],sum2[14]);
fulladd f916(sum9[18],carry9[16],sum1[18],carry1[16],sum2[15]);
fulladd f917(sum9[19],carry9[17],sum1[19],carry1[17],sum2[16]);
fulladd f918(sum9[20],carry9[18],sum1[20],carry1[18],sum2[17]);
fulladd f919(sum9[21],carry9[19],sum1[21],carry1[19],sum2[18]);
fulladd f920(sum9[22],carry9[20],sum1[22],carry1[20],sum2[19]);
fulladd f921(sum9[23],carry9[21],sum1[23],carry1[21],sum2[20]);
fulladd f922(sum9[24],carry9[22],sum1[24],carry1[22],sum2[21]);
fulladd f923(sum9[25],carry9[23],sum1[25],carry1[23],sum2[22]);
assign sum9[28:26]=sum2[25:23];

//csa 10

assign sum10[0]=carry2[0];
halfadd h101(sum10[1],carry10[0],sum3[0],carry2[1]);
halfadd h102(sum10[2],carry10[1],sum3[1],carry2[2]);
fulladd f1001(sum10[3],carry10[2],sum3[2],carry2[3],carry3[0]);
fulladd f1002(sum10[4],carry10[3],sum3[3],carry2[4],carry3[1]);
fulladd f1003(sum10[5],carry10[4],sum3[4],carry2[5],carry3[2]);
fulladd f1004(sum10[6],carry10[5],sum3[5],carry2[6],carry3[3]);
fulladd f1005(sum10[7],carry10[6],sum3[6],carry2[7],carry3[4]);
fulladd f1006(sum10[8],carry10[7],sum3[7],carry2[8],carry3[5]);
fulladd f1007(sum10[9],carry10[8],sum3[8],carry2[9],carry3[6]);
fulladd f1008(sum10[10],carry10[9],sum3[9],carry2[10],carry3[7]);
fulladd f1009(sum10[11],carry10[10],sum3[10],carry2[11],carry3[8]);
fulladd f1010(sum10[12],carry10[11],sum3[11],carry2[12],carry3[9]);
fulladd f1011(sum10[13],carry10[12],sum3[12],carry2[13],carry3[10]);
fulladd f1012(sum10[14],carry10[13],sum3[13],carry2[14],carry3[11]);
fulladd f1013(sum10[15],carry10[14],sum3[14],carry2[15],carry3[12]);
fulladd f1014(sum10[16],carry10[15],sum3[15],carry2[16],carry3[13]);
fulladd f1015(sum10[17],carry10[16],sum3[16],carry2[17],carry3[14]);
fulladd f1016(sum10[18],carry10[17],sum3[17],carry2[18],carry3[15]);
fulladd f1017(sum10[19],carry10[18],sum3[18],carry2[19],carry3[16]);
fulladd f1018(sum10[20],carry10[19],sum3[19],carry2[20],carry3[17]);
fulladd f1019(sum10[21],carry10[20],sum3[20],carry2[21],carry3[18]);
fulladd f1020(sum10[22],carry10[21],sum3[21],carry2[22],carry3[19]);
fulladd f1021(sum10[23],carry10[22],sum3[22],carry2[23],carry3[20]);
halfadd h103(sum10[24],carry10[23],sum3[23],carry3[21]);
halfadd h104(sum10[25],carry10[24],sum3[24],carry3[22]);
halfadd h105(sum10[26],carry10[25],sum3[25],carry3[23]);

//csa 11

assign sum11[1:0]=sum4[1:0];
halfadd h111(sum11[2],carry11[0],sum4[2],carry4[0]);
fulladd f1101(sum11[3],carry11[1],sum4[3],carry4[1],sum5[0]);
fulladd f1102(sum11[4],carry11[2],sum4[4],carry4[2],sum5[1]);
fulladd f1103(sum11[5],carry11[3],sum4[5],carry4[3],sum5[2]);
fulladd f1104(sum11[6],carry11[4],sum4[6],carry4[4],sum5[3]);
fulladd f1105(sum11[7],carry11[5],sum4[7],carry4[5],sum5[4]);
fulladd f1106(sum11[8],carry11[6],sum4[8],carry4[6],sum5[5]);
fulladd f1107(sum11[9],carry11[7],sum4[9],carry4[7],sum5[6]);
fulladd f1108(sum11[10],carry11[8],sum4[10],carry4[8],sum5[7]);
fulladd f1109(sum11[11],carry11[9],sum4[11],carry4[9],sum5[8]);
fulladd f1110(sum11[12],carry11[10],sum4[12],carry4[10],sum5[9]);
fulladd f1111(sum11[13],carry11[11],sum4[13],carry4[11],sum5[10]);
fulladd f1112(sum11[14],carry11[12],sum4[14],carry4[12],sum5[11]);
fulladd f1113(sum11[15],carry11[13],sum4[15],carry4[13],sum5[12]);
fulladd f1114(sum11[16],carry11[14],sum4[16],carry4[14],sum5[13]);
fulladd f1115(sum11[17],carry11[15],sum4[17],carry4[15],sum5[14]);
fulladd f1116(sum11[18],carry11[16],sum4[18],carry4[16],sum5[15]);
fulladd f1117(sum11[19],carry11[17],sum4[19],carry4[17],sum5[16]);
fulladd f1118(sum11[20],carry11[18],sum4[20],carry4[18],sum5[17]);
fulladd f1119(sum11[21],carry11[19],sum4[21],carry4[19],sum5[18]);
fulladd f1120(sum11[22],carry11[20],sum4[22],carry4[20],sum5[19]);
fulladd f1121(sum11[23],carry11[21],sum4[23],carry4[21],sum5[20]);
fulladd f1122(sum11[24],carry11[22],sum4[24],carry4[22],sum5[21]);
fulladd f1123(sum11[25],carry11[23],sum4[25],carry4[23],sum5[22]);
assign sum11[28:26]=sum5[25:23];

//csa 12

assign sum12[0]=carry5[0];
halfadd h121(sum12[1],carry12[0],sum6[0],carry5[1]);
halfadd h122(sum12[2],carry12[1],sum6[1],carry5[2]);
fulladd f1201(sum12[3],carry12[2],sum6[2],carry5[3],carry6[0]);
fulladd f1202(sum12[4],carry12[3],sum6[3],carry5[4],carry6[1]);
fulladd f1203(sum12[5],carry12[4],sum6[4],carry5[5],carry6[2]);
fulladd f1204(sum12[6],carry12[5],sum6[5],carry5[6],carry6[3]);
fulladd f1205(sum12[7],carry12[6],sum6[6],carry5[7],carry6[4]);
fulladd f1206(sum12[8],carry12[7],sum6[7],carry5[8],carry6[5]);
fulladd f1207(sum12[9],carry12[8],sum6[8],carry5[9],carry6[6]);
fulladd f1208(sum12[10],carry12[9],sum6[9],carry5[10],carry6[7]);
fulladd f1209(sum12[11],carry12[10],sum6[10],carry5[11],carry6[8]);
fulladd f1210(sum12[12],carry12[11],sum6[11],carry5[12],carry6[9]);
fulladd f1211(sum12[13],carry12[12],sum6[12],carry5[13],carry6[10]);
fulladd f1212(sum12[14],carry12[13],sum6[13],carry5[14],carry6[11]);
fulladd f1213(sum12[15],carry12[14],sum6[14],carry5[15],carry6[12]);
fulladd f1214(sum12[16],carry12[15],sum6[15],carry5[16],carry6[13]);
fulladd f1215(sum12[17],carry12[16],sum6[16],carry5[17],carry6[14]);
fulladd f1216(sum12[18],carry12[17],sum6[17],carry5[18],carry6[15]);
fulladd f1217(sum12[19],carry12[18],sum6[18],carry5[19],carry6[16]);
fulladd f1218(sum12[20],carry12[19],sum6[19],carry5[20],carry6[17]);
fulladd f1219(sum12[21],carry12[20],sum6[20],carry5[21],carry6[18]);
fulladd f1220(sum12[22],carry12[21],sum6[21],carry5[22],carry6[19]);
fulladd f1221(sum12[23],carry12[22],sum6[22],carry5[23],carry6[20]);
halfadd h123(sum12[24],carry12[23],sum6[23],carry6[21]);
halfadd h124(sum12[25],carry12[24],sum6[24],carry6[22]);
halfadd h125(sum12[26],carry12[25],sum6[25],carry6[23]);

//csa 13

assign sum13[1:0]=sum7[1:0];
halfadd h131(sum13[2],carry13[0],sum7[2],carry7[0]);
fulladd f131(sum13[3],carry13[1],sum7[3],carry7[1],sum8[0]);
fulladd f1302(sum13[4],carry13[2],sum7[4],carry7[2],sum8[1]);
fulladd f1303(sum13[5],carry13[3],sum7[5],carry7[3],sum8[2]);
fulladd f1304(sum13[6],carry13[4],sum7[6],carry7[4],sum8[3]);
fulladd f1305(sum13[7],carry13[5],sum7[7],carry7[5],sum8[4]);
fulladd f1306(sum13[8],carry13[6],sum7[8],carry7[6],sum8[5]);
fulladd f1307(sum13[9],carry13[7],sum7[9],carry7[7],sum8[6]);
fulladd f1308(sum13[10],carry13[8],sum7[10],carry7[8],sum8[7]);
fulladd f1309(sum13[11],carry13[9],sum7[11],carry7[9],sum8[8]);
fulladd f1310(sum13[12],carry13[10],sum7[12],carry7[10],sum8[9]);
fulladd f1311(sum13[13],carry13[11],sum7[13],carry7[11],sum8[10]);
fulladd f1312(sum13[14],carry13[12],sum7[14],carry7[12],sum8[11]);
fulladd f1313(sum13[15],carry13[13],sum7[15],carry7[13],sum8[12]);
fulladd f1314(sum13[16],carry13[14],sum7[16],carry7[14],sum8[13]);
fulladd f1315(sum13[17],carry13[15],sum7[17],carry7[15],sum8[14]);
fulladd f1316(sum13[18],carry13[16],sum7[18],carry7[16],sum8[15]);
fulladd f1317(sum13[19],carry13[17],sum7[19],carry7[17],sum8[16]);
fulladd f1318(sum13[20],carry13[18],sum7[20],carry7[18],sum8[17]);
fulladd f1319(sum13[21],carry13[19],sum7[21],carry7[19],sum8[18]);
fulladd f1320(sum13[22],carry13[20],sum7[22],carry7[20],sum8[19]);
fulladd f1321(sum13[23],carry13[21],sum7[23],carry7[21],sum8[20]);
fulladd f1322(sum13[24],carry13[22],sum7[24],carry7[22],sum8[21]);
fulladd f1323(sum13[25],carry13[23],sum7[25],carry7[23],sum8[22]);
assign sum13[28:26]=sum8[25:23];

//csa 14

assign sum14[2:0]=sum9[2:0];
halfadd h141(sum14[3],carry14[0],sum9[3],carry9[0]);
halfadd h142(sum14[4],carry14[1],sum9[4],carry9[1]);
fulladd f1401(sum14[5],carry14[2],sum9[5],carry9[2],sum10[0]);
fulladd f1402(sum14[6],carry14[3],sum9[6],carry9[3],sum10[1]);
fulladd f1403(sum14[7],carry14[4],sum9[7],carry9[4],sum10[2]);
fulladd f1404(sum14[8],carry14[5],sum9[8],carry9[5],sum10[3]);
fulladd f1405(sum14[9],carry14[6],sum9[9],carry9[6],sum10[4]);
fulladd f1406(sum14[10],carry14[7],sum9[10],carry9[7],sum10[5]);
fulladd f1407(sum14[11],carry14[8],sum9[11],carry9[8],sum10[6]);
fulladd f1408(sum14[12],carry14[9],sum9[12],carry9[9],sum10[7]);
fulladd f1409(sum14[13],carry14[10],sum9[13],carry9[10],sum10[8]);
fulladd f1410(sum14[14],carry14[11],sum9[14],carry9[11],sum10[9]);
fulladd f1411(sum14[15],carry14[12],sum9[15],carry9[12],sum10[10]);
fulladd f1412(sum14[16],carry14[13],sum9[16],carry9[13],sum10[11]);
fulladd f1413(sum14[17],carry14[14],sum9[17],carry9[14],sum10[12]);
fulladd f1414(sum14[18],carry14[15],sum9[18],carry9[15],sum10[13]);
fulladd f1415(sum14[19],carry14[16],sum9[19],carry9[16],sum10[14]);
fulladd f1416(sum14[20],carry14[17],sum9[20],carry9[17],sum10[15]);
fulladd f1417(sum14[21],carry14[18],sum9[21],carry9[18],sum10[16]);
fulladd f1418(sum14[22],carry14[19],sum9[22],carry9[19],sum10[17]);
fulladd f1419(sum14[23],carry14[20],sum9[23],carry9[20],sum10[18]);
fulladd f1420(sum14[24],carry14[21],sum9[24],carry9[21],sum10[19]);
fulladd f1421(sum14[25],carry14[22],sum9[25],carry9[22],sum10[20]);
fulladd f1422(sum14[26],carry14[23],sum9[26],carry9[23],sum10[21]);
halfadd h143(sum14[27],carry14[24],sum9[27],sum10[22]);
halfadd h144(sum14[28],carry14[25],sum9[28],sum10[23]);
assign sum14[31:29]=sum10[26:24];

//csa 15

assign sum15[1:0]=carry10[1:0];
halfadd h151(sum15[2],carry15[0],carry10[2],sum11[0]);
halfadd h152(sum15[3],carry15[1],carry10[3],sum11[1]);
halfadd h153(sum15[4],carry15[2],carry10[4],sum11[2]);
fulladd f1501(sum15[5],carry15[3],carry10[5],sum11[3],carry11[0]);
fulladd f1502(sum15[6],carry15[4],carry10[6],sum11[4],carry11[1]);
fulladd f1503(sum15[7],carry15[5],carry10[7],sum11[5],carry11[2]);
fulladd f1504(sum15[8],carry15[6],carry10[8],sum11[6],carry11[3]);
fulladd f1505(sum15[9],carry15[7],carry10[9],sum11[7],carry11[4]);
fulladd f1506(sum15[10],carry15[8],carry10[10],sum11[8],carry11[5]);
fulladd f1507(sum15[11],carry15[9],carry10[11],sum11[9],carry11[6]);
fulladd f1508(sum15[12],carry15[10],carry10[12],sum11[10],carry11[7]);
fulladd f1509(sum15[13],carry15[11],carry10[13],sum11[11],carry11[8]);
fulladd f1510(sum15[14],carry15[12],carry10[14],sum11[12],carry11[9]);
fulladd f1511(sum15[15],carry15[13],carry10[15],sum11[13],carry11[10]);
fulladd f1512(sum15[16],carry15[14],carry10[16],sum11[14],carry11[11]);
fulladd f1513(sum15[17],carry15[15],carry10[17],sum11[15],carry11[12]);
fulladd f1514(sum15[18],carry15[16],carry10[18],sum11[16],carry11[13]);
fulladd f1515(sum15[19],carry15[17],carry10[19],sum11[17],carry11[14]);
fulladd f1516(sum15[20],carry15[18],carry10[20],sum11[18],carry11[15]);
fulladd f1517(sum15[21],carry15[19],carry10[21],sum11[19],carry11[16]);
fulladd f1518(sum15[22],carry15[20],carry10[22],sum11[20],carry11[17]);
fulladd f1519(sum15[23],carry15[21],carry10[23],sum11[21],carry11[18]);
fulladd f1520(sum15[24],carry15[22],carry10[24],sum11[22],carry11[19]);
fulladd f1521(sum15[25],carry15[23],carry10[25],sum11[23],carry11[20]);
halfadd h154(sum15[26],carry15[24],sum11[24],carry11[21]);
halfadd h155(sum15[27],carry15[25],sum11[25],carry11[22]);
halfadd h156(sum15[28],carry15[26],sum11[26],carry11[23]);
assign sum15[30:29]=sum11[28:27];

//csa 16

assign sum16[1:0]=sum12[1:0];
halfadd h161(sum16[2],carry16[0],sum12[2],carry12[0]);
halfadd h162(sum16[3],carry16[1],sum12[3],carry12[1]);
fulladd f1601(sum16[4],carry16[2],sum12[4],carry12[2],sum13[0]);
fulladd f1602(sum16[5],carry16[3],sum12[5],carry12[3],sum13[1]);
fulladd f1603(sum16[6],carry16[4],sum12[6],carry12[4],sum13[2]);
fulladd f1604(sum16[7],carry16[5],sum12[7],carry12[5],sum13[3]);
fulladd f1605(sum16[8],carry16[6],sum12[8],carry12[6],sum13[4]);
fulladd f1606(sum16[9],carry16[7],sum12[9],carry12[7],sum13[5]);
fulladd f1607(sum16[10],carry16[8],sum12[10],carry12[8],sum13[6]);
fulladd f1608(sum16[11],carry16[9],sum12[11],carry12[9],sum13[7]);
fulladd f1609(sum16[12],carry16[10],sum12[12],carry12[10],sum13[8]);
fulladd f1610(sum16[13],carry16[11],sum12[13],carry12[11],sum13[9]);
fulladd f1611(sum16[14],carry16[12],sum12[14],carry12[12],sum13[10]);
fulladd f1612(sum16[15],carry16[13],sum12[15],carry12[13],sum13[11]);
fulladd f1613(sum16[16],carry16[14],sum12[16],carry12[14],sum13[12]);
fulladd f1614(sum16[17],carry16[15],sum12[17],carry12[15],sum13[13]);
fulladd f1615(sum16[18],carry16[16],sum12[18],carry12[16],sum13[14]);
fulladd f1616(sum16[19],carry16[17],sum12[19],carry12[17],sum13[15]);
fulladd f1617(sum16[20],carry16[18],sum12[20],carry12[18],sum13[16]);
fulladd f1618(sum16[21],carry16[19],sum12[21],carry12[19],sum13[17]);
fulladd f1619(sum16[22],carry16[20],sum12[22],carry12[20],sum13[18]);
fulladd f1620(sum16[23],carry16[21],sum12[23],carry12[21],sum13[19]);
fulladd f1621(sum16[24],carry16[22],sum12[24],carry12[22],sum13[20]);
fulladd f1622(sum16[25],carry16[23],sum12[25],carry12[23],sum13[21]);
fulladd f1623(sum16[26],carry16[24],sum12[26],carry12[24],sum13[22]);
halfadd h163(sum16[27],carry16[25],carry12[25],sum13[23]);
assign sum16[32:28]=sum13[28:24];

//csa 18

assign sum18[3:0]=sum14[3:0];
halfadd h181(sum18[4],carry18[0],sum14[4],carry14[0]);
halfadd h182(sum18[5],carry18[1],sum14[5],carry14[1]);
halfadd h183(sum18[6],carry18[2],sum14[6],carry14[2]);
fulladd f1801(sum18[7],carry18[3],sum14[7],carry14[3],sum15[0]);
fulladd f1802(sum18[8],carry18[4],sum14[8],carry14[4],sum15[1]);
fulladd f1803(sum18[9],carry18[5],sum14[9],carry14[5],sum15[2]);
fulladd f1804(sum18[10],carry18[6],sum14[10],carry14[6],sum15[3]);
fulladd f1805(sum18[11],carry18[7],sum14[11],carry14[7],sum15[4]);
fulladd f1806(sum18[12],carry18[8],sum14[12],carry14[8],sum15[5]);
fulladd f1807(sum18[13],carry18[9],sum14[13],carry14[9],sum15[6]);
fulladd f1808(sum18[14],carry18[10],sum14[14],carry14[10],sum15[7]);
fulladd f1809(sum18[15],carry18[11],sum14[15],carry14[11],sum15[8]);
fulladd f1810(sum18[16],carry18[12],sum14[16],carry14[12],sum15[9]);
fulladd f1811(sum18[17],carry18[13],sum14[17],carry14[13],sum15[10]);
fulladd f1812(sum18[18],carry18[14],sum14[18],carry14[14],sum15[11]);
fulladd f1813(sum18[19],carry18[15],sum14[19],carry14[15],sum15[12]);
fulladd f1814(sum18[20],carry18[16],sum14[20],carry14[16],sum15[13]);
fulladd f1815(sum18[21],carry18[17],sum14[21],carry14[17],sum15[14]);
fulladd f1816(sum18[22],carry18[18],sum14[22],carry14[18],sum15[15]);
fulladd f1817(sum18[23],carry18[19],sum14[23],carry14[19],sum15[16]);
fulladd f1818(sum18[24],carry18[20],sum14[24],carry14[20],sum15[17]);
fulladd f1819(sum18[25],carry18[21],sum14[25],carry14[21],sum15[18]);
fulladd f1820(sum18[26],carry18[22],sum14[26],carry14[22],sum15[19]);
fulladd f1821(sum18[27],carry18[23],sum14[27],carry14[23],sum15[20]);
fulladd f1822(sum18[28],carry18[24],sum14[28],carry14[24],sum15[21]);
fulladd f1823(sum18[29],carry18[25],sum14[29],carry14[25],sum15[22]);
halfadd h184(sum18[30],carry18[26],sum14[30],sum15[23]);
halfadd h185(sum18[31],carry18[27],sum14[31],sum15[24]);
assign sum18[37:32]=sum15[30:25];

//csa 19

assign sum19[3:0]=carry15[3:0];
halfadd h191(sum19[4],carry19[0],carry15[4],sum16[0]);
halfadd h192(sum19[5],carry19[1],carry15[5],sum16[1]);
halfadd h193(sum19[6],carry19[2],carry15[6],sum16[2]);
fulladd f1901(sum19[7],carry19[3],carry15[7],sum16[3],carry16[0]);
fulladd f1902(sum19[8],carry19[4],carry15[8],sum16[4],carry16[1]);
fulladd f1903(sum19[9],carry19[5],carry15[9],sum16[5],carry16[2]);
fulladd f1904(sum19[10],carry19[6],carry15[10],sum16[6],carry16[3]);
fulladd f1905(sum19[11],carry19[7],carry15[11],sum16[7],carry16[4]);
fulladd f1906(sum19[12],carry19[8],carry15[12],sum16[8],carry16[5]);
fulladd f1907(sum19[13],carry19[9],carry15[13],sum16[9],carry16[6]);
fulladd f1908(sum19[14],carry19[10],carry15[14],sum16[10],carry16[7]);
fulladd f1909(sum19[15],carry19[11],carry15[15],sum16[11],carry16[8]);
fulladd f1910(sum19[16],carry19[12],carry15[16],sum16[12],carry16[9]);
fulladd f1911(sum19[17],carry19[13],carry15[17],sum16[13],carry16[10]);
fulladd f1912(sum19[18],carry19[14],carry15[18],sum16[14],carry16[11]);
fulladd f1913(sum19[19],carry19[15],carry15[19],sum16[15],carry16[12]);
fulladd f1914(sum19[20],carry19[16],carry15[20],sum16[16],carry16[13]);
fulladd f1915(sum19[21],carry19[17],carry15[21],sum16[17],carry16[14]);
fulladd f1916(sum19[22],carry19[18],carry15[22],sum16[18],carry16[15]);
fulladd f1917(sum19[23],carry19[19],carry15[23],sum16[19],carry16[16]);
fulladd f1918(sum19[24],carry19[20],carry15[24],sum16[20],carry16[17]);
fulladd f1919(sum19[25],carry19[21],carry15[25],sum16[21],carry16[18]);
fulladd f1920(sum19[26],carry19[22],carry15[26],sum16[22],carry16[19]);
halfadd h194(sum19[27],carry19[23],sum16[23],carry16[20]);
halfadd h195(sum19[28],carry19[24],sum16[24],carry16[21]);
halfadd h196(sum19[29],carry19[25],sum16[25],carry16[22]);
halfadd h197(sum19[30],carry19[26],sum16[26],carry16[23]);
halfadd h198(sum19[31],carry19[27],sum16[27],carry16[24]);
halfadd h199(sum19[32],carry19[28],sum16[28],carry16[25]);
assign sum19[36:33]=sum16[32:29];

//csa 20

assign sum20[4:0]=sum18[4:0];
halfadd h201(sum20[5],carry20[0],sum18[5],carry18[0]);
halfadd h202(sum20[6],carry20[1],sum18[6],carry18[1]);
halfadd h203(sum20[7],carry20[2],sum18[7],carry18[2]);
halfadd h204(sum20[8],carry20[3],sum18[8],carry18[3]);
halfadd h205(sum20[9],carry20[4],sum18[9],carry18[4]);
fulladd f2001(sum20[10],carry20[5],sum18[10],carry18[5],sum19[0]);
fulladd f2002(sum20[11],carry20[6],sum18[11],carry18[6],sum19[1]);
fulladd f2003(sum20[12],carry20[7],sum18[12],carry18[7],sum19[2]);
fulladd f2004(sum20[13],carry20[8],sum18[13],carry18[8],sum19[3]);
fulladd f2005(sum20[14],carry20[9],sum18[14],carry18[9],sum19[4]);
fulladd f2006(sum20[15],carry20[10],sum18[15],carry18[10],sum19[5]);
fulladd f2007(sum20[16],carry20[11],sum18[16],carry18[11],sum19[6]);
fulladd f2008(sum20[17],carry20[12],sum18[17],carry18[12],sum19[7]);
fulladd f2009(sum20[18],carry20[13],sum18[18],carry18[13],sum19[8]);
fulladd f2010(sum20[19],carry20[14],sum18[19],carry18[14],sum19[9]);
fulladd f2011(sum20[20],carry20[15],sum18[20],carry18[15],sum19[10]);
fulladd f2012(sum20[21],carry20[16],sum18[21],carry18[16],sum19[11]);
fulladd f2013(sum20[22],carry20[17],sum18[22],carry18[17],sum19[12]);
fulladd f2014(sum20[23],carry20[18],sum18[23],carry18[18],sum19[13]);
fulladd f2015(sum20[24],carry20[19],sum18[24],carry18[19],sum19[14]);
fulladd f2016(sum20[25],carry20[20],sum18[25],carry18[20],sum19[15]);
fulladd f2017(sum20[26],carry20[21],sum18[26],carry18[21],sum19[16]);
fulladd f2018(sum20[27],carry20[22],sum18[27],carry18[22],sum19[17]);
fulladd f2019(sum20[28],carry20[23],sum18[28],carry18[23],sum19[18]);
fulladd f2020(sum20[29],carry20[24],sum18[29],carry18[24],sum19[19]);
fulladd f2021(sum20[30],carry20[25],sum18[30],carry18[25],sum19[20]);
fulladd f2022(sum20[31],carry20[26],sum18[31],carry18[26],sum19[21]);
fulladd f2023(sum20[32],carry20[27],sum18[32],carry18[27],sum19[22]);
halfadd h2026(sum20[33],carry20[28],sum18[33],sum19[23]);
halfadd h207(sum20[34],carry20[29],sum18[34],sum19[24]);
halfadd h208(sum20[35],carry20[30],sum18[35],sum19[25]);
halfadd h209(sum20[36],carry20[31],sum18[36],sum19[26]);
halfadd h2010(sum20[37],carry20[32],sum18[37],sum19[27]);
assign sum20[46:38]=sum19[36:28];

//csa 21

assign sum21[5:0]=carry19[5:0];
halfadd h211(sum21[6],carry21[0],carry19[6],carry13[0]);
halfadd h212(sum21[7],carry21[1],carry19[7],carry13[1]);
fulladd f2101(sum21[8],carry21[2],carry19[8],carry13[2],carry8[0]);
fulladd f2102(sum21[9],carry21[3],carry19[9],carry13[3],carry8[1]);
fulladd f2103(sum21[10],carry21[4],carry19[10],carry13[4],carry8[2]);
fulladd f2104(sum21[11],carry21[5],carry19[11],carry13[5],carry8[3]);
fulladd f2105(sum21[12],carry21[6],carry19[12],carry13[6],carry8[4]);
fulladd f2106(sum21[13],carry21[7],carry19[13],carry13[7],carry8[5]);
fulladd f2107(sum21[14],carry21[8],carry19[14],carry13[8],carry8[6]);
fulladd f2108(sum21[15],carry21[9],carry19[15],carry13[9],carry8[7]);
fulladd f2109(sum21[16],carry21[10],carry19[16],carry13[10],carry8[8]);
fulladd f2110(sum21[17],carry21[11],carry19[17],carry13[11],carry8[9]);
fulladd f2111(sum21[18],carry21[12],carry19[18],carry13[12],carry8[10]);
fulladd f2112(sum21[19],carry21[13],carry19[19],carry13[13],carry8[11]);
fulladd f2113(sum21[20],carry21[14],carry19[20],carry13[14],carry8[12]);
fulladd f2114(sum21[21],carry21[15],carry19[21],carry13[15],carry8[13]);
fulladd f2115(sum21[22],carry21[16],carry19[22],carry13[16],carry8[14]);
fulladd f2116(sum21[23],carry21[17],carry19[23],carry13[17],carry8[15]);
fulladd f2117(sum21[24],carry21[18],carry19[24],carry13[18],carry8[16]);
fulladd f2118(sum21[25],carry21[19],carry19[25],carry13[19],carry8[17]);
fulladd f2119(sum21[26],carry21[20],carry19[26],carry13[20],carry8[18]);
fulladd f2120(sum21[27],carry21[21],carry19[27],carry13[21],carry8[19]);
fulladd f2121(sum21[28],carry21[22],carry19[28],carry13[22],carry8[20]);
halfadd h213(sum21[29],carry21[23],carry13[23],carry8[21]);
assign sum21[31:30] = carry8[23:22];


//csa 22

assign sum22[5:0]=sum20[5:0];
halfadd h221(sum22[6],carry22[0],sum20[6],carry20[0]);
halfadd h222(sum22[7],carry22[1],sum20[7],carry20[1]);
halfadd h223(sum22[8],carry22[2],sum20[8],carry20[2]);
halfadd h224(sum22[9],carry22[3],sum20[9],carry20[3]);
halfadd h225(sum22[10],carry22[4],sum20[10],carry20[4]);
halfadd h226(sum22[11],carry22[5],sum20[11],carry20[5]);
halfadd h227(sum22[12],carry22[6],sum20[12],carry20[6]);
halfadd h228(sum22[13],carry22[7],sum20[13],carry20[7]);
halfadd h229(sum22[14],carry22[8],sum20[14],carry20[8]);
fulladd f2201(sum22[15],carry22[9],sum20[15],carry20[9],sum21[0]);
fulladd f2202(sum22[16],carry22[10],sum20[16],carry20[10],sum21[1]);
fulladd f2203(sum22[17],carry22[11],sum20[17],carry20[11],sum21[2]);
fulladd f2204(sum22[18],carry22[12],sum20[18],carry20[12],sum21[3]);
fulladd f2205(sum22[19],carry22[13],sum20[19],carry20[13],sum21[4]);
fulladd f2206(sum22[20],carry22[14],sum20[20],carry20[14],sum21[5]);
fulladd f2207(sum22[21],carry22[15],sum20[21],carry20[15],sum21[6]);
fulladd f2208(sum22[22],carry22[16],sum20[22],carry20[16],sum21[7]);
fulladd f2209(sum22[23],carry22[17],sum20[23],carry20[17],sum21[8]);
fulladd f2210(sum22[24],carry22[18],sum20[24],carry20[18],sum21[9]);
fulladd f2211(sum22[25],carry22[19],sum20[25],carry20[19],sum21[10]);
fulladd f2212(sum22[26],carry22[20],sum20[26],carry20[20],sum21[11]);
fulladd f2213(sum22[27],carry22[21],sum20[27],carry20[21],sum21[12]);
fulladd f2214(sum22[28],carry22[22],sum20[28],carry20[22],sum21[13]);
fulladd f2215(sum22[29],carry22[23],sum20[29],carry20[23],sum21[14]);
fulladd f2216(sum22[30],carry22[24],sum20[30],carry20[24],sum21[15]);
fulladd f2217(sum22[31],carry22[25],sum20[31],carry20[25],sum21[16]);
fulladd f2218(sum22[32],carry22[26],sum20[32],carry20[26],sum21[17]);
fulladd f2219(sum22[33],carry22[27],sum20[33],carry20[27],sum21[18]);
fulladd f2220(sum22[34],carry22[28],sum20[34],carry20[28],sum21[19]);
fulladd f2221(sum22[35],carry22[29],sum20[35],carry20[29],sum21[20]);
fulladd f2222(sum22[36],carry22[30],sum20[36],carry20[30],sum21[21]);
fulladd f2223(sum22[37],carry22[31],sum20[37],carry20[31],sum21[22]);
fulladd f2224(sum22[38],carry22[32],sum20[38],carry20[32],sum21[23]);
halfadd h2210(sum22[39],carry22[33],sum20[39],sum21[24]);
halfadd h2211(sum22[40],carry22[34],sum20[40],sum21[25]);
halfadd h2212(sum22[41],carry22[35],sum20[41],sum21[26]);
halfadd h2213(sum22[42],carry22[36],sum20[42],sum21[27]);
halfadd h2214(sum22[43],carry22[37],sum20[43],sum21[28]);
halfadd h2215(sum22[44],carry22[38],sum20[44],sum21[29]);
halfadd h2216(sum22[45],carry22[39],sum20[45],sum21[30]);
halfadd h2217(sum22[46],carry22[40],sum20[46],sum21[31]);

//csa 23

assign sum23[6:0]=sum22[6:0];
halfadd h231(sum23[7],carry23[0],sum22[7],carry22[0]);
halfadd h232(sum23[8],carry23[1],sum22[8],carry22[1]);
halfadd h233(sum23[9],carry23[2],sum22[9],carry22[2]);
halfadd h234(sum23[10],carry23[3],sum22[10],carry22[3]);
halfadd h235(sum23[11],carry23[4],sum22[11],carry22[4]);
halfadd h236(sum23[12],carry23[5],sum22[12],carry22[5]);
halfadd h237(sum23[13],carry23[6],sum22[13],carry22[6]);
halfadd h238(sum23[14],carry23[7],sum22[14],carry22[7]);
halfadd h239(sum23[15],carry23[8],sum22[15],carry22[8]);
halfadd h2310(sum23[16],carry23[9],sum22[16],carry22[9]);
halfadd h2311(sum23[17],carry23[10],sum22[17],carry22[10]);
halfadd h2312(sum23[18],carry23[11],sum22[18],carry22[11]);
halfadd h2313(sum23[19],carry23[12],sum22[19],carry22[12]);
halfadd h2314(sum23[20],carry23[13],sum22[20],carry22[13]);
halfadd h2315(sum23[21],carry23[14],sum22[21],carry22[14]);
fulladd f2301(sum23[22],carry23[15],sum22[22],carry22[15],carry21[0]);
fulladd f2302(sum23[23],carry23[16],sum22[23],carry22[16],carry21[1]);
fulladd f2303(sum23[24],carry23[17],sum22[24],carry22[17],carry21[2]);
fulladd f2304(sum23[25],carry23[18],sum22[25],carry22[18],carry21[3]);
fulladd f2305(sum23[26],carry23[19],sum22[26],carry22[19],carry21[4]);
fulladd f2306(sum23[27],carry23[20],sum22[27],carry22[20],carry21[5]);
fulladd f2307(sum23[28],carry23[21],sum22[28],carry22[21],carry21[6]);
fulladd f2308(sum23[29],carry23[22],sum22[29],carry22[22],carry21[7]);
fulladd f2309(sum23[30],carry23[23],sum22[30],carry22[23],carry21[8]);
fulladd f2310(sum23[31],carry23[24],sum22[31],carry22[24],carry21[9]);
fulladd f2311(sum23[32],carry23[25],sum22[32],carry22[25],carry21[10]);
fulladd f2312(sum23[33],carry23[26],sum22[33],carry22[26],carry21[11]);
fulladd f2313(sum23[34],carry23[27],sum22[34],carry22[27],carry21[12]);
fulladd f2314(sum23[35],carry23[28],sum22[35],carry22[28],carry21[13]);
fulladd f2315(sum23[36],carry23[29],sum22[36],carry22[29],carry21[14]);
fulladd f2316(sum23[37],carry23[30],sum22[37],carry22[30],carry21[15]);
fulladd f2317(sum23[38],carry23[31],sum22[38],carry22[31],carry21[16]);
fulladd f2318(sum23[39],carry23[32],sum22[39],carry22[32],carry21[17]);
fulladd f2319(sum23[40],carry23[33],sum22[40],carry22[33],carry21[18]);
fulladd f2320(sum23[41],carry23[34],sum22[41],carry22[34],carry21[19]);
fulladd f2321(sum23[42],carry23[35],sum22[42],carry22[35],carry21[20]);
fulladd f2322(sum23[43],carry23[36],sum22[43],carry22[36],carry21[21]);
fulladd f2323(sum23[44],carry23[37],sum22[44],carry22[37],carry21[22]);
fulladd f2324(sum23[45],carry23[38],sum22[45],carry22[38],carry21[23]);
halfadd h2316(sum23[46],carry23[39],sum22[46],carry22[39]);
assign sum23[47]  = carry22[40];

//cla 

assign r1[7:0]=sum23[7:0];
recurse40 ckck40(r1[47:8],c_in19,sum23[47:8],carry23[39:0]);

wire ms1;

assign ms1=as^bs;

wire [7:0] exp,exp1,exp2,exp3;
wire cr1,cr2,cr3,cr4;

recurse8 r81(exp,cr1,ae,8'b10000001);
recurse8 r82(exp1,cr2,exp,be);
recurse8 r83(exp2,cr3,ae,8'b10000010);
recurse8 r84(exp3,cr4,exp2,be);

reg [7:0] me;
reg [23:0] m;
reg ms;

always@(exp1 or exp3 or r1 or a or b or ms1)
	begin
		if(r1[47]==1'b1 && a!=24'b000 && b!=24'b0000)
			begin
				m[23:0]=r1[47:24];
				me[7:0]=exp3;
				ms=ms1;
			end
		else if(r1[47]==1'b0 && a!=24'b000 && b!=24'b0000)
			begin
				m[23:0]=r1[46:23];
				me[7:0]=exp1;
				ms=ms1;
			end
		else if (a==24'b0000 || b==24'b00000)
			begin
			   m[23:0]=24'b000;
			   me[7:0]=8'b0000;
			   ms=1'b0;
		   end
	end

endmodule

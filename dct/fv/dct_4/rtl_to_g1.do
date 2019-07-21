// Generated by Cadence Encounter(R) RTL Compiler v11.20-s017_1
tclmode
set env(RC_VERSION) "v11.20-s017_1"
vpxmode
set dofile abort exit
usage -auto
set log file fv/dct_4/rtl_to_g1.log -replace
// tclmode
// set env(CDN_SYNTH_ROOT) /home/cadence_tools/cadence/ET12.10.101_lnx86/tools.lnx86
// vpxmode

tclmode
puts "Start: Reading OVF file"
vpx read guide file fv/dct_4/rtl_to_g1.ovf
puts "End: Reading OVF file"
vpxmode

tclmode
set ver [lindex [split [lindex [get_version_info] 0] "-"] 0]
if {$ver >= 08.10} {
  vpx set naming style rc
}
vpxmode
set naming rule "%s[%d]" -instance_array
set naming rule "%s_reg" -register -golden
set naming rule "%L.%s" "%L[%d].%s" "%s" -instance
set naming rule "%L.%s" "%L[%d].%s" "%s" -variable
set undefined cell black_box -noascend -both
set undriven signal Z -golden

add search path -library /root/cadence_db/cadence_library
read library -statetable -liberty -pg_pin -both  \
	tcbn45gsbwpbc0d88_ccs.lib

add search path -design /root/Desktop/RRP/dct
read design  -verilog -define SYNTHESIS  -golden -lastmod -noelab \
	/root/Desktop/RRP/dct/dct_4.v \
	/root/Desktop/RRP/dct/float_adder.v \
	/root/Desktop/RRP/dct/wallacer2.v \
	/root/Desktop/RRP/dct/fulladd.v \
	/root/Desktop/RRP/dct/halfadd.v \
	/root/Desktop/RRP/dct/recurse40.v \
	/root/Desktop/RRP/dct/recurse.v \
	/root/Desktop/RRP/dct/recurse8.v \
	/root/Desktop/RRP/dct/kgp.v \
	/root/Desktop/RRP/dct/kgp_carry.v \
	/root/Desktop/RRP/dct/recursive_stage1.v

elaborate design -golden -root dct_4

read design -verilog -revised -lastmod -noelab \
	-unzip fv/dct_4/g1.v.gz

elaborate design -revised -root dct_4

substitute blackbox model -golden
report design data
report black box

tclmode
puts "Start: Analyze and apply OVF transformations"
vpx apply guided transformations
vpx report guide information
puts "End: Analyze and apply OVF transformations"
vpxmode


uniquify -all -nolib
set flatten model -latch_transparent
set flatten model -seq_constant -seq_constant_x_to 0
set flatten model -nodff_to_dlat_zero -nodff_to_dlat_feedback
// set parallel option -threads 4 -license xl
set analyze option -auto

write hier_compare dofile fv/dct_4/hier_rtl_to_g1.do \
	-noexact_pin_match -constraint -usage -replace -run_hier \
	-prepend_string "analyze datapath -module -verbose; usage; analyze datapath -verbose"
run hier_compare fv/dct_4/hier_rtl_to_g1.do
usage
// report hier_compare result -flattened
set system mode lec
tclmode
puts "No of diff points    = [get_compare_points -diff -count]"
if {[get_compare_points -diff -count] > 0} {
    puts "------------------------------------"
    puts "ERROR: Different Key Points detected"
    puts "------------------------------------"
#     foreach i [get_compare_points -diff] {
#         vpx report test vector [get_keypoint $i]
#         puts "     ----------------------------"
#     }
}
vpxmode
exit -force

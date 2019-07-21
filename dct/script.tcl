##RC procedure

set_attribute lib_search_path /root/cadence_db/cadence_library
set_attribute hdl_search_path /root/Desktop/RRP/dct
set_attribute library tcbn45gsbwpbc0d88_ccs.lib

##whole processor

read_hdl {dct_4.v float_adder.v wallacer2.v fulladd.v halfadd.v recurse40.v recurse.v recurse8.v kgp.v kgp_carry.v recursive_stage1.v}

elaborate

synthesize -to_mapped 

gui_show



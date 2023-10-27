create_pblock pblock_new1
add_cells_to_pblock [get_pblocks pblock_new1] [get_cells -quiet [list RO_0 RO_1 RO_2 RO_3 RO_4 RO_5 RO_6 RO_7 RO_8]]
resize_pblock [get_pblocks pblock_new1] -add {CLOCKREGION_X0Y0:CLOCKREGION_X0Y0}
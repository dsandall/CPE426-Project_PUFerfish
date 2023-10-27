create_pblock pblock_new3
add_cells_to_pblock [get_pblocks pblock_new3] [get_cells -quiet [list RO_0 RO_1 RO_2 RO_3 RO_4 RO_5 RO_6 RO_7 RO_8]]
resize_pblock [get_pblocks pblock_new3] -add {CLOCKREGION_X1Y2:CLOCKREGION_X1Y2}

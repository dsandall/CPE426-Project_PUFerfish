

create_pblock pblock_new2
add_cells_to_pblock [get_pblocks pblock_new2] [get_cells -quiet [list RO_0 RO_1 RO_2 RO_3 RO_4 RO_5 RO_6 RO_7 RO_8]]
resize_pblock [get_pblocks pblock_new2] -add {CLOCKREGION_X0Y2:CLOCKREGION_X0Y2}

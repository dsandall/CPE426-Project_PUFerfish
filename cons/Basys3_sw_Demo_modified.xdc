## Enable Security Wizardry
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_0/RO/slice0/muxA]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_1/RO/slice0/muxA]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_2/RO/slice0/muxA]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_3/RO/slice0/muxA]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_4/RO/slice0/muxA]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_5/RO/slice0/muxA]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_6/RO/slice0/muxA]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_7/RO/slice0/muxA]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets RO_8/RO/slice0/muxA]


##Buttons
set_property PACKAGE_PIN U18 [get_ports BTNC]
	set_property IOSTANDARD LVCMOS33 [get_ports BTNC]
#set_property PACKAGE_PIN T18 [get_ports btnU]
	#set_property IOSTANDARD LVCMOS33 [get_ports btnU]
#set_property PACKAGE_PIN W19 [get_ports BTNL]
	#set_property IOSTANDARD LVCMOS33 [get_ports BTNL]
#set_property PACKAGE_PIN T17 [get_ports btnR]
	#set_property IOSTANDARD LVCMOS33 [get_ports btnR]
#set_property PACKAGE_PIN U17 [get_ports btnD]
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
	
## Switches
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property PACKAGE_PIN V2 [get_ports {sw[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
set_property PACKAGE_PIN T3 [get_ports {sw[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
set_property PACKAGE_PIN T2 [get_ports {sw[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
set_property PACKAGE_PIN R3 [get_ports {sw[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
set_property PACKAGE_PIN W2 [get_ports {sw[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
set_property PACKAGE_PIN U1 [get_ports {sw[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property PACKAGE_PIN T1 [get_ports {sw[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
set_property PACKAGE_PIN R2 [get_ports {sw[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property PACKAGE_PIN V3 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property PACKAGE_PIN W3 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property PACKAGE_PIN U3 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property PACKAGE_PIN P3 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property PACKAGE_PIN N3 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property PACKAGE_PIN P1 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property PACKAGE_PIN L1 [get_ports {led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]

## Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK]
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	##create_clock -add -name sys_clk_pin -period 50.00 -waveform {0 5} [get_ports CLK]
	
#7 segment display
# seg[7], seg[6]... seg[0] is a, b...  dp
set_property PACKAGE_PIN W7 [get_ports {segs[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs[7]}]
set_property PACKAGE_PIN W6 [get_ports {segs[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs[6]}]
set_property PACKAGE_PIN U8 [get_ports {segs[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs[5]}]
set_property PACKAGE_PIN V8 [get_ports {segs[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs[4]}]
set_property PACKAGE_PIN U5 [get_ports {segs[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs[3]}]
set_property PACKAGE_PIN V5 [get_ports {segs[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs[2]}]
set_property PACKAGE_PIN U7 [get_ports {segs[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segs[1]}]
set_property PACKAGE_PIN V7 [get_ports {segs[0]}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {segs[0]}]
# seg[0] is the radix point (decimal point, or dp)

set_property PACKAGE_PIN U2 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
set_property PACKAGE_PIN U4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN V4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN W4 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]

create_pblock pblock_1
add_cells_to_pblock [get_pblocks pblock_1] [get_cells -quiet [list {led_OBUF[3]_inst}]]
create_pblock pblock_2
add_cells_to_pblock [get_pblocks pblock_2] [get_cells -quiet [list {led_OBUF[15]_inst}]]
create_pblock pblock_3
add_cells_to_pblock [get_pblocks pblock_3] [get_cells -quiet [list {sw_IBUF[1]_inst}]]
create_pblock pblock_4
add_cells_to_pblock [get_pblocks pblock_4] [get_cells -quiet [list {sw_IBUF[4]_inst}]]
create_pblock pblock_5
add_cells_to_pblock [get_pblocks pblock_5] [get_cells -quiet [list {sw_IBUF[7]_inst}]]
create_pblock pblock_6
add_cells_to_pblock [get_pblocks pblock_6] [get_cells -quiet [list {led_OBUF[6]_inst}]]
create_pblock pblock_7
add_cells_to_pblock [get_pblocks pblock_7] [get_cells -quiet [list {led_OBUF[4]_inst}]]
create_pblock pblock_8
add_cells_to_pblock [get_pblocks pblock_8] [get_cells -quiet [list {led_OBUF[8]_inst}]]
create_pblock pblock_9
add_cells_to_pblock [get_pblocks pblock_9] [get_cells -quiet [list {led_OBUF[10]_inst}]]
create_pblock pblock_10
add_cells_to_pblock [get_pblocks pblock_10] [get_cells -quiet [list {led_OBUF[14]_inst}]]
create_pblock pblock_11
add_cells_to_pblock [get_pblocks pblock_11] [get_cells -quiet [list {sw_IBUF[3]_inst}]]
create_pblock pblock_12
add_cells_to_pblock [get_pblocks pblock_12] [get_cells -quiet [list {sw_IBUF[11]_inst}]]
create_pblock pblock_13
add_cells_to_pblock [get_pblocks pblock_13] [get_cells -quiet [list {sw_IBUF[6]_inst}]]
create_pblock pblock_14
add_cells_to_pblock [get_pblocks pblock_14] [get_cells -quiet [list {sw_IBUF[9]_inst}]]
create_pblock pblock_15
add_cells_to_pblock [get_pblocks pblock_15] [get_cells -quiet [list {sw_IBUF[10]_inst}]]
create_pblock pblock_16
add_cells_to_pblock [get_pblocks pblock_16] [get_cells -quiet [list {led_OBUF[1]_inst}]]
create_pblock pblock_17
add_cells_to_pblock [get_pblocks pblock_17] [get_cells -quiet [list {led_OBUF[7]_inst}]]
create_pblock pblock_18
add_cells_to_pblock [get_pblocks pblock_18] [get_cells -quiet [list {led_OBUF[13]_inst}]]
create_pblock pblock_19
add_cells_to_pblock [get_pblocks pblock_19] [get_cells -quiet [list {sw_IBUF[0]_inst}]]
create_pblock pblock_20
add_cells_to_pblock [get_pblocks pblock_20] [get_cells -quiet [list {sw_IBUF[15]_inst}]]
create_pblock pblock_21
add_cells_to_pblock [get_pblocks pblock_21] [get_cells -quiet [list {led_OBUF[2]_inst}]]
create_pblock pblock_22
add_cells_to_pblock [get_pblocks pblock_22] [get_cells -quiet [list {led_OBUF[0]_inst}]]
create_pblock pblock_23
add_cells_to_pblock [get_pblocks pblock_23] [get_cells -quiet [list {led_OBUF[5]_inst}]]
create_pblock pblock_24
add_cells_to_pblock [get_pblocks pblock_24] [get_cells -quiet [list {led_OBUF[9]_inst}]]
create_pblock pblock_25
add_cells_to_pblock [get_pblocks pblock_25] [get_cells -quiet [list {sw_IBUF[12]_inst}]]
create_pblock pblock_26
add_cells_to_pblock [get_pblocks pblock_26] [get_cells -quiet [list {led_OBUF[11]_inst}]]
create_pblock pblock_27
add_cells_to_pblock [get_pblocks pblock_27] [get_cells -quiet [list {led_OBUF[12]_inst}]]
create_pblock pblock_28
add_cells_to_pblock [get_pblocks pblock_28] [get_cells -quiet [list {sw_IBUF[2]_inst}]]
create_pblock pblock_29
add_cells_to_pblock [get_pblocks pblock_29] [get_cells -quiet [list {sw_IBUF[13]_inst}]]
create_pblock pblock_30
add_cells_to_pblock [get_pblocks pblock_30] [get_cells -quiet [list {sw_IBUF[5]_inst}]]
create_pblock pblock_31
add_cells_to_pblock [get_pblocks pblock_31] [get_cells -quiet [list {sw_IBUF[14]_inst}]]
create_pblock pblock_32
add_cells_to_pblock [get_pblocks pblock_32] [get_cells -quiet [list {sw_IBUF[8]_inst}]]

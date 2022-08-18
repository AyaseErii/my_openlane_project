# User config
set ::env(DESIGN_NAME) fpga_core

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/blackboxs/*.v]
set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/lef/*.lef]
set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/gds/*.gds]

# Fill this
set ::env(CLOCK_PERIOD) "10.0"
set ::env(CLOCK_NET) "prog_clk"
set ::env(CLOCK_PORT) "prog_clk"

#set ::env(FP_CORE_UTIL) "10"

#set ::env(PL_MACRO_CHANNEL) {40 40}
#set ::env(PL_MACRO_HALO) {40 40}

set ::env(MACRO_PLACEMENT_CFG) $::env(DESIGN_DIR)/macro_placement.cfg

#set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 0


# Area Configurations
set ::env(FP_SIZING) "absolute"
#set ::env(DIE_AREA) "0 0 2920 3520"
#set ::env(DIE_AREA) "0 0 8000 8500"
set ::env(DIE_AREA) "0 0 3200 3400"
#set ::env(DIE_AREA) "0 0 4000 4200"


#set ::env(FP_DEF_TEMPLATE) [glob $::env(DESIGN_DIR)/def/*.def]

set ::env(SYNTH_READ_BLACKBOX_LIB) 1

#set ::env(FILL_INSERTION) 0

# PDN
set ::env(DESIGN_IS_CORE) 1
set ::env(FP_PDN_CORE_RING) 1
#set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
#set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]
# The power connections
set ::env(VDD_NETS) [list {VPWR}]
set ::env(GND_NETS) [list {VGND}]
# The vertical sides width of the core rings
set ::env(FP_PDN_CORE_RING_VWIDTH) 3 
# The horizontal sides width of the core rings
set ::env(FP_PDN_CORE_RING_HWIDTH) $::env(FP_PDN_CORE_RING_VWIDTH) 
# The vertical sides offset from the design boundaries for the core rings
set ::env(FP_PDN_CORE_RING_VOFFSET) 14 
# The horizontal sides offset from the design boundaries for the core rings
set ::env(FP_PDN_CORE_RING_HOFFSET) $::env(FP_PDN_CORE_RING_VOFFSET) 
# The vertical spacing between the core ring straps
set ::env(FP_PDN_CORE_RING_VSPACING) 1.7 
# The horizontal spacing between the core ring straps
set ::env(FP_PDN_CORE_RING_HSPACING) $::env(FP_PDN_CORE_RING_VSPACING)
# The next values should be added as-is to control the starting point for looping over the core rings and recalculating the new offset for each core ring
set ::env(FP_PDN_VSPACING) [expr 5*$::env(FP_PDN_CORE_RING_VWIDTH)]
set ::env(FP_PDN_HSPACING) [expr 5*$::env(FP_PDN_CORE_RING_HWIDTH)]
# The width of the vertical straps
set ::env(FP_PDN_VWIDTH) 3 
# The width of the horizontal straps
set ::env(FP_PDN_HWIDTH) 3 
# The vertical offset for the straps
set ::env(FP_PDN_VOFFSET) 0 
# The horizontal offset for the straps
set ::env(FP_PDN_HOFFSET) $::env(FP_PDN_VOFFSET) 
#The pitch between the vertical straps
set ::env(FP_PDN_VPITCH) 180 
# The pitch between the horizontal straps
set ::env(FP_PDN_HPITCH) $::env(FP_PDN_VPITCH)

set ::env(PL_BASIC_PLACEMENT) 1

#set ::env(FP_WELLTAP_CELL) "sky130_fd_sc_hd__tapvpwrvgnd_1"
#set ::env(FP_ENDCAP_CELL) "sky130_fd_sc_hd__decap_3"


#set ::env(DIODE_INSERTION_STRATEGY) 0

#set ::env(RT_MAX_LAYER) "met4"

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}


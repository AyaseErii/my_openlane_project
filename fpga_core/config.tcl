# User config
set ::env(DESIGN_NAME) fpga_core

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/blackboxs/*.v]
set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/lef/*.lef]
set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/gds/*.gds]

# Fill this
set ::env(CLOCK_PERIOD) "10.0"
set ::env(CLOCK_PORT) "clk"

#set ::env(FP_CORE_UTIL) "10"


# Area Configurations
set ::env(FP_SIZING) absolute
#set ::env(DIE_AREA) "0 0 2920 3520"
set ::env(DIE_AREA) "0 0 8000 8500"

set ::env(PL_MACRO_CHANNEL) {40 40}
set ::env(PL_MACRO_HALO) {40 40}

#set ::env(FP_DEF_TEMPLATE) [glob $::env(DESIGN_DIR)/def/*.def]

set ::env(SYNTH_READ_BLACKBOX_LIB) 1

# PDN
set ::env(DESIGN_IS_CORE) 1
set ::env(FP_PDN_CORE_RING) 1

set ::env(DIODE_INSERTION_STRATEGY) 4

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}


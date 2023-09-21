# add source tcl file:
#	QuestaSim> source C:/Users/PM/Documents/GitHub/BUS_UVM/qsim/qsim.tcl  # source <dir>/<project_name>/qsim/qsim.tcl
#
# run complile command (aliase)
#	QuestaSim> c_all

proc create_library { lib_name } {
    if { [ file exist ${lib_name} ] } {
	puts "   Library '${lib_name}' already exists"
    } else {
	puts "   Library '${lib_name}' doesn't exist, create using command line:\n   eval \"vlib ${lib_name}\"\n"
	eval "vlib ${lib_name}"
    }
}

set prjPath   "C:/Users/PM/Documents/GitHub/BUS_UVM"

set srcPath   "${prjPath}/src"

set busPath   "${srcPath}/bus"

set sppPath   "${srcPath}/spp"
set rtlPath   "${sppPath}/rtl"

set utlPath   "${srcPath}/util"
set basPath   "${utlPath}/base"

set tstPath   "${prjPath}/test"

set xlib xwork
if { ![ file exist $xlib ] } { vlib $xlib }
set lib_list $xlib

set VLOG_INC " +incdir+${srcPath}"
set VLOG_CMD "vlog -O0 -incr -mfcu -sv -work $xlib"
set VSIM_CMD "vsim -voptargs=+acc"

#  Clear Transcript and Console
alias clear {
	.main clear
}

# Compile UTIL
alias c_dut {
    puts "\n--------------- Compile DUT"

	create_library ${xlib}
    set v_inc ${VLOG_INC}
    append v_inc " +incdir+${rtlPath}"

    set v_cmd ${VLOG_CMD}
    append v_cmd ${v_inc}


    eval "${v_cmd} ${rtlPath}/module__sync.sv"

    puts "--------------- Compile DUT - END\n"
}

# Compile TOP
alias c_top {
	puts "--------------- Compile TOP"

create_library ${xlib}

	set v_inc ${VLOG_INC}
	append v_inc " +incdir+${busPath}"
	append v_inc " +incdir+${sppPath}"
	append v_inc " +incdir+${rtlPath}"
	append v_inc " +incdir+${utlPath}"
	append v_inc " +incdir+${basPath}"
	append v_inc " +incdir+${tstPath}"

	set v_cmd ${VLOG_CMD}
	append v_cmd ${v_inc}

	eval "${v_cmd} ${busPath}/memory_inf.sv"
	eval "${v_cmd} ${basPath}/base_macros.svh"
	eval "${v_cmd} ${basPath}/package__base.sv"
	eval "${v_cmd} ${busPath}/package__bus.sv"
	eval "${v_cmd} ${tstPath}/bus_testbench.sv"
	
	puts "--------------- Compile TOP - END\n"
}

# Compile
alias c_all {
    set start_compile [clock seconds]
	puts "--------------- Start compile at: [clock format $start_compile -format {%d.%m.%Y %H:%M:%S}]\n"


	c_dut
	c_top
	set end_compile [clock seconds]
	puts "--------------- End compile at: [clock format $end_compile -format {%d.%m.%Y %H:%M:%S}]"
}

alias ld {
    eval "vsim -voptargs=+acc ${xlib}.top +UVM_TESTNAME=bus_sample_test"
}

alias rl {
    restart -force
}

alias rn {
    log -r /*
    run -all
}

alias rr {
    rl
    rn
}

alias rt {
    c_tst
    rr
}

alias ry {
    c_xml
    rr
}

alias rx {
    c_all
    rr
}

alias aw {

    if {[ file exist ${prjPath}/qsim/wave.do ]} {
	puts "--------------- Opening wave.do "
	do ${prjPath}/qsim/wave.do
    }
}

alias dq {
    do qsim.tcl
}

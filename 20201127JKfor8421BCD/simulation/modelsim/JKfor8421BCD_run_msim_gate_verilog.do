transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {JKfor8421BCD.vo}

vlog -vlog01compat -work work +incdir+D:/QuartusProjects/20201127JKfor8421BCD {D:/QuartusProjects/20201127JKfor8421BCD/Test.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  Cnt8421_vlg_tst

add wave *
view structure
view signals
run -all

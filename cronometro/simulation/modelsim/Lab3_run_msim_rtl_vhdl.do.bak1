transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/lucas/reconfigurable-logic/cronometro/cont4_mod10.vhd}
vcom -93 -work work {C:/Users/lucas/reconfigurable-logic/cronometro/bcd_display.vhd}
vcom -93 -work work {C:/Users/lucas/reconfigurable-logic/cronometro/Lab3.vhd}

vcom -93 -work work {C:/Users/lucas/reconfigurable-logic/cronometro/Lab3_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  Lab3_TB

add wave *
view structure
view signals
run 2 sec

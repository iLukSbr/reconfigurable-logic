transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {Lab3.vho}

vcom -93 -work work {C:/Users/lucas/reconfigurable-logic/cronometro/Lab3_TB.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /UUT=Lab3_vhd.sdo -L cycloneii -L gate_work -L work -voptargs="+acc"  Lab3_TB

add wave *
view structure
view signals
run 2 sec

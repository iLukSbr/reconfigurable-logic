transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {cont_57.vho}

vcom -93 -work work {C:/Users/lucas/reconfigurable-logic/cont_57/cont_57_tb.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /DUT=cont_57_vhd.sdo -L cycloneii -L gate_work -L work -voptargs="+acc"  cont_57_tb

add wave *
view structure
view signals
run 10 sec

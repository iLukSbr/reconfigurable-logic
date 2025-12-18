transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/altera/13.0sp1/reconfigurable-logic/fifo/FIFO.vhd}
vcom -93 -work work {C:/altera/13.0sp1/reconfigurable-logic/fifo/BRAM_Origem.vhd}
vcom -93 -work work {C:/altera/13.0sp1/reconfigurable-logic/fifo/BRAM_Destino.vhd}
vcom -93 -work work {C:/altera/13.0sp1/reconfigurable-logic/fifo/WriteController.vhd}
vcom -93 -work work {C:/altera/13.0sp1/reconfigurable-logic/fifo/ReadController.vhd}
vcom -93 -work work {C:/altera/13.0sp1/reconfigurable-logic/fifo/FlowControlTop.vhd}

vcom -93 -work work {C:/altera/13.0sp1/reconfigurable-logic/fifo/FlowControlTop_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  FlowControlTop_tb

add wave *
view structure
view signals
run 100 ms

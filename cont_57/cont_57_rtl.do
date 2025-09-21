# Simulação RTL

# Limpa a pasta de trabalho
if {[file exists work]} { vdel -lib work -all }
vlib work
vmap work work

# Compila os arquivos fonte
vcom div_clk.vhd
vcom cont_up_mod16.vhd
vcom bcd_display.vhd
vcom cont_57.vhd
vcom cont_57_tb.vhd

# Inicia a simulação
vsim work.cont_57_tb

# Adiciona sinais à janela de ondas
add wave *

add wave -divider {Internal Signals}
add wave sim:/cont_57_tb/DUT/clk_divided
add wave sim:/cont_57_tb/DUT/carry_units
add wave sim:/cont_57_tb/DUT/load_ten
add wave sim:/cont_57_tb/DUT/load_units
add wave -radix hexadecimal sim:/cont_57_tb/DUT/tens
add wave -radix hexadecimal sim:/cont_57_tb/DUT/uns

run 10 sec
wave zoom full

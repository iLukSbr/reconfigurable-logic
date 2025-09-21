# Simulação Gate Level

# Limpa a pasta de trabalho
if {[file exists work]} { vdel -lib work -all }
vlib work
vmap work work

# Adiciona biblioteca do FPGA
vlib cycloneii
vmap cycloneii ./cycloneii
vcom -work cycloneii ./cycloneii/cycloneii_atoms.vhd
vcom -work cycloneii ./cycloneii/cycloneii_components.vhd

# Compila netlist gerado pela síntese e testbench
vcom "simulation/modelsim/cont_57.vho"
vcom cont_57_tb.vhd

# Inicia a simulação
vsim work.cont_57_tb

# Adiciona sinais à janela de ondas
add wave *
set_radix sim:/cont_57_tb/uns_out unsigned
set_radix sim:/cont_57_tb/tens_out unsigned

run 10 sec
wave zoom full

transcript on

# Limpa/Cria biblioteca de trabalho
if {[file exists work]} { vdel -lib work -all }
vlib work
vmap work work

# Compila os arquivos VHDL
vcom bcd_display.vhd
vcom cont4_mod10.vhd
vcom Lab3.vhd
vcom Lab3_TB.vhd

# Inicia a simulação
vsim work.Lab3_TB

# Adiciona sinais à janela de ondas
add wave -divider {Inputs}
add wave -radix binary sim:/Lab3_TB/CLK
add wave -radix binary sim:/Lab3_TB/RST
add wave -radix binary sim:/Lab3_TB/EN
add wave -radix binary sim:/Lab3_TB/CLR

add wave -divider {Internal Signals}
add wave -radix unsigned sim:/Lab3_TB/UUT/U_TENS/Q

add wave -divider {Output}
add wave -radix unsigned sim:/Lab3_TB/Q

# Roda a simulação
run 5 sec
wave zoom full

# Abre a visão RTL do módulo principal
view structure -rtl work.Lab3_TB

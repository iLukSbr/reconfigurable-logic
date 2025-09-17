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
add wave -radix unsigned sim:/Lab3_TB/UUT/q_millisec_units
add wave -radix unsigned sim:/Lab3_TB/UUT/q_millisec_tens
add wave -radix unsigned sim:/Lab3_TB/UUT/q_sec_units
add wave -radix unsigned sim:/Lab3_TB/UUT/q_sec_tens
add wave -radix unsigned sim:/Lab3_TB/UUT/en_millisec_units
add wave -radix unsigned sim:/Lab3_TB/UUT/en_millisec_tens
add wave -radix unsigned sim:/Lab3_TB/UUT/en_sec_units
add wave -radix unsigned sim:/Lab3_TB/UUT/en_sec_tens
add wave -radix unsigned sim:/Lab3_TB/UUT/clk_millisec_counter
add wave -radix binary sim:/Lab3_TB/UUT/internal_clear

add wave -divider {Output}
add wave -radix unsigned sim:/Lab3_TB/Q_SEC
add wave -radix unsigned sim:/Lab3_TB/Q_MILLISEC
add wave -radix binary sim:/Lab3_TB/disp_tens
add wave -radix binary sim:/Lab3_TB/disp_units
add wave -radix binary sim:/Lab3_TB/disp_hundreth_tens
add wave -radix binary sim:/Lab3_TB/disp_hundreth_units

# Roda a simulação
run 2100 ms
wave zoom full

# Abre a visão RTL do módulo principal
#view structure -rtl work.Lab3_TB

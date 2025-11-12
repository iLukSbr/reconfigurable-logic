# Script de Simulação com sinal de depuração 'speed_divider'

quit -sim
vlib work
vmap work work

echo "Compilando todas as dependências..."
vcom -2008 BRAM_Origem.vhd
vcom -2008 BRAM_Destino.vhd
vcom -2008 FIFO.vhd
vcom -2008 WriteController.vhd
vcom -2008 ReadController.vhd
vcom -2008 FlowControlTop.vhd
vcom -2008 FlowControlTop_tb.vhd

echo "Iniciando a simulação do sistema completo..."
vsim -voptargs=+acc work.FlowControlTop_tb

add wave -divider "Controle Global"
add wave sim:/FlowControlTop_tb/clk
add wave sim:/FlowControlTop_tb/reset
add wave sim:/FlowControlTop_tb/done

add wave -divider "Write Controller (write_ctrl)"
add wave sim:/FlowControlTop_tb/uut/write_ctrl/state

add wave -divider "Read Controller (read_ctrl)"
add wave sim:/FlowControlTop_tb/uut/read_ctrl/state
# LINHA ADICIONADA PARA DEPURAÇÃO:
add wave -radix unsigned sim:/FlowControlTop_tb/uut/read_ctrl/speed_divider

add wave -divider "Status da FIFO"
add wave -radix unsigned sim:/FlowControlTop_tb/uut/fifo_usedw
add wave sim:/FlowControlTop_tb/uut/fifo_almost_full
add wave sim:/FlowControlTop_tb/uut/fifo_empty

add wave -divider "Requisições e Dados da FIFO"
add wave sim:/FlowControlTop_tb/uut/fifo_wrreq
add wave sim:/FlowControlTop_tb/uut/fifo_rdreq

run 800000 ms
wave zoom full
echo "Simulação completa concluída."
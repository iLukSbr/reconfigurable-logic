# =============================================================================
# Script de Simulação para o Testbench do ReadController
# =============================================================================

# 1. Limpa a simulação anterior e prepara o ambiente
quit -sim
vlib work
vmap work work

# 2. Compila os arquivos VHDL
echo "Compilando os componentes..."
vcom -2008 BRAM_Destino.vhd
vcom -2008 FIFO.vhd
vcom -2008 ReadController.vhd
vcom -2008 ReadController_tb.vhd

# 3. Inicia o simulador no testbench
echo "Iniciando a simulação..."
vsim -voptargs=+acc work.ReadController_tb

# 4. Adiciona os sinais à janela de Wave para depuração
add wave -divider "Controle Global"
add wave sim:/ReadController_tb/clk
add wave sim:/ReadController_tb/reset

add wave -divider "Sinais Internos da FSM (uut)"
add wave sim:/ReadController_tb/uut/state
add wave sim:/ReadController_tb/uut/next_state
add wave -radix unsigned sim:/ReadController_tb/uut/addr_counter

add wave -divider "Interface com BRAM (Saídas do uut)"
add wave -radix unsigned sim:/ReadController_tb/bram_addr
add wave sim:/ReadController_tb/bram_wren
add wave -radix hex sim:/ReadController_tb/bram_data_w

add wave -divider "Interface com FIFO"
add wave sim:/ReadController_tb/fifo_rdreq        
add wave sim:/ReadController_tb/fifo_empty       
add wave -radix hex sim:/ReadController_tb/fifo_data_out

add wave -divider "Testbench - Produtor e Verificador"
add wave sim:/ReadController_tb/fifo_wrreq        
add wave -radix unsigned sim:/ReadController_tb/fifo_usedw 
add wave -radix unsigned sim:/ReadController_tb/checker/expected_value 

add wave -divider "Status Final"
add wave sim:/ReadController_tb/transfer_done

# 5. Roda a simulação
run -all

# 6. Ajusta o zoom para ver a forma de onda completa
wave zoom full

echo "Simulação concluída."
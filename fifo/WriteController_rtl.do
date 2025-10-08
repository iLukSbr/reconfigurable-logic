# =============================================================================
# Script de Simulação para o Testbench do WriteController
# =============================================================================

# 1. Limpa a simulação anterior e prepara o ambiente
quit -sim

vlib work
vmap work work

if {[info exists ::env(QUARTUS_INSTALL_DIR)]} {
    set altera_lib "$::env(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_mf"
    if {[file exists $altera_lib]} {
        vmap altera_mf $altera_lib
    } else {
        echo "Aviso: biblioteca altera_mf não encontrada em $altera_lib"
    }
} else {
    echo "Aviso: variável QUARTUS_INSTALL_DIR não definida; ajuste o mapeamento da altera_mf manualmente."
}

# 2. Compila os arquivos VHDL
echo "Compilando os componentes..."
vcom -2008 BRAM_Origem.vhd
vcom -2008 FIFO.vhd
vcom -2008 WriteController.vhd
vcom -2008 WriteController_tb.vhd

# 3. Inicia o simulador no testbench
echo "Iniciando a simulação..."
vsim -voptargs=+acc -L altera_mf work.WriteController_tb

# 4. Adiciona os sinais à janela de Wave para depuração

add wave -divider "Controle Global"
add wave sim:/WriteController_tb/clk
add wave sim:/WriteController_tb/reset

add wave -divider "Sinais Internos da FSM (uut)"
add wave sim:/WriteController_tb/uut/state
add wave sim:/WriteController_tb/uut/next_state
add wave -radix unsigned sim:/WriteController_tb/uut/addr_counter

add wave -divider "Interface com BRAM"
add wave -radix unsigned sim:/WriteController_tb/uut/bram_addr_out
add wave sim:/WriteController_tb/uut/bram_wren_out
add wave -radix unsigned sim:/WriteController_tb/uut/bram_data_out
add wave -radix unsigned sim:/WriteController_tb/bram_data_r

add wave -divider "Interface com FIFO (Controle de Fluxo)"
add wave sim:/WriteController_tb/uut/fifo_wrreq_out
add wave -radix hex sim:/WriteController_tb/uut/fifo_data_out
add wave sim:/WriteController_tb/fifo_almost_full
add wave -radix unsigned sim:/WriteController_tb/fifo_usedw

add wave -divider "Testbench - Consumidor e Verificador"
add wave sim:/WriteController_tb/fifo_rdreq              
add wave -radix hex sim:/WriteController_tb/fifo_q        
add wave -radix unsigned sim:/WriteController_tb/consumer/divider 
add wave -radix unsigned sim:/WriteController_tb/checker/expected_value 

add wave -divider "Status Final"
add wave sim:/WriteController_tb/uut/transfer_done

# 5. Roda a simulação
run 300000 ns

# 6. Ajusta o zoom para ver a forma de onda completa
wave zoom full

echo "Simulação concluída."
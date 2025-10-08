transcript on
# =============================================================================
# Script de Simulação para o Testbench do FlowControlTop
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
echo "Compilando FlowControlTop e dependências..."
vcom -2008 BRAM_Origem.vhd
vcom -2008 BRAM_Destino.vhd
vcom -2008 fifo.vhd
vcom -2008 WriteController.vhd
vcom -2008 ReadController.vhd
vcom -2008 FlowControlTop.vhd
vcom -2008 FlowControlTop_tb.vhd

# 3. Inicia o simulador no testbench
echo "Iniciando a simulação..."
vsim -voptargs=+acc -L altera_mf work.FlowControlTop_tb

# 4. Adiciona os sinais à janela de Wave para depuração
add wave -divider "Sinais de Controle Principais"
add wave sim:/FlowControlTop_tb/clk
add wave sim:/FlowControlTop_tb/reset
add wave sim:/FlowControlTop_tb/start
add wave sim:/FlowControlTop_tb/done

add wave -divider "Dados de Entrada e Saída"
add wave -radix hex sim:/FlowControlTop_tb/dados_entrada
add wave -radix hex sim:/FlowControlTop_tb/dados_saida

add wave -divider "Controlador de Escrita"
add wave sim:/FlowControlTop_tb/uut/write_ctrl/current_state
add wave sim:/FlowControlTop_tb/uut/write_ctrl/done_write
add wave -radix unsigned sim:/FlowControlTop_tb/uut/write_ctrl/bram_address
add wave -radix hex sim:/FlowControlTop_tb/uut/write_ctrl/bram_data

add wave -divider "Controlador de Leitura"
add wave sim:/FlowControlTop_tb/uut/read_ctrl/current_state
add wave sim:/FlowControlTop_tb/uut/read_ctrl/done_read
add wave -radix unsigned sim:/FlowControlTop_tb/uut/read_ctrl/bram_address
add wave -radix hex sim:/FlowControlTop_tb/uut/read_ctrl/bram_data

add wave -divider "FIFO Central"
add wave sim:/FlowControlTop_tb/uut/fifo_empty
add wave sim:/FlowControlTop_tb/uut/fifo_full
add wave -radix unsigned sim:/FlowControlTop_tb/uut/fifo_usedw
add wave -radix hex sim:/FlowControlTop_tb/uut/fifo_data_out

add wave -divider "BRAM de Origem"
add wave sim:/FlowControlTop_tb/uut/bram_origem_wren
add wave -radix unsigned sim:/FlowControlTop_tb/uut/bram_origem_address
add wave -radix hex sim:/FlowControlTop_tb/uut/bram_origem_data
add wave -radix hex sim:/FlowControlTop_tb/uut/bram_origem_q

add wave -divider "BRAM de Destino"
add wave sim:/FlowControlTop_tb/uut/bram_destino_wren
add wave -radix unsigned sim:/FlowControlTop_tb/uut/bram_destino_address
add wave -radix hex sim:/FlowControlTop_tb/uut/bram_destino_data
add wave -radix hex sim:/FlowControlTop_tb/uut/bram_destino_q

# 5. Roda a simulação
run 5000 ns

# 6. Ajusta o zoom para ver a forma de onda completa
wave zoom full

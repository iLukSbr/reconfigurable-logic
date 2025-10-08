transcript on
# =============================================================================
# Script de Simulação para o Testbench da FIFO
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
echo "Compilando FIFO e testbench..."
vcom -2008 FIFO.vhd
vcom -2008 fifo_tb.vhd

# 3. Inicia o simulador no testbench
echo "Iniciando a simulação..."
vsim -voptargs=+acc -L altera_mf work.fifo_tb

# 4. Adiciona os sinais à janela de Wave para depuração
add wave -divider "Clock e Requisições"
add wave sim:/fifo_tb/clk
add wave sim:/fifo_tb/wrreq
add wave sim:/fifo_tb/rdreq

add wave -divider "Dados"
add wave -radix hex sim:/fifo_tb/data_in
add wave -radix hex sim:/fifo_tb/data_out

add wave -divider "Status da FIFO"
add wave sim:/fifo_tb/almost_empty
add wave sim:/fifo_tb/almost_full
add wave sim:/fifo_tb/empty
add wave sim:/fifo_tb/full
add wave -radix unsigned sim:/fifo_tb/usedw

add wave -divider "Monitores do Testbench"
add wave sim:/fifo_tb/wr_active_count
add wave sim:/fifo_tb/read_index

add wave -divider "Instância da FIFO"
add wave -radix hex sim:/fifo_tb/uut/data
add wave sim:/fifo_tb/uut/wrreq
add wave sim:/fifo_tb/uut/rdreq
add wave -radix hex sim:/fifo_tb/uut/q
add wave -radix unsigned sim:/fifo_tb/uut/usedw

# 5. Roda a simulação
run 5000 ns

# 6. Ajusta o zoom para ver a forma de onda completa
wave zoom full

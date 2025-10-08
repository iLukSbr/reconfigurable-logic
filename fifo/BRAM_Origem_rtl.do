transcript on
# =============================================================================
# Script de Simulação para o Testbench da BRAM_Origem
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
echo "Compilando BRAM_Origem e testbench..."
vcom -2008 BRAM_Origem.vhd
vcom -2008 BRAM_Origem_tb.vhd

# 3. Inicia o simulador no testbench
echo "Iniciando a simulação..."
vsim -voptargs=+acc -L altera_mf work.bram_origem_tb

# 4. Adiciona os sinais à janela de Wave para depuração
add wave -divider "Clock e Controle"
add wave sim:/bram_origem_tb/clk
add wave sim:/bram_origem_tb/wren

add wave -divider "Endereços e Dados"
add wave -radix unsigned sim:/bram_origem_tb/address
add wave -radix hex sim:/bram_origem_tb/data_in
add wave -radix hex sim:/bram_origem_tb/data_out
add wave -radix hex sim:/bram_origem_tb/read_value

add wave -divider "Instância da BRAM"
add wave -radix unsigned sim:/bram_origem_tb/uut/address
add wave sim:/bram_origem_tb/uut/wren
add wave -radix hex sim:/bram_origem_tb/uut/data
add wave -radix hex sim:/bram_origem_tb/uut/q

# 5. Roda a simulação
run 2000 ns

# 6. Ajusta o zoom para ver a forma de onda completa
wave zoom full

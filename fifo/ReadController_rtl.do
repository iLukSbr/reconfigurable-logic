transcript on
# =============================================================================
# Script de Simulação para o Testbench do ReadController
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
echo "Compilando ReadController e testbench..."
vcom -2008 fifo.vhd
vcom -2008 BRAM_Destino.vhd
vcom -2008 ReadController.vhd
vcom -2008 ReadController_tb.vhd

# 3. Inicia o simulador no testbench
echo "Iniciando a simulação..."
vsim -voptargs=+acc -L altera_mf work.readcontroller_tb

# 4. Adiciona os sinais à janela de Wave para depuração
add wave -divider "Clock e Reset"
add wave sim:/readcontroller_tb/clk
add wave sim:/readcontroller_tb/reset

add wave -divider "Controle Principal"
add wave sim:/readcontroller_tb/start
add wave sim:/readcontroller_tb/done_read

add wave -divider "Máquina de Estados"
add wave sim:/readcontroller_tb/uut/current_state
add wave sim:/readcontroller_tb/uut/next_state

add wave -divider "Interface FIFO"
add wave sim:/readcontroller_tb/fifo_empty
add wave sim:/readcontroller_tb/fifo_full
add wave -radix unsigned sim:/readcontroller_tb/fifo_usedw
add wave sim:/readcontroller_tb/fifo_rdreq
add wave -radix hex sim:/readcontroller_tb/fifo_q

add wave -divider "Interface BRAM"
add wave sim:/readcontroller_tb/bram_wren
add wave -radix unsigned sim:/readcontroller_tb/bram_address
add wave -radix hex sim:/readcontroller_tb/bram_data
add wave -radix hex sim:/readcontroller_tb/bram_q

add wave -divider "Sinais Internos"
add wave -radix unsigned sim:/readcontroller_tb/uut/address_counter
add wave sim:/readcontroller_tb/uut/fifo_read_enable
add wave sim:/readcontroller_tb/uut/bram_write_enable

add wave -divider "Instância da BRAM de Destino"
add wave -radix unsigned sim:/readcontroller_tb/bram_inst/address
add wave sim:/readcontroller_tb/bram_inst/wren
add wave -radix hex sim:/readcontroller_tb/bram_inst/data
add wave -radix hex sim:/readcontroller_tb/bram_inst/q

add wave -divider "Instância do FIFO"
add wave sim:/readcontroller_tb/fifo_inst/empty
add wave sim:/readcontroller_tb/fifo_inst/full
add wave -radix unsigned sim:/readcontroller_tb/fifo_inst/usedw
add wave sim:/readcontroller_tb/fifo_inst/rdreq
add wave -radix hex sim:/readcontroller_tb/fifo_inst/q

# 5. Roda a simulação
run 3000 ns

# 6. Ajusta o zoom para ver a forma de onda completa
wave zoom full
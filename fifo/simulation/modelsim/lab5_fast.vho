-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "10/08/2025 11:35:03"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FlowControlTop IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	done : OUT std_logic;
	dados_entrada : OUT std_logic_vector(7 DOWNTO 0);
	dados_saida : OUT std_logic_vector(7 DOWNTO 0)
	);
END FlowControlTop;

-- Design Ports Information
-- done	=>  Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_entrada[0]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_entrada[1]	=>  Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_entrada[2]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_entrada[3]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_entrada[4]	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_entrada[5]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_entrada[6]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_entrada[7]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_saida[0]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_saida[1]	=>  Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_saida[2]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_saida[3]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_saida[4]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_saida[5]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_saida[6]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dados_saida[7]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF FlowControlTop IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_done : std_logic;
SIGNAL ww_dados_entrada : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_dados_saida : std_logic_vector(7 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTBDATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTBADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTBDATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTBADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \read_ctrl|Add0~0_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~6_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~10_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~17\ : std_logic;
SIGNAL \read_ctrl|Add0~18_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~19\ : std_logic;
SIGNAL \read_ctrl|Add0~20_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~2_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~6_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~19\ : std_logic;
SIGNAL \write_ctrl|Add0~20_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\ : std_logic;
SIGNAL \read_ctrl|Equal0~1_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[10]~1_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[5]~6_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[3]~8_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~1_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~2_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~3_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~4_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\ : std_logic;
SIGNAL \write_ctrl|Selector4~0_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\ : std_logic;
SIGNAL \write_ctrl|Selector4~1_combout\ : std_logic;
SIGNAL \write_ctrl|Selector4~2_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \write_ctrl|state.S_WAIT_FIFO~regout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~6_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~5_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~7_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~8_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~regout\ : std_logic;
SIGNAL \write_ctrl|state.S_IDLE~feeder_combout\ : std_logic;
SIGNAL \write_ctrl|state.S_IDLE~regout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[2]~1_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[3]~9_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[1]~11_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~0_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[0]~12_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~1\ : std_logic;
SIGNAL \write_ctrl|Add0~3\ : std_logic;
SIGNAL \write_ctrl|Add0~4_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[2]~10_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~5\ : std_logic;
SIGNAL \write_ctrl|Add0~7\ : std_logic;
SIGNAL \write_ctrl|Add0~8_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[4]~8_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~9\ : std_logic;
SIGNAL \write_ctrl|Add0~11\ : std_logic;
SIGNAL \write_ctrl|Add0~13\ : std_logic;
SIGNAL \write_ctrl|Add0~14_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[7]~5_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[10]~2_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~15\ : std_logic;
SIGNAL \write_ctrl|Add0~17\ : std_logic;
SIGNAL \write_ctrl|Add0~18_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[9]~3_combout\ : std_logic;
SIGNAL \write_ctrl|LessThan0~0_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~12_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[6]~6_combout\ : std_logic;
SIGNAL \write_ctrl|LessThan0~1_combout\ : std_logic;
SIGNAL \write_ctrl|LessThan0~2_combout\ : std_logic;
SIGNAL \write_ctrl|process_0~2_combout\ : std_logic;
SIGNAL \write_ctrl|Selector1~0_combout\ : std_logic;
SIGNAL \write_ctrl|state.S_LOAD_BRAM~regout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[0]~0_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~10_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[5]~7_combout\ : std_logic;
SIGNAL \write_ctrl|Equal1~1_combout\ : std_logic;
SIGNAL \write_ctrl|Equal1~0_combout\ : std_logic;
SIGNAL \write_ctrl|Equal1~2_combout\ : std_logic;
SIGNAL \write_ctrl|Equal1~3_combout\ : std_logic;
SIGNAL \write_ctrl|process_0~3_combout\ : std_logic;
SIGNAL \write_ctrl|Selector2~0_combout\ : std_logic;
SIGNAL \write_ctrl|Selector2~1_combout\ : std_logic;
SIGNAL \write_ctrl|state.S_READ_BRAM~regout\ : std_logic;
SIGNAL \write_ctrl|state.S_WRITE_FIFO~regout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dffe_af~9_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\ : std_logic;
SIGNAL \read_ctrl|state.S_IDLE~0_combout\ : std_logic;
SIGNAL \read_ctrl|state.S_IDLE~regout\ : std_logic;
SIGNAL \read_ctrl|Add0~3\ : std_logic;
SIGNAL \read_ctrl|Add0~4_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[2]~9_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~5\ : std_logic;
SIGNAL \read_ctrl|Add0~7\ : std_logic;
SIGNAL \read_ctrl|Add0~8_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[4]~7_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~9\ : std_logic;
SIGNAL \read_ctrl|Add0~11\ : std_logic;
SIGNAL \read_ctrl|Add0~12_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[6]~5_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~13\ : std_logic;
SIGNAL \read_ctrl|Add0~14_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[7]~4_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~15\ : std_logic;
SIGNAL \read_ctrl|Add0~16_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[8]~3_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[9]~2_combout\ : std_logic;
SIGNAL \read_ctrl|Equal0~0_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[0]~0_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[0]~11_combout\ : std_logic;
SIGNAL \read_ctrl|Add0~1\ : std_logic;
SIGNAL \read_ctrl|Add0~2_combout\ : std_logic;
SIGNAL \read_ctrl|addr_counter[1]~10_combout\ : std_logic;
SIGNAL \read_ctrl|Equal0~2_combout\ : std_logic;
SIGNAL \read_ctrl|Equal0~3_combout\ : std_logic;
SIGNAL \read_ctrl|Selector0~0_combout\ : std_logic;
SIGNAL \read_ctrl|state.S_READ_FIFO~regout\ : std_logic;
SIGNAL \read_ctrl|state.S_WRITE_BRAM~feeder_combout\ : std_logic;
SIGNAL \read_ctrl|state.S_WRITE_BRAM~regout\ : std_logic;
SIGNAL \read_ctrl|state.S_DONE~0_combout\ : std_logic;
SIGNAL \read_ctrl|state.S_DONE~regout\ : std_logic;
SIGNAL \write_ctrl|state.S_DONE~0_combout\ : std_logic;
SIGNAL \write_ctrl|state.S_DONE~regout\ : std_logic;
SIGNAL \done~0_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \write_ctrl|bram_data_out[0]~0_combout\ : std_logic;
SIGNAL \write_ctrl|Add0~16_combout\ : std_logic;
SIGNAL \write_ctrl|addr_counter[8]~4_combout\ : std_logic;
SIGNAL \write_ctrl|bram_data_out[1]~1_combout\ : std_logic;
SIGNAL \write_ctrl|fifo_data_out[0]~0_combout\ : std_logic;
SIGNAL \write_ctrl|fifo_data_out[1]~1_combout\ : std_logic;
SIGNAL \write_ctrl|bram_data_out[2]~2_combout\ : std_logic;
SIGNAL \write_ctrl|bram_data_out[3]~3_combout\ : std_logic;
SIGNAL \write_ctrl|fifo_data_out[2]~2_combout\ : std_logic;
SIGNAL \write_ctrl|fifo_data_out[3]~3_combout\ : std_logic;
SIGNAL \write_ctrl|bram_data_out[4]~4_combout\ : std_logic;
SIGNAL \write_ctrl|bram_data_out[5]~5_combout\ : std_logic;
SIGNAL \write_ctrl|fifo_data_out[4]~4_combout\ : std_logic;
SIGNAL \write_ctrl|fifo_data_out[5]~5_combout\ : std_logic;
SIGNAL \write_ctrl|bram_data_out[6]~6_combout\ : std_logic;
SIGNAL \write_ctrl|bram_data_out[7]~7_combout\ : std_logic;
SIGNAL \write_ctrl|fifo_data_out[6]~6_combout\ : std_logic;
SIGNAL \write_ctrl|fifo_data_out[7]~7_combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\ : std_logic;
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \src_bram|altsyncram_component|auto_generated|q_a\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \write_ctrl|addr_counter\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \read_ctrl|addr_counter\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\ : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
done <= ww_done;
dados_entrada <= ww_dados_entrada;
dados_saida <= ww_dados_saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\write_ctrl|bram_data_out[1]~1_combout\ & \write_ctrl|bram_data_out[0]~0_combout\);

\src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\write_ctrl|addr_counter\(10) & \write_ctrl|addr_counter\(9) & \write_ctrl|addr_counter\(8) & \write_ctrl|addr_counter\(7) & \write_ctrl|addr_counter\(6) & 
\write_ctrl|addr_counter\(5) & \write_ctrl|addr_counter\(4) & \write_ctrl|addr_counter\(3) & \write_ctrl|addr_counter\(2) & \write_ctrl|addr_counter\(1) & \write_ctrl|addr_counter\(0));

\src_bram|altsyncram_component|auto_generated|q_a\(0) <= \src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\src_bram|altsyncram_component|auto_generated|q_a\(1) <= \src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);

\src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\ <= (\write_ctrl|bram_data_out[3]~3_combout\ & \write_ctrl|bram_data_out[2]~2_combout\);

\src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\write_ctrl|addr_counter\(10) & \write_ctrl|addr_counter\(9) & \write_ctrl|addr_counter\(8) & \write_ctrl|addr_counter\(7) & \write_ctrl|addr_counter\(6) & 
\write_ctrl|addr_counter\(5) & \write_ctrl|addr_counter\(4) & \write_ctrl|addr_counter\(3) & \write_ctrl|addr_counter\(2) & \write_ctrl|addr_counter\(1) & \write_ctrl|addr_counter\(0));

\src_bram|altsyncram_component|auto_generated|q_a\(2) <= \src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);
\src_bram|altsyncram_component|auto_generated|q_a\(3) <= \src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(1);

\src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ <= (\write_ctrl|bram_data_out[5]~5_combout\ & \write_ctrl|bram_data_out[4]~4_combout\);

\src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\write_ctrl|addr_counter\(10) & \write_ctrl|addr_counter\(9) & \write_ctrl|addr_counter\(8) & \write_ctrl|addr_counter\(7) & \write_ctrl|addr_counter\(6) & 
\write_ctrl|addr_counter\(5) & \write_ctrl|addr_counter\(4) & \write_ctrl|addr_counter\(3) & \write_ctrl|addr_counter\(2) & \write_ctrl|addr_counter\(1) & \write_ctrl|addr_counter\(0));

\src_bram|altsyncram_component|auto_generated|q_a\(4) <= \src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);
\src_bram|altsyncram_component|auto_generated|q_a\(5) <= \src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(1);

\src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\ <= (\write_ctrl|bram_data_out[7]~7_combout\ & \write_ctrl|bram_data_out[6]~6_combout\);

\src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\write_ctrl|addr_counter\(10) & \write_ctrl|addr_counter\(9) & \write_ctrl|addr_counter\(8) & \write_ctrl|addr_counter\(7) & \write_ctrl|addr_counter\(6) & 
\write_ctrl|addr_counter\(5) & \write_ctrl|addr_counter\(4) & \write_ctrl|addr_counter\(3) & \write_ctrl|addr_counter\(2) & \write_ctrl|addr_counter\(1) & \write_ctrl|addr_counter\(0));

\src_bram|altsyncram_component|auto_generated|q_a\(6) <= \src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);
\src_bram|altsyncram_component|auto_generated|q_a\(7) <= \src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(1);

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAIN_bus\ <= (vcc & vcc & vcc & vcc);

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTBDATAIN_bus\ <= (\write_ctrl|fifo_data_out[3]~3_combout\ & \write_ctrl|fifo_data_out[2]~2_combout\ & \write_ctrl|fifo_data_out[1]~1_combout\ & 
\write_ctrl|fifo_data_out[0]~0_combout\);

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTAADDR_bus\ <= (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(9) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(8) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(7) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(6) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(5) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(4) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(3) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(2) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(1) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(0));

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTBADDR_bus\ <= (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(9) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(8)
& \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(7) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(6) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(5) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(4) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(3) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(2) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(1) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(0));

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(0) <= \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAOUT_bus\(0);
\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(1) <= \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAOUT_bus\(1);
\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(2) <= \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAOUT_bus\(2);
\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(3) <= \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAOUT_bus\(3);

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAIN_bus\ <= (vcc & vcc & vcc & vcc);

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTBDATAIN_bus\ <= (\write_ctrl|fifo_data_out[7]~7_combout\ & \write_ctrl|fifo_data_out[6]~6_combout\ & \write_ctrl|fifo_data_out[5]~5_combout\ & 
\write_ctrl|fifo_data_out[4]~4_combout\);

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTAADDR_bus\ <= (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(9) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(8) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(7) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(6) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(5) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(4) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(3) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(2) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(1) & \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(0));

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTBADDR_bus\ <= (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(9) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(8)
& \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(7) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(6) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(5) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(4) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(3) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(2) & 
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(1) & \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(0));

\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(4) <= \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAOUT_bus\(0);
\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(5) <= \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAOUT_bus\(1);
\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(6) <= \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAOUT_bus\(2);
\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(7) <= \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAOUT_bus\(3);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);

-- Location: LCCOMB_X25_Y33_N6
\read_ctrl|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~0_combout\ = \read_ctrl|addr_counter\(0) $ (VCC)
-- \read_ctrl|Add0~1\ = CARRY(\read_ctrl|addr_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(0),
	datad => VCC,
	combout => \read_ctrl|Add0~0_combout\,
	cout => \read_ctrl|Add0~1\);

-- Location: LCCOMB_X25_Y33_N12
\read_ctrl|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~6_combout\ = (\read_ctrl|addr_counter\(3) & (!\read_ctrl|Add0~5\)) # (!\read_ctrl|addr_counter\(3) & ((\read_ctrl|Add0~5\) # (GND)))
-- \read_ctrl|Add0~7\ = CARRY((!\read_ctrl|Add0~5\) # (!\read_ctrl|addr_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|addr_counter\(3),
	datad => VCC,
	cin => \read_ctrl|Add0~5\,
	combout => \read_ctrl|Add0~6_combout\,
	cout => \read_ctrl|Add0~7\);

-- Location: LCCOMB_X25_Y33_N16
\read_ctrl|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~10_combout\ = (\read_ctrl|addr_counter\(5) & (!\read_ctrl|Add0~9\)) # (!\read_ctrl|addr_counter\(5) & ((\read_ctrl|Add0~9\) # (GND)))
-- \read_ctrl|Add0~11\ = CARRY((!\read_ctrl|Add0~9\) # (!\read_ctrl|addr_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|addr_counter\(5),
	datad => VCC,
	cin => \read_ctrl|Add0~9\,
	combout => \read_ctrl|Add0~10_combout\,
	cout => \read_ctrl|Add0~11\);

-- Location: LCCOMB_X25_Y33_N22
\read_ctrl|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~16_combout\ = (\read_ctrl|addr_counter\(8) & (\read_ctrl|Add0~15\ $ (GND))) # (!\read_ctrl|addr_counter\(8) & (!\read_ctrl|Add0~15\ & VCC))
-- \read_ctrl|Add0~17\ = CARRY((\read_ctrl|addr_counter\(8) & !\read_ctrl|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(8),
	datad => VCC,
	cin => \read_ctrl|Add0~15\,
	combout => \read_ctrl|Add0~16_combout\,
	cout => \read_ctrl|Add0~17\);

-- Location: LCCOMB_X25_Y33_N24
\read_ctrl|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~18_combout\ = (\read_ctrl|addr_counter\(9) & (!\read_ctrl|Add0~17\)) # (!\read_ctrl|addr_counter\(9) & ((\read_ctrl|Add0~17\) # (GND)))
-- \read_ctrl|Add0~19\ = CARRY((!\read_ctrl|Add0~17\) # (!\read_ctrl|addr_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(9),
	datad => VCC,
	cin => \read_ctrl|Add0~17\,
	combout => \read_ctrl|Add0~18_combout\,
	cout => \read_ctrl|Add0~19\);

-- Location: LCCOMB_X25_Y33_N26
\read_ctrl|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~20_combout\ = \read_ctrl|addr_counter\(10) $ (!\read_ctrl|Add0~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(10),
	cin => \read_ctrl|Add0~19\,
	combout => \read_ctrl|Add0~20_combout\);

-- Location: LCCOMB_X17_Y33_N2
\write_ctrl|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~2_combout\ = (\write_ctrl|addr_counter\(1) & (!\write_ctrl|Add0~1\)) # (!\write_ctrl|addr_counter\(1) & ((\write_ctrl|Add0~1\) # (GND)))
-- \write_ctrl|Add0~3\ = CARRY((!\write_ctrl|Add0~1\) # (!\write_ctrl|addr_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(1),
	datad => VCC,
	cin => \write_ctrl|Add0~1\,
	combout => \write_ctrl|Add0~2_combout\,
	cout => \write_ctrl|Add0~3\);

-- Location: LCCOMB_X17_Y33_N6
\write_ctrl|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~6_combout\ = (\write_ctrl|addr_counter\(3) & (!\write_ctrl|Add0~5\)) # (!\write_ctrl|addr_counter\(3) & ((\write_ctrl|Add0~5\) # (GND)))
-- \write_ctrl|Add0~7\ = CARRY((!\write_ctrl|Add0~5\) # (!\write_ctrl|addr_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(3),
	datad => VCC,
	cin => \write_ctrl|Add0~5\,
	combout => \write_ctrl|Add0~6_combout\,
	cout => \write_ctrl|Add0~7\);

-- Location: LCCOMB_X17_Y33_N18
\write_ctrl|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~18_combout\ = (\write_ctrl|addr_counter\(9) & (!\write_ctrl|Add0~17\)) # (!\write_ctrl|addr_counter\(9) & ((\write_ctrl|Add0~17\) # (GND)))
-- \write_ctrl|Add0~19\ = CARRY((!\write_ctrl|Add0~17\) # (!\write_ctrl|addr_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter\(9),
	datad => VCC,
	cin => \write_ctrl|Add0~17\,
	combout => \write_ctrl|Add0~18_combout\,
	cout => \write_ctrl|Add0~19\);

-- Location: LCCOMB_X17_Y33_N20
\write_ctrl|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~20_combout\ = \write_ctrl|Add0~19\ $ (!\write_ctrl|addr_counter\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \write_ctrl|addr_counter\(10),
	cin => \write_ctrl|Add0~19\,
	combout => \write_ctrl|Add0~20_combout\);

-- Location: LCFF_X21_Y33_N13
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6));

-- Location: LCCOMB_X21_Y33_N12
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6) & ((VCC)))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6) $ (((VCC) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6) $ (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\);

-- Location: LCFF_X25_Y33_N5
\read_ctrl|addr_counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[10]~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(10));

-- Location: LCFF_X24_Y33_N15
\read_ctrl|addr_counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[5]~6_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(5));

-- Location: LCFF_X24_Y33_N31
\read_ctrl|addr_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[3]~8_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(3));

-- Location: LCCOMB_X24_Y33_N12
\read_ctrl|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Equal0~1_combout\ = (\read_ctrl|addr_counter\(6) & (\read_ctrl|addr_counter\(4) & (\read_ctrl|addr_counter\(5) & \read_ctrl|addr_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|addr_counter\(6),
	datab => \read_ctrl|addr_counter\(4),
	datac => \read_ctrl|addr_counter\(5),
	datad => \read_ctrl|addr_counter\(3),
	combout => \read_ctrl|Equal0~1_combout\);

-- Location: LCCOMB_X25_Y33_N4
\read_ctrl|addr_counter[10]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[10]~1_combout\ = (\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|addr_counter[0]~0_combout\ & ((\read_ctrl|Add0~20_combout\)))) # (!\read_ctrl|state.S_WRITE_BRAM~regout\ & ((\read_ctrl|addr_counter\(10)) # 
-- ((\read_ctrl|addr_counter[0]~0_combout\ & \read_ctrl|Add0~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datab => \read_ctrl|addr_counter[0]~0_combout\,
	datac => \read_ctrl|addr_counter\(10),
	datad => \read_ctrl|Add0~20_combout\,
	combout => \read_ctrl|addr_counter[10]~1_combout\);

-- Location: LCCOMB_X24_Y33_N14
\read_ctrl|addr_counter[5]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[5]~6_combout\ = (\read_ctrl|Add0~10_combout\ & ((\read_ctrl|addr_counter[0]~0_combout\) # ((!\read_ctrl|state.S_WRITE_BRAM~regout\ & \read_ctrl|addr_counter\(5))))) # (!\read_ctrl|Add0~10_combout\ & 
-- (!\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|addr_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|Add0~10_combout\,
	datab => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datac => \read_ctrl|addr_counter\(5),
	datad => \read_ctrl|addr_counter[0]~0_combout\,
	combout => \read_ctrl|addr_counter[5]~6_combout\);

-- Location: LCCOMB_X24_Y33_N30
\read_ctrl|addr_counter[3]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[3]~8_combout\ = (\read_ctrl|addr_counter[0]~0_combout\ & ((\read_ctrl|Add0~6_combout\) # ((!\read_ctrl|state.S_WRITE_BRAM~regout\ & \read_ctrl|addr_counter\(3))))) # (!\read_ctrl|addr_counter[0]~0_combout\ & 
-- (!\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|addr_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|addr_counter[0]~0_combout\,
	datab => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datac => \read_ctrl|addr_counter\(3),
	datad => \read_ctrl|Add0~6_combout\,
	combout => \read_ctrl|addr_counter[3]~8_combout\);

-- Location: LCCOMB_X22_Y33_N30
\fifo_inst|scfifo_component|auto_generated|dffe_af~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~1_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0)) # (((\write_ctrl|state.S_WRITE_FIFO~regout\) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8),
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9),
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~1_combout\);

-- Location: LCCOMB_X22_Y33_N24
\fifo_inst|scfifo_component|auto_generated|dffe_af~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~2_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1)) # ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2)) # 
-- ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3)) # (!\read_ctrl|state.S_READ_FIFO~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2),
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3),
	datad => \read_ctrl|state.S_READ_FIFO~regout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~2_combout\);

-- Location: LCCOMB_X22_Y33_N10
\fifo_inst|scfifo_component|auto_generated|dffe_af~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~3_combout\ = (\fifo_inst|scfifo_component|auto_generated|dffe_af~regout\ & (((\fifo_inst|scfifo_component|auto_generated|dffe_af~2_combout\) # 
-- (\fifo_inst|scfifo_component|auto_generated|dffe_af~1_combout\)) # (!\fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dffe_af~regout\,
	datab => \fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\,
	datac => \fifo_inst|scfifo_component|auto_generated|dffe_af~2_combout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dffe_af~1_combout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~3_combout\);

-- Location: LCCOMB_X21_Y33_N30
\fifo_inst|scfifo_component|auto_generated|dffe_af~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~4_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6) & (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9) & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7) & \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9),
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7),
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5),
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~4_combout\);

-- Location: LCCOMB_X22_Y33_N12
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8)) # 
-- ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9)) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8),
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0),
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9),
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\);

-- Location: LCCOMB_X21_Y33_N0
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\ = \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0) $ (((VCC) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ = CARRY(\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0) $ 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110011001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\);

-- Location: LCCOMB_X21_Y33_N2
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1) $ (((\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ & ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1)) # ((GND))))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1) $ 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\);

-- Location: LCCOMB_X21_Y33_N4
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2) & ((VCC)))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2) $ (((VCC) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2) $ (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\);

-- Location: LCCOMB_X21_Y33_N6
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3) $ (((\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ & ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3)) # ((GND))))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3) $ 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\);

-- Location: LCCOMB_X21_Y33_N8
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4) & ((VCC)))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4) $ (((VCC) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4) $ (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\);

-- Location: LCCOMB_X21_Y33_N10
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5) $ (((\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ & ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5)) # ((GND))))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5) $ 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\);

-- Location: LCCOMB_X21_Y33_N14
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7) $ (((\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\) # (VCC))))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ & (((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7)) # (GND))))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ $ 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\);

-- Location: LCCOMB_X22_Y33_N18
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\ & (\read_ctrl|state.S_READ_FIFO~regout\ $ 
-- (((!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\ & \write_ctrl|state.S_WRITE_FIFO~regout\))))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\ & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\ & (\write_ctrl|state.S_WRITE_FIFO~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\,
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\,
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \read_ctrl|state.S_READ_FIFO~regout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\);

-- Location: LCFF_X21_Y33_N15
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7));

-- Location: LCCOMB_X21_Y33_N16
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8) & ((VCC)))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8) $ (((VCC) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\)))))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8) $ (!\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\);

-- Location: LCCOMB_X21_Y33_N18
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\ = \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ $ 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9),
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\);

-- Location: LCFF_X21_Y33_N19
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9));

-- Location: LCFF_X21_Y33_N3
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1));

-- Location: LCFF_X21_Y33_N5
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2));

-- Location: LCFF_X21_Y33_N1
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0));

-- Location: LCCOMB_X21_Y33_N20
\write_ctrl|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Selector4~0_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3)) # ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1)) # 
-- ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2)) # (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1),
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2),
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0),
	combout => \write_ctrl|Selector4~0_combout\);

-- Location: LCFF_X21_Y33_N9
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4));

-- Location: LCFF_X21_Y33_N11
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5));

-- Location: LCCOMB_X21_Y33_N28
\fifo_inst|scfifo_component|auto_generated|dffe_af~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\ = (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4) & !\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(6),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(7),
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4),
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(5),
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\);

-- Location: LCCOMB_X21_Y33_N22
\write_ctrl|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Selector4~1_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9) & ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8)) # ((\write_ctrl|Selector4~0_combout\) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(9),
	datac => \write_ctrl|Selector4~0_combout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\,
	combout => \write_ctrl|Selector4~1_combout\);

-- Location: LCCOMB_X21_Y33_N26
\write_ctrl|Selector4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Selector4~2_combout\ = (\fifo_inst|scfifo_component|auto_generated|dffe_af~regout\ & ((\write_ctrl|state.S_WRITE_FIFO~regout\) # ((\write_ctrl|state.S_WAIT_FIFO~regout\ & \write_ctrl|Selector4~1_combout\)))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dffe_af~regout\ & (((\write_ctrl|state.S_WAIT_FIFO~regout\ & \write_ctrl|Selector4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dffe_af~regout\,
	datab => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datac => \write_ctrl|state.S_WAIT_FIFO~regout\,
	datad => \write_ctrl|Selector4~1_combout\,
	combout => \write_ctrl|Selector4~2_combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: CLKCTRL_G1
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: LCFF_X21_Y33_N27
\write_ctrl|state.S_WAIT_FIFO\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|Selector4~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|state.S_WAIT_FIFO~regout\);

-- Location: LCCOMB_X22_Y33_N4
\fifo_inst|scfifo_component|auto_generated|dffe_af~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~6_combout\ = (\write_ctrl|state.S_WRITE_FIFO~regout\ & (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0) & !\read_ctrl|state.S_READ_FIFO~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(0),
	datad => \read_ctrl|state.S_READ_FIFO~regout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~6_combout\);

-- Location: LCCOMB_X21_Y33_N24
\fifo_inst|scfifo_component|auto_generated|dffe_af~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~5_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3) & (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4) & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2) & \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(4),
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2),
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1),
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~5_combout\);

-- Location: LCCOMB_X22_Y33_N6
\fifo_inst|scfifo_component|auto_generated|dffe_af~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~7_combout\ = (\fifo_inst|scfifo_component|auto_generated|dffe_af~4_combout\ & (\fifo_inst|scfifo_component|auto_generated|dffe_af~6_combout\ & 
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dffe_af~4_combout\,
	datac => \fifo_inst|scfifo_component|auto_generated|dffe_af~6_combout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dffe_af~5_combout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~7_combout\);

-- Location: LCCOMB_X22_Y33_N22
\fifo_inst|scfifo_component|auto_generated|dffe_af~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~8_combout\ = (\fifo_inst|scfifo_component|auto_generated|dffe_af~3_combout\) # ((!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8) & 
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dffe_af~3_combout\,
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8),
	datad => \fifo_inst|scfifo_component|auto_generated|dffe_af~7_combout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~8_combout\);

-- Location: LCFF_X22_Y33_N23
\fifo_inst|scfifo_component|auto_generated|dffe_af\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dffe_af~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dffe_af~regout\);

-- Location: LCCOMB_X19_Y33_N14
\write_ctrl|state.S_IDLE~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|state.S_IDLE~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \write_ctrl|state.S_IDLE~feeder_combout\);

-- Location: LCFF_X19_Y33_N15
\write_ctrl|state.S_IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|state.S_IDLE~feeder_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|state.S_IDLE~regout\);

-- Location: LCCOMB_X19_Y33_N28
\write_ctrl|addr_counter[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[2]~1_combout\ = (!\write_ctrl|state.S_LOAD_BRAM~regout\ & !\write_ctrl|state.S_READ_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|state.S_LOAD_BRAM~regout\,
	datad => \write_ctrl|state.S_READ_BRAM~regout\,
	combout => \write_ctrl|addr_counter[2]~1_combout\);

-- Location: LCCOMB_X17_Y33_N22
\write_ctrl|addr_counter[3]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[3]~9_combout\ = (\write_ctrl|Add0~6_combout\ & ((\write_ctrl|addr_counter[0]~0_combout\) # ((\write_ctrl|addr_counter[2]~1_combout\ & \write_ctrl|addr_counter\(3))))) # (!\write_ctrl|Add0~6_combout\ & 
-- (\write_ctrl|addr_counter[2]~1_combout\ & (\write_ctrl|addr_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|Add0~6_combout\,
	datab => \write_ctrl|addr_counter[2]~1_combout\,
	datac => \write_ctrl|addr_counter\(3),
	datad => \write_ctrl|addr_counter[0]~0_combout\,
	combout => \write_ctrl|addr_counter[3]~9_combout\);

-- Location: LCFF_X17_Y33_N23
\write_ctrl|addr_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[3]~9_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(3));

-- Location: LCCOMB_X18_Y33_N24
\write_ctrl|addr_counter[1]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[1]~11_combout\ = (\write_ctrl|Add0~2_combout\ & ((\write_ctrl|addr_counter[0]~0_combout\) # ((\write_ctrl|addr_counter[2]~1_combout\ & \write_ctrl|addr_counter\(1))))) # (!\write_ctrl|Add0~2_combout\ & 
-- (\write_ctrl|addr_counter[2]~1_combout\ & (\write_ctrl|addr_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|Add0~2_combout\,
	datab => \write_ctrl|addr_counter[2]~1_combout\,
	datac => \write_ctrl|addr_counter\(1),
	datad => \write_ctrl|addr_counter[0]~0_combout\,
	combout => \write_ctrl|addr_counter[1]~11_combout\);

-- Location: LCFF_X18_Y33_N25
\write_ctrl|addr_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[1]~11_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(1));

-- Location: LCCOMB_X17_Y33_N0
\write_ctrl|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~0_combout\ = \write_ctrl|addr_counter\(0) $ (VCC)
-- \write_ctrl|Add0~1\ = CARRY(\write_ctrl|addr_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(0),
	datad => VCC,
	combout => \write_ctrl|Add0~0_combout\,
	cout => \write_ctrl|Add0~1\);

-- Location: LCCOMB_X18_Y33_N14
\write_ctrl|addr_counter[0]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[0]~12_combout\ = (\write_ctrl|addr_counter[2]~1_combout\ & ((\write_ctrl|addr_counter\(0)) # ((\write_ctrl|Add0~0_combout\ & \write_ctrl|addr_counter[0]~0_combout\)))) # (!\write_ctrl|addr_counter[2]~1_combout\ & 
-- (\write_ctrl|Add0~0_combout\ & ((\write_ctrl|addr_counter[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter[2]~1_combout\,
	datab => \write_ctrl|Add0~0_combout\,
	datac => \write_ctrl|addr_counter\(0),
	datad => \write_ctrl|addr_counter[0]~0_combout\,
	combout => \write_ctrl|addr_counter[0]~12_combout\);

-- Location: LCFF_X18_Y33_N15
\write_ctrl|addr_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[0]~12_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(0));

-- Location: LCCOMB_X17_Y33_N4
\write_ctrl|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~4_combout\ = (\write_ctrl|addr_counter\(2) & (\write_ctrl|Add0~3\ $ (GND))) # (!\write_ctrl|addr_counter\(2) & (!\write_ctrl|Add0~3\ & VCC))
-- \write_ctrl|Add0~5\ = CARRY((\write_ctrl|addr_counter\(2) & !\write_ctrl|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(2),
	datad => VCC,
	cin => \write_ctrl|Add0~3\,
	combout => \write_ctrl|Add0~4_combout\,
	cout => \write_ctrl|Add0~5\);

-- Location: LCCOMB_X18_Y33_N30
\write_ctrl|addr_counter[2]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[2]~10_combout\ = (\write_ctrl|addr_counter[2]~1_combout\ & ((\write_ctrl|addr_counter\(2)) # ((\write_ctrl|Add0~4_combout\ & \write_ctrl|addr_counter[0]~0_combout\)))) # (!\write_ctrl|addr_counter[2]~1_combout\ & 
-- (\write_ctrl|Add0~4_combout\ & ((\write_ctrl|addr_counter[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter[2]~1_combout\,
	datab => \write_ctrl|Add0~4_combout\,
	datac => \write_ctrl|addr_counter\(2),
	datad => \write_ctrl|addr_counter[0]~0_combout\,
	combout => \write_ctrl|addr_counter[2]~10_combout\);

-- Location: LCFF_X18_Y33_N31
\write_ctrl|addr_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[2]~10_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(2));

-- Location: LCCOMB_X17_Y33_N8
\write_ctrl|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~8_combout\ = (\write_ctrl|addr_counter\(4) & (\write_ctrl|Add0~7\ $ (GND))) # (!\write_ctrl|addr_counter\(4) & (!\write_ctrl|Add0~7\ & VCC))
-- \write_ctrl|Add0~9\ = CARRY((\write_ctrl|addr_counter\(4) & !\write_ctrl|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(4),
	datad => VCC,
	cin => \write_ctrl|Add0~7\,
	combout => \write_ctrl|Add0~8_combout\,
	cout => \write_ctrl|Add0~9\);

-- Location: LCCOMB_X18_Y33_N10
\write_ctrl|addr_counter[4]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[4]~8_combout\ = (\write_ctrl|addr_counter[2]~1_combout\ & ((\write_ctrl|addr_counter\(4)) # ((\write_ctrl|addr_counter[0]~0_combout\ & \write_ctrl|Add0~8_combout\)))) # (!\write_ctrl|addr_counter[2]~1_combout\ & 
-- (\write_ctrl|addr_counter[0]~0_combout\ & ((\write_ctrl|Add0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter[2]~1_combout\,
	datab => \write_ctrl|addr_counter[0]~0_combout\,
	datac => \write_ctrl|addr_counter\(4),
	datad => \write_ctrl|Add0~8_combout\,
	combout => \write_ctrl|addr_counter[4]~8_combout\);

-- Location: LCFF_X18_Y33_N11
\write_ctrl|addr_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[4]~8_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(4));

-- Location: LCCOMB_X17_Y33_N10
\write_ctrl|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~10_combout\ = (\write_ctrl|addr_counter\(5) & (!\write_ctrl|Add0~9\)) # (!\write_ctrl|addr_counter\(5) & ((\write_ctrl|Add0~9\) # (GND)))
-- \write_ctrl|Add0~11\ = CARRY((!\write_ctrl|Add0~9\) # (!\write_ctrl|addr_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(5),
	datad => VCC,
	cin => \write_ctrl|Add0~9\,
	combout => \write_ctrl|Add0~10_combout\,
	cout => \write_ctrl|Add0~11\);

-- Location: LCCOMB_X17_Y33_N12
\write_ctrl|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~12_combout\ = (\write_ctrl|addr_counter\(6) & (\write_ctrl|Add0~11\ $ (GND))) # (!\write_ctrl|addr_counter\(6) & (!\write_ctrl|Add0~11\ & VCC))
-- \write_ctrl|Add0~13\ = CARRY((\write_ctrl|addr_counter\(6) & !\write_ctrl|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter\(6),
	datad => VCC,
	cin => \write_ctrl|Add0~11\,
	combout => \write_ctrl|Add0~12_combout\,
	cout => \write_ctrl|Add0~13\);

-- Location: LCCOMB_X17_Y33_N14
\write_ctrl|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~14_combout\ = (\write_ctrl|addr_counter\(7) & (!\write_ctrl|Add0~13\)) # (!\write_ctrl|addr_counter\(7) & ((\write_ctrl|Add0~13\) # (GND)))
-- \write_ctrl|Add0~15\ = CARRY((!\write_ctrl|Add0~13\) # (!\write_ctrl|addr_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(7),
	datad => VCC,
	cin => \write_ctrl|Add0~13\,
	combout => \write_ctrl|Add0~14_combout\,
	cout => \write_ctrl|Add0~15\);

-- Location: LCCOMB_X18_Y33_N22
\write_ctrl|addr_counter[7]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[7]~5_combout\ = (\write_ctrl|addr_counter[2]~1_combout\ & ((\write_ctrl|addr_counter\(7)) # ((\write_ctrl|addr_counter[0]~0_combout\ & \write_ctrl|Add0~14_combout\)))) # (!\write_ctrl|addr_counter[2]~1_combout\ & 
-- (\write_ctrl|addr_counter[0]~0_combout\ & ((\write_ctrl|Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter[2]~1_combout\,
	datab => \write_ctrl|addr_counter[0]~0_combout\,
	datac => \write_ctrl|addr_counter\(7),
	datad => \write_ctrl|Add0~14_combout\,
	combout => \write_ctrl|addr_counter[7]~5_combout\);

-- Location: LCFF_X18_Y33_N23
\write_ctrl|addr_counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[7]~5_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(7));

-- Location: LCCOMB_X17_Y33_N30
\write_ctrl|addr_counter[10]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[10]~2_combout\ = (\write_ctrl|Add0~20_combout\ & ((\write_ctrl|addr_counter[0]~0_combout\) # ((\write_ctrl|addr_counter[2]~1_combout\ & \write_ctrl|addr_counter\(10))))) # (!\write_ctrl|Add0~20_combout\ & 
-- (\write_ctrl|addr_counter[2]~1_combout\ & (\write_ctrl|addr_counter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|Add0~20_combout\,
	datab => \write_ctrl|addr_counter[2]~1_combout\,
	datac => \write_ctrl|addr_counter\(10),
	datad => \write_ctrl|addr_counter[0]~0_combout\,
	combout => \write_ctrl|addr_counter[10]~2_combout\);

-- Location: LCFF_X17_Y33_N31
\write_ctrl|addr_counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[10]~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(10));

-- Location: LCCOMB_X17_Y33_N16
\write_ctrl|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Add0~16_combout\ = (\write_ctrl|addr_counter\(8) & (\write_ctrl|Add0~15\ $ (GND))) # (!\write_ctrl|addr_counter\(8) & (!\write_ctrl|Add0~15\ & VCC))
-- \write_ctrl|Add0~17\ = CARRY((\write_ctrl|addr_counter\(8) & !\write_ctrl|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter\(8),
	datad => VCC,
	cin => \write_ctrl|Add0~15\,
	combout => \write_ctrl|Add0~16_combout\,
	cout => \write_ctrl|Add0~17\);

-- Location: LCCOMB_X17_Y33_N24
\write_ctrl|addr_counter[9]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[9]~3_combout\ = (\write_ctrl|addr_counter[2]~1_combout\ & ((\write_ctrl|addr_counter\(9)) # ((\write_ctrl|Add0~18_combout\ & \write_ctrl|addr_counter[0]~0_combout\)))) # (!\write_ctrl|addr_counter[2]~1_combout\ & 
-- (\write_ctrl|Add0~18_combout\ & ((\write_ctrl|addr_counter[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter[2]~1_combout\,
	datab => \write_ctrl|Add0~18_combout\,
	datac => \write_ctrl|addr_counter\(9),
	datad => \write_ctrl|addr_counter[0]~0_combout\,
	combout => \write_ctrl|addr_counter[9]~3_combout\);

-- Location: LCFF_X17_Y33_N25
\write_ctrl|addr_counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[9]~3_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(9));

-- Location: LCCOMB_X18_Y33_N26
\write_ctrl|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|LessThan0~0_combout\ = (((!\write_ctrl|addr_counter\(9)) # (!\write_ctrl|addr_counter\(10))) # (!\write_ctrl|addr_counter\(7))) # (!\write_ctrl|addr_counter\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter\(8),
	datab => \write_ctrl|addr_counter\(7),
	datac => \write_ctrl|addr_counter\(10),
	datad => \write_ctrl|addr_counter\(9),
	combout => \write_ctrl|LessThan0~0_combout\);

-- Location: LCCOMB_X18_Y33_N6
\write_ctrl|addr_counter[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[6]~6_combout\ = (\write_ctrl|addr_counter[2]~1_combout\ & ((\write_ctrl|addr_counter\(6)) # ((\write_ctrl|addr_counter[0]~0_combout\ & \write_ctrl|Add0~12_combout\)))) # (!\write_ctrl|addr_counter[2]~1_combout\ & 
-- (\write_ctrl|addr_counter[0]~0_combout\ & ((\write_ctrl|Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter[2]~1_combout\,
	datab => \write_ctrl|addr_counter[0]~0_combout\,
	datac => \write_ctrl|addr_counter\(6),
	datad => \write_ctrl|Add0~12_combout\,
	combout => \write_ctrl|addr_counter[6]~6_combout\);

-- Location: LCFF_X18_Y33_N7
\write_ctrl|addr_counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[6]~6_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(6));

-- Location: LCCOMB_X18_Y33_N8
\write_ctrl|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|LessThan0~1_combout\ = (((!\write_ctrl|addr_counter\(3)) # (!\write_ctrl|addr_counter\(6))) # (!\write_ctrl|addr_counter\(5))) # (!\write_ctrl|addr_counter\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter\(4),
	datab => \write_ctrl|addr_counter\(5),
	datac => \write_ctrl|addr_counter\(6),
	datad => \write_ctrl|addr_counter\(3),
	combout => \write_ctrl|LessThan0~1_combout\);

-- Location: LCCOMB_X19_Y33_N30
\write_ctrl|LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|LessThan0~2_combout\ = ((!\write_ctrl|addr_counter\(0)) # (!\write_ctrl|addr_counter\(2))) # (!\write_ctrl|addr_counter\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(1),
	datac => \write_ctrl|addr_counter\(2),
	datad => \write_ctrl|addr_counter\(0),
	combout => \write_ctrl|LessThan0~2_combout\);

-- Location: LCCOMB_X18_Y33_N18
\write_ctrl|process_0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|process_0~2_combout\ = (\write_ctrl|state.S_LOAD_BRAM~regout\ & ((\write_ctrl|LessThan0~0_combout\) # ((\write_ctrl|LessThan0~1_combout\) # (\write_ctrl|LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|state.S_LOAD_BRAM~regout\,
	datab => \write_ctrl|LessThan0~0_combout\,
	datac => \write_ctrl|LessThan0~1_combout\,
	datad => \write_ctrl|LessThan0~2_combout\,
	combout => \write_ctrl|process_0~2_combout\);

-- Location: LCCOMB_X19_Y33_N26
\write_ctrl|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Selector1~0_combout\ = (\write_ctrl|process_0~2_combout\) # (!\write_ctrl|state.S_IDLE~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|state.S_IDLE~regout\,
	datad => \write_ctrl|process_0~2_combout\,
	combout => \write_ctrl|Selector1~0_combout\);

-- Location: LCFF_X19_Y33_N27
\write_ctrl|state.S_LOAD_BRAM\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|Selector1~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|state.S_LOAD_BRAM~regout\);

-- Location: LCCOMB_X18_Y33_N4
\write_ctrl|addr_counter[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[0]~0_combout\ = (\write_ctrl|state.S_READ_BRAM~regout\) # ((\write_ctrl|state.S_LOAD_BRAM~regout\ & \write_ctrl|process_0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|state.S_READ_BRAM~regout\,
	datac => \write_ctrl|state.S_LOAD_BRAM~regout\,
	datad => \write_ctrl|process_0~2_combout\,
	combout => \write_ctrl|addr_counter[0]~0_combout\);

-- Location: LCCOMB_X18_Y33_N0
\write_ctrl|addr_counter[5]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[5]~7_combout\ = (\write_ctrl|addr_counter[2]~1_combout\ & ((\write_ctrl|addr_counter\(5)) # ((\write_ctrl|addr_counter[0]~0_combout\ & \write_ctrl|Add0~10_combout\)))) # (!\write_ctrl|addr_counter[2]~1_combout\ & 
-- (\write_ctrl|addr_counter[0]~0_combout\ & ((\write_ctrl|Add0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter[2]~1_combout\,
	datab => \write_ctrl|addr_counter[0]~0_combout\,
	datac => \write_ctrl|addr_counter\(5),
	datad => \write_ctrl|Add0~10_combout\,
	combout => \write_ctrl|addr_counter[5]~7_combout\);

-- Location: LCFF_X18_Y33_N1
\write_ctrl|addr_counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[5]~7_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(5));

-- Location: LCCOMB_X18_Y33_N28
\write_ctrl|Equal1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Equal1~1_combout\ = (!\write_ctrl|addr_counter\(6) & (!\write_ctrl|addr_counter\(5) & (!\write_ctrl|addr_counter\(4) & !\write_ctrl|addr_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter\(6),
	datab => \write_ctrl|addr_counter\(5),
	datac => \write_ctrl|addr_counter\(4),
	datad => \write_ctrl|addr_counter\(3),
	combout => \write_ctrl|Equal1~1_combout\);

-- Location: LCCOMB_X18_Y33_N20
\write_ctrl|Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Equal1~0_combout\ = (!\write_ctrl|addr_counter\(8) & (!\write_ctrl|addr_counter\(7) & (!\write_ctrl|addr_counter\(10) & !\write_ctrl|addr_counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter\(8),
	datab => \write_ctrl|addr_counter\(7),
	datac => \write_ctrl|addr_counter\(10),
	datad => \write_ctrl|addr_counter\(9),
	combout => \write_ctrl|Equal1~0_combout\);

-- Location: LCCOMB_X19_Y33_N20
\write_ctrl|Equal1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Equal1~2_combout\ = (!\write_ctrl|addr_counter\(1) & (!\write_ctrl|addr_counter\(2) & !\write_ctrl|addr_counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(1),
	datac => \write_ctrl|addr_counter\(2),
	datad => \write_ctrl|addr_counter\(0),
	combout => \write_ctrl|Equal1~2_combout\);

-- Location: LCCOMB_X18_Y33_N12
\write_ctrl|Equal1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Equal1~3_combout\ = (\write_ctrl|Equal1~1_combout\ & (\write_ctrl|Equal1~0_combout\ & \write_ctrl|Equal1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|Equal1~1_combout\,
	datac => \write_ctrl|Equal1~0_combout\,
	datad => \write_ctrl|Equal1~2_combout\,
	combout => \write_ctrl|Equal1~3_combout\);

-- Location: LCCOMB_X18_Y33_N2
\write_ctrl|process_0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|process_0~3_combout\ = (\write_ctrl|state.S_LOAD_BRAM~regout\ & (!\write_ctrl|LessThan0~1_combout\ & (!\write_ctrl|LessThan0~2_combout\ & !\write_ctrl|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|state.S_LOAD_BRAM~regout\,
	datab => \write_ctrl|LessThan0~1_combout\,
	datac => \write_ctrl|LessThan0~2_combout\,
	datad => \write_ctrl|LessThan0~0_combout\,
	combout => \write_ctrl|process_0~3_combout\);

-- Location: LCCOMB_X17_Y33_N26
\write_ctrl|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Selector2~0_combout\ = (\write_ctrl|process_0~3_combout\) # ((\write_ctrl|state.S_WRITE_FIFO~regout\ & (!\fifo_inst|scfifo_component|auto_generated|dffe_af~regout\ & !\write_ctrl|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datab => \fifo_inst|scfifo_component|auto_generated|dffe_af~regout\,
	datac => \write_ctrl|Equal1~3_combout\,
	datad => \write_ctrl|process_0~3_combout\,
	combout => \write_ctrl|Selector2~0_combout\);

-- Location: LCCOMB_X17_Y33_N28
\write_ctrl|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|Selector2~1_combout\ = (\write_ctrl|Selector2~0_combout\) # ((\write_ctrl|state.S_WAIT_FIFO~regout\ & !\write_ctrl|Selector4~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|state.S_WAIT_FIFO~regout\,
	datac => \write_ctrl|Selector4~1_combout\,
	datad => \write_ctrl|Selector2~0_combout\,
	combout => \write_ctrl|Selector2~1_combout\);

-- Location: LCFF_X17_Y33_N29
\write_ctrl|state.S_READ_BRAM\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|Selector2~1_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|state.S_READ_BRAM~regout\);

-- Location: LCFF_X22_Y33_N21
\write_ctrl|state.S_WRITE_FIFO\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \write_ctrl|state.S_READ_BRAM~regout\,
	aclr => \reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|state.S_WRITE_FIFO~regout\);

-- Location: LCCOMB_X22_Y33_N14
\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ = (\write_ctrl|state.S_WRITE_FIFO~regout\ & !\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\);

-- Location: LCFF_X21_Y33_N17
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8));

-- Location: LCCOMB_X22_Y33_N20
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\ & !\read_ctrl|state.S_READ_FIFO~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\,
	datad => \read_ctrl|state.S_READ_FIFO~regout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\);

-- Location: LCCOMB_X22_Y33_N0
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\) # ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\ & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8) & \fifo_inst|scfifo_component|auto_generated|dffe_af~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\,
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(8),
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dffe_af~7_combout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\);

-- Location: LCFF_X22_Y33_N1
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\);

-- Location: LCFF_X21_Y33_N7
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit1a[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3));

-- Location: LCCOMB_X22_Y33_N2
\fifo_inst|scfifo_component|auto_generated|dffe_af~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dffe_af~9_combout\ = (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2) & \fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(1),
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(3),
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|safe_q\(2),
	datad => \fifo_inst|scfifo_component|auto_generated|dffe_af~0_combout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dffe_af~9_combout\);

-- Location: LCCOMB_X22_Y33_N28
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\ & 
-- ((\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\) # ((!\fifo_inst|scfifo_component|auto_generated|dffe_af~9_combout\) # (!\read_ctrl|state.S_READ_FIFO~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\,
	datab => \read_ctrl|state.S_READ_FIFO~regout\,
	datac => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dffe_af~9_combout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\);

-- Location: LCCOMB_X22_Y33_N16
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\) # ((\write_ctrl|state.S_WRITE_FIFO~regout\) # 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~regout\,
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\);

-- Location: LCFF_X22_Y33_N17
\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\);

-- Location: LCCOMB_X23_Y33_N24
\read_ctrl|state.S_IDLE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|state.S_IDLE~0_combout\ = (\read_ctrl|state.S_IDLE~regout\) # (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \read_ctrl|state.S_IDLE~regout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\,
	combout => \read_ctrl|state.S_IDLE~0_combout\);

-- Location: LCFF_X23_Y33_N25
\read_ctrl|state.S_IDLE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|state.S_IDLE~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|state.S_IDLE~regout\);

-- Location: LCCOMB_X25_Y33_N8
\read_ctrl|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~2_combout\ = (\read_ctrl|addr_counter\(1) & (!\read_ctrl|Add0~1\)) # (!\read_ctrl|addr_counter\(1) & ((\read_ctrl|Add0~1\) # (GND)))
-- \read_ctrl|Add0~3\ = CARRY((!\read_ctrl|Add0~1\) # (!\read_ctrl|addr_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(1),
	datad => VCC,
	cin => \read_ctrl|Add0~1\,
	combout => \read_ctrl|Add0~2_combout\,
	cout => \read_ctrl|Add0~3\);

-- Location: LCCOMB_X25_Y33_N10
\read_ctrl|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~4_combout\ = (\read_ctrl|addr_counter\(2) & (\read_ctrl|Add0~3\ $ (GND))) # (!\read_ctrl|addr_counter\(2) & (!\read_ctrl|Add0~3\ & VCC))
-- \read_ctrl|Add0~5\ = CARRY((\read_ctrl|addr_counter\(2) & !\read_ctrl|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(2),
	datad => VCC,
	cin => \read_ctrl|Add0~3\,
	combout => \read_ctrl|Add0~4_combout\,
	cout => \read_ctrl|Add0~5\);

-- Location: LCCOMB_X24_Y33_N26
\read_ctrl|addr_counter[2]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[2]~9_combout\ = (\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|Add0~4_combout\ & ((\read_ctrl|addr_counter[0]~0_combout\)))) # (!\read_ctrl|state.S_WRITE_BRAM~regout\ & ((\read_ctrl|addr_counter\(2)) # 
-- ((\read_ctrl|Add0~4_combout\ & \read_ctrl|addr_counter[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datab => \read_ctrl|Add0~4_combout\,
	datac => \read_ctrl|addr_counter\(2),
	datad => \read_ctrl|addr_counter[0]~0_combout\,
	combout => \read_ctrl|addr_counter[2]~9_combout\);

-- Location: LCFF_X24_Y33_N27
\read_ctrl|addr_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[2]~9_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(2));

-- Location: LCCOMB_X25_Y33_N14
\read_ctrl|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~8_combout\ = (\read_ctrl|addr_counter\(4) & (\read_ctrl|Add0~7\ $ (GND))) # (!\read_ctrl|addr_counter\(4) & (!\read_ctrl|Add0~7\ & VCC))
-- \read_ctrl|Add0~9\ = CARRY((\read_ctrl|addr_counter\(4) & !\read_ctrl|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(4),
	datad => VCC,
	cin => \read_ctrl|Add0~7\,
	combout => \read_ctrl|Add0~8_combout\,
	cout => \read_ctrl|Add0~9\);

-- Location: LCCOMB_X24_Y33_N4
\read_ctrl|addr_counter[4]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[4]~7_combout\ = (\read_ctrl|addr_counter[0]~0_combout\ & ((\read_ctrl|Add0~8_combout\) # ((\read_ctrl|addr_counter\(4) & !\read_ctrl|state.S_WRITE_BRAM~regout\)))) # (!\read_ctrl|addr_counter[0]~0_combout\ & 
-- (((\read_ctrl|addr_counter\(4) & !\read_ctrl|state.S_WRITE_BRAM~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|addr_counter[0]~0_combout\,
	datab => \read_ctrl|Add0~8_combout\,
	datac => \read_ctrl|addr_counter\(4),
	datad => \read_ctrl|state.S_WRITE_BRAM~regout\,
	combout => \read_ctrl|addr_counter[4]~7_combout\);

-- Location: LCFF_X24_Y33_N5
\read_ctrl|addr_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[4]~7_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(4));

-- Location: LCCOMB_X25_Y33_N18
\read_ctrl|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~12_combout\ = (\read_ctrl|addr_counter\(6) & (\read_ctrl|Add0~11\ $ (GND))) # (!\read_ctrl|addr_counter\(6) & (!\read_ctrl|Add0~11\ & VCC))
-- \read_ctrl|Add0~13\ = CARRY((\read_ctrl|addr_counter\(6) & !\read_ctrl|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(6),
	datad => VCC,
	cin => \read_ctrl|Add0~11\,
	combout => \read_ctrl|Add0~12_combout\,
	cout => \read_ctrl|Add0~13\);

-- Location: LCCOMB_X24_Y33_N24
\read_ctrl|addr_counter[6]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[6]~5_combout\ = (\read_ctrl|addr_counter[0]~0_combout\ & ((\read_ctrl|Add0~12_combout\) # ((!\read_ctrl|state.S_WRITE_BRAM~regout\ & \read_ctrl|addr_counter\(6))))) # (!\read_ctrl|addr_counter[0]~0_combout\ & 
-- (!\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|addr_counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|addr_counter[0]~0_combout\,
	datab => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datac => \read_ctrl|addr_counter\(6),
	datad => \read_ctrl|Add0~12_combout\,
	combout => \read_ctrl|addr_counter[6]~5_combout\);

-- Location: LCFF_X24_Y33_N25
\read_ctrl|addr_counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[6]~5_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(6));

-- Location: LCCOMB_X25_Y33_N20
\read_ctrl|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Add0~14_combout\ = (\read_ctrl|addr_counter\(7) & (!\read_ctrl|Add0~13\)) # (!\read_ctrl|addr_counter\(7) & ((\read_ctrl|Add0~13\) # (GND)))
-- \read_ctrl|Add0~15\ = CARRY((!\read_ctrl|Add0~13\) # (!\read_ctrl|addr_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(7),
	datad => VCC,
	cin => \read_ctrl|Add0~13\,
	combout => \read_ctrl|Add0~14_combout\,
	cout => \read_ctrl|Add0~15\);

-- Location: LCCOMB_X24_Y33_N28
\read_ctrl|addr_counter[7]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[7]~4_combout\ = (\read_ctrl|addr_counter[0]~0_combout\ & ((\read_ctrl|Add0~14_combout\) # ((!\read_ctrl|state.S_WRITE_BRAM~regout\ & \read_ctrl|addr_counter\(7))))) # (!\read_ctrl|addr_counter[0]~0_combout\ & 
-- (!\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|addr_counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|addr_counter[0]~0_combout\,
	datab => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datac => \read_ctrl|addr_counter\(7),
	datad => \read_ctrl|Add0~14_combout\,
	combout => \read_ctrl|addr_counter[7]~4_combout\);

-- Location: LCFF_X24_Y33_N29
\read_ctrl|addr_counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[7]~4_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(7));

-- Location: LCCOMB_X25_Y33_N0
\read_ctrl|addr_counter[8]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[8]~3_combout\ = (\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|addr_counter[0]~0_combout\ & ((\read_ctrl|Add0~16_combout\)))) # (!\read_ctrl|state.S_WRITE_BRAM~regout\ & ((\read_ctrl|addr_counter\(8)) # 
-- ((\read_ctrl|addr_counter[0]~0_combout\ & \read_ctrl|Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datab => \read_ctrl|addr_counter[0]~0_combout\,
	datac => \read_ctrl|addr_counter\(8),
	datad => \read_ctrl|Add0~16_combout\,
	combout => \read_ctrl|addr_counter[8]~3_combout\);

-- Location: LCFF_X25_Y33_N1
\read_ctrl|addr_counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[8]~3_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(8));

-- Location: LCCOMB_X25_Y33_N30
\read_ctrl|addr_counter[9]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[9]~2_combout\ = (\read_ctrl|Add0~18_combout\ & ((\read_ctrl|addr_counter[0]~0_combout\) # ((!\read_ctrl|state.S_WRITE_BRAM~regout\ & \read_ctrl|addr_counter\(9))))) # (!\read_ctrl|Add0~18_combout\ & 
-- (!\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|addr_counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|Add0~18_combout\,
	datab => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datac => \read_ctrl|addr_counter\(9),
	datad => \read_ctrl|addr_counter[0]~0_combout\,
	combout => \read_ctrl|addr_counter[9]~2_combout\);

-- Location: LCFF_X25_Y33_N31
\read_ctrl|addr_counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[9]~2_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(9));

-- Location: LCCOMB_X24_Y33_N10
\read_ctrl|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Equal0~0_combout\ = (\read_ctrl|addr_counter\(10) & (\read_ctrl|addr_counter\(7) & (\read_ctrl|addr_counter\(8) & \read_ctrl|addr_counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|addr_counter\(10),
	datab => \read_ctrl|addr_counter\(7),
	datac => \read_ctrl|addr_counter\(8),
	datad => \read_ctrl|addr_counter\(9),
	combout => \read_ctrl|Equal0~0_combout\);

-- Location: LCCOMB_X24_Y33_N16
\read_ctrl|addr_counter[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[0]~0_combout\ = (\read_ctrl|state.S_WRITE_BRAM~regout\ & (((!\read_ctrl|Equal0~0_combout\) # (!\read_ctrl|Equal0~2_combout\)) # (!\read_ctrl|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|Equal0~1_combout\,
	datab => \read_ctrl|Equal0~2_combout\,
	datac => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datad => \read_ctrl|Equal0~0_combout\,
	combout => \read_ctrl|addr_counter[0]~0_combout\);

-- Location: LCCOMB_X25_Y33_N2
\read_ctrl|addr_counter[0]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[0]~11_combout\ = (\read_ctrl|Add0~0_combout\ & ((\read_ctrl|addr_counter[0]~0_combout\) # ((!\read_ctrl|state.S_WRITE_BRAM~regout\ & \read_ctrl|addr_counter\(0))))) # (!\read_ctrl|Add0~0_combout\ & 
-- (!\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|addr_counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|Add0~0_combout\,
	datab => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datac => \read_ctrl|addr_counter\(0),
	datad => \read_ctrl|addr_counter[0]~0_combout\,
	combout => \read_ctrl|addr_counter[0]~11_combout\);

-- Location: LCFF_X25_Y33_N3
\read_ctrl|addr_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[0]~11_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(0));

-- Location: LCCOMB_X25_Y33_N28
\read_ctrl|addr_counter[1]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|addr_counter[1]~10_combout\ = (\read_ctrl|state.S_WRITE_BRAM~regout\ & (\read_ctrl|Add0~2_combout\ & ((\read_ctrl|addr_counter[0]~0_combout\)))) # (!\read_ctrl|state.S_WRITE_BRAM~regout\ & ((\read_ctrl|addr_counter\(1)) # 
-- ((\read_ctrl|Add0~2_combout\ & \read_ctrl|addr_counter[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datab => \read_ctrl|Add0~2_combout\,
	datac => \read_ctrl|addr_counter\(1),
	datad => \read_ctrl|addr_counter[0]~0_combout\,
	combout => \read_ctrl|addr_counter[1]~10_combout\);

-- Location: LCFF_X25_Y33_N29
\read_ctrl|addr_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|addr_counter[1]~10_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|addr_counter\(1));

-- Location: LCCOMB_X24_Y33_N0
\read_ctrl|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Equal0~2_combout\ = (\read_ctrl|addr_counter\(1) & (\read_ctrl|addr_counter\(2) & \read_ctrl|addr_counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|addr_counter\(1),
	datac => \read_ctrl|addr_counter\(2),
	datad => \read_ctrl|addr_counter\(0),
	combout => \read_ctrl|Equal0~2_combout\);

-- Location: LCCOMB_X24_Y33_N2
\read_ctrl|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Equal0~3_combout\ = (\read_ctrl|Equal0~1_combout\ & (\read_ctrl|Equal0~2_combout\ & \read_ctrl|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|Equal0~1_combout\,
	datab => \read_ctrl|Equal0~2_combout\,
	datad => \read_ctrl|Equal0~0_combout\,
	combout => \read_ctrl|Equal0~3_combout\);

-- Location: LCCOMB_X23_Y33_N28
\read_ctrl|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|Selector0~0_combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\ & (((\read_ctrl|state.S_WRITE_BRAM~regout\ & !\read_ctrl|Equal0~3_combout\)) # (!\read_ctrl|state.S_IDLE~regout\))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\ & (\read_ctrl|state.S_WRITE_BRAM~regout\ & ((!\read_ctrl|Equal0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\,
	datab => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datac => \read_ctrl|state.S_IDLE~regout\,
	datad => \read_ctrl|Equal0~3_combout\,
	combout => \read_ctrl|Selector0~0_combout\);

-- Location: LCFF_X23_Y33_N29
\read_ctrl|state.S_READ_FIFO\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|Selector0~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|state.S_READ_FIFO~regout\);

-- Location: LCCOMB_X23_Y33_N30
\read_ctrl|state.S_WRITE_BRAM~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|state.S_WRITE_BRAM~feeder_combout\ = \read_ctrl|state.S_READ_FIFO~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \read_ctrl|state.S_READ_FIFO~regout\,
	combout => \read_ctrl|state.S_WRITE_BRAM~feeder_combout\);

-- Location: LCFF_X23_Y33_N31
\read_ctrl|state.S_WRITE_BRAM\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|state.S_WRITE_BRAM~feeder_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|state.S_WRITE_BRAM~regout\);

-- Location: LCCOMB_X23_Y33_N20
\read_ctrl|state.S_DONE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \read_ctrl|state.S_DONE~0_combout\ = (\read_ctrl|state.S_DONE~regout\) # ((\read_ctrl|state.S_WRITE_BRAM~regout\ & \read_ctrl|Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|state.S_WRITE_BRAM~regout\,
	datac => \read_ctrl|state.S_DONE~regout\,
	datad => \read_ctrl|Equal0~3_combout\,
	combout => \read_ctrl|state.S_DONE~0_combout\);

-- Location: LCFF_X23_Y33_N21
\read_ctrl|state.S_DONE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \read_ctrl|state.S_DONE~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \read_ctrl|state.S_DONE~regout\);

-- Location: LCCOMB_X19_Y33_N24
\write_ctrl|state.S_DONE~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|state.S_DONE~0_combout\ = (\write_ctrl|state.S_DONE~regout\) # ((!\fifo_inst|scfifo_component|auto_generated|dffe_af~regout\ & (\write_ctrl|state.S_WRITE_FIFO~regout\ & \write_ctrl|Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dffe_af~regout\,
	datab => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datac => \write_ctrl|state.S_DONE~regout\,
	datad => \write_ctrl|Equal1~3_combout\,
	combout => \write_ctrl|state.S_DONE~0_combout\);

-- Location: LCFF_X19_Y33_N25
\write_ctrl|state.S_DONE\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|state.S_DONE~0_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|state.S_DONE~regout\);

-- Location: LCCOMB_X19_Y33_N22
\done~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \done~0_combout\ = (\read_ctrl|state.S_DONE~regout\ & \write_ctrl|state.S_DONE~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \read_ctrl|state.S_DONE~regout\,
	datac => \write_ctrl|state.S_DONE~regout\,
	combout => \done~0_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X25_Y34_N0
\write_ctrl|bram_data_out[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|bram_data_out[0]~0_combout\ = (\write_ctrl|addr_counter\(0) & \write_ctrl|state.S_LOAD_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|addr_counter\(0),
	datad => \write_ctrl|state.S_LOAD_BRAM~regout\,
	combout => \write_ctrl|bram_data_out[0]~0_combout\);

-- Location: LCCOMB_X18_Y33_N16
\write_ctrl|addr_counter[8]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|addr_counter[8]~4_combout\ = (\write_ctrl|addr_counter[2]~1_combout\ & ((\write_ctrl|addr_counter\(8)) # ((\write_ctrl|addr_counter[0]~0_combout\ & \write_ctrl|Add0~16_combout\)))) # (!\write_ctrl|addr_counter[2]~1_combout\ & 
-- (\write_ctrl|addr_counter[0]~0_combout\ & ((\write_ctrl|Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_ctrl|addr_counter[2]~1_combout\,
	datab => \write_ctrl|addr_counter[0]~0_combout\,
	datac => \write_ctrl|addr_counter\(8),
	datad => \write_ctrl|Add0~16_combout\,
	combout => \write_ctrl|addr_counter[8]~4_combout\);

-- Location: LCFF_X18_Y33_N17
\write_ctrl|addr_counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \write_ctrl|addr_counter[8]~4_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \write_ctrl|addr_counter\(8));

-- Location: LCCOMB_X19_Y33_N12
\write_ctrl|bram_data_out[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|bram_data_out[1]~1_combout\ = (\write_ctrl|addr_counter\(1) & \write_ctrl|state.S_LOAD_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(1),
	datad => \write_ctrl|state.S_LOAD_BRAM~regout\,
	combout => \write_ctrl|bram_data_out[1]~1_combout\);

-- Location: M4K_X26_Y34
\src_bram|altsyncram_component|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "BRAM_Origem:src_bram|altsyncram:altsyncram_component|altsyncram_m7a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \write_ctrl|state.S_LOAD_BRAM~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \src_bram|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X25_Y34_N16
\write_ctrl|fifo_data_out[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|fifo_data_out[0]~0_combout\ = (\write_ctrl|state.S_WRITE_FIFO~regout\ & \src_bram|altsyncram_component|auto_generated|q_a\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \src_bram|altsyncram_component|auto_generated|q_a\(0),
	combout => \write_ctrl|fifo_data_out[0]~0_combout\);

-- Location: LCCOMB_X25_Y34_N30
\write_ctrl|fifo_data_out[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|fifo_data_out[1]~1_combout\ = (\write_ctrl|state.S_WRITE_FIFO~regout\ & \src_bram|altsyncram_component|auto_generated|q_a\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \src_bram|altsyncram_component|auto_generated|q_a\(1),
	combout => \write_ctrl|fifo_data_out[1]~1_combout\);

-- Location: LCCOMB_X14_Y33_N8
\write_ctrl|bram_data_out[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|bram_data_out[2]~2_combout\ = (\write_ctrl|addr_counter\(2) & \write_ctrl|state.S_LOAD_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|addr_counter\(2),
	datad => \write_ctrl|state.S_LOAD_BRAM~regout\,
	combout => \write_ctrl|bram_data_out[2]~2_combout\);

-- Location: LCCOMB_X14_Y33_N10
\write_ctrl|bram_data_out[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|bram_data_out[3]~3_combout\ = (\write_ctrl|addr_counter\(3) & \write_ctrl|state.S_LOAD_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \write_ctrl|addr_counter\(3),
	datad => \write_ctrl|state.S_LOAD_BRAM~regout\,
	combout => \write_ctrl|bram_data_out[3]~3_combout\);

-- Location: M4K_X13_Y33
\src_bram|altsyncram_component|auto_generated|ram_block1a2\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "BRAM_Origem:src_bram|altsyncram:altsyncram_component|altsyncram_m7a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \write_ctrl|state.S_LOAD_BRAM~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \src_bram|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LCCOMB_X22_Y33_N26
\write_ctrl|fifo_data_out[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|fifo_data_out[2]~2_combout\ = (\write_ctrl|state.S_WRITE_FIFO~regout\ & \src_bram|altsyncram_component|auto_generated|q_a\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \src_bram|altsyncram_component|auto_generated|q_a\(2),
	combout => \write_ctrl|fifo_data_out[2]~2_combout\);

-- Location: LCCOMB_X22_Y33_N8
\write_ctrl|fifo_data_out[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|fifo_data_out[3]~3_combout\ = (\write_ctrl|state.S_WRITE_FIFO~regout\ & \src_bram|altsyncram_component|auto_generated|q_a\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \src_bram|altsyncram_component|auto_generated|q_a\(3),
	combout => \write_ctrl|fifo_data_out[3]~3_combout\);

-- Location: LCCOMB_X25_Y31_N0
\write_ctrl|bram_data_out[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|bram_data_out[4]~4_combout\ = (\write_ctrl|addr_counter\(4) & \write_ctrl|state.S_LOAD_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|addr_counter\(4),
	datad => \write_ctrl|state.S_LOAD_BRAM~regout\,
	combout => \write_ctrl|bram_data_out[4]~4_combout\);

-- Location: LCCOMB_X25_Y31_N18
\write_ctrl|bram_data_out[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|bram_data_out[5]~5_combout\ = (\write_ctrl|addr_counter\(5) & \write_ctrl|state.S_LOAD_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|addr_counter\(5),
	datad => \write_ctrl|state.S_LOAD_BRAM~regout\,
	combout => \write_ctrl|bram_data_out[5]~5_combout\);

-- Location: M4K_X26_Y31
\src_bram|altsyncram_component|auto_generated|ram_block1a4\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "BRAM_Origem:src_bram|altsyncram:altsyncram_component|altsyncram_m7a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \write_ctrl|state.S_LOAD_BRAM~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \src_bram|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: LCCOMB_X25_Y32_N0
\write_ctrl|fifo_data_out[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|fifo_data_out[4]~4_combout\ = (\src_bram|altsyncram_component|auto_generated|q_a\(4) & \write_ctrl|state.S_WRITE_FIFO~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_bram|altsyncram_component|auto_generated|q_a\(4),
	datad => \write_ctrl|state.S_WRITE_FIFO~regout\,
	combout => \write_ctrl|fifo_data_out[4]~4_combout\);

-- Location: LCCOMB_X25_Y32_N22
\write_ctrl|fifo_data_out[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|fifo_data_out[5]~5_combout\ = (\src_bram|altsyncram_component|auto_generated|q_a\(5) & \write_ctrl|state.S_WRITE_FIFO~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \src_bram|altsyncram_component|auto_generated|q_a\(5),
	datad => \write_ctrl|state.S_WRITE_FIFO~regout\,
	combout => \write_ctrl|fifo_data_out[5]~5_combout\);

-- Location: LCCOMB_X14_Y32_N24
\write_ctrl|bram_data_out[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|bram_data_out[6]~6_combout\ = (\write_ctrl|addr_counter\(6) & \write_ctrl|state.S_LOAD_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|addr_counter\(6),
	datad => \write_ctrl|state.S_LOAD_BRAM~regout\,
	combout => \write_ctrl|bram_data_out[6]~6_combout\);

-- Location: LCCOMB_X14_Y32_N6
\write_ctrl|bram_data_out[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|bram_data_out[7]~7_combout\ = (\write_ctrl|addr_counter\(7) & \write_ctrl|state.S_LOAD_BRAM~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|addr_counter\(7),
	datad => \write_ctrl|state.S_LOAD_BRAM~regout\,
	combout => \write_ctrl|bram_data_out[7]~7_combout\);

-- Location: M4K_X13_Y32
\src_bram|altsyncram_component|auto_generated|ram_block1a6\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "BRAM_Origem:src_bram|altsyncram:altsyncram_component|altsyncram_m7a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \write_ctrl|state.S_LOAD_BRAM~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \src_bram|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: LCCOMB_X21_Y32_N8
\write_ctrl|fifo_data_out[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|fifo_data_out[6]~6_combout\ = (\write_ctrl|state.S_WRITE_FIFO~regout\ & \src_bram|altsyncram_component|auto_generated|q_a\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \src_bram|altsyncram_component|auto_generated|q_a\(6),
	combout => \write_ctrl|fifo_data_out[6]~6_combout\);

-- Location: LCCOMB_X21_Y32_N18
\write_ctrl|fifo_data_out[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \write_ctrl|fifo_data_out[7]~7_combout\ = (\write_ctrl|state.S_WRITE_FIFO~regout\ & \src_bram|altsyncram_component|auto_generated|q_a\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \write_ctrl|state.S_WRITE_FIFO~regout\,
	datad => \src_bram|altsyncram_component|auto_generated|q_a\(7),
	combout => \write_ctrl|fifo_data_out[7]~7_combout\);

-- Location: LCCOMB_X23_Y33_N22
\fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\ = (\read_ctrl|state.S_READ_FIFO~regout\ & \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \read_ctrl|state.S_READ_FIFO~regout\,
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~regout\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\);

-- Location: LCCOMB_X23_Y33_N0
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\ = \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(0) $ (VCC)
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ = CARRY(\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(0),
	datad => VCC,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\);

-- Location: LCFF_X23_Y33_N1
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(0));

-- Location: LCCOMB_X23_Y33_N2
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(1) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\)) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(1) & 
-- ((\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\) # (GND)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(1),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\);

-- Location: LCFF_X23_Y33_N3
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(1));

-- Location: LCCOMB_X23_Y33_N4
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(2) & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ $ (GND))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(2) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ & VCC))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(2) & 
-- !\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(2),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\);

-- Location: LCFF_X23_Y33_N5
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(2));

-- Location: LCCOMB_X23_Y33_N6
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(3) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\)) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(3) & 
-- ((\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\) # (GND)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(3),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\);

-- Location: LCFF_X23_Y33_N7
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(3));

-- Location: LCCOMB_X23_Y33_N8
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(4) & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ $ (GND))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(4) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ & VCC))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(4) & 
-- !\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(4),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\);

-- Location: LCFF_X23_Y33_N9
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(4));

-- Location: LCCOMB_X23_Y33_N10
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(5) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\)) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(5) & 
-- ((\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\) # (GND)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(5),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\);

-- Location: LCFF_X23_Y33_N11
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(5));

-- Location: LCCOMB_X23_Y33_N12
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(6) & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ $ (GND))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(6) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ & VCC))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(6) & 
-- !\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(6),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\);

-- Location: LCFF_X23_Y33_N13
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(6));

-- Location: LCCOMB_X23_Y33_N14
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(7) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\)) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(7) & 
-- ((\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\) # (GND)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(7),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\);

-- Location: LCFF_X23_Y33_N15
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(7));

-- Location: LCCOMB_X23_Y33_N16
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(8) & 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ $ (GND))) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(8) & 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ & VCC))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(8) & 
-- !\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(8),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\);

-- Location: LCFF_X23_Y33_N17
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(8));

-- Location: LCCOMB_X23_Y33_N18
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\ = \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\ $ 
-- (\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(9),
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\);

-- Location: LCFF_X23_Y33_N19
\fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit5a[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|rd_ptr_count|safe_q\(9));

-- Location: LCCOMB_X27_Y33_N0
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\ = \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(0) $ (VCC)
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ = CARRY(\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(0),
	datad => VCC,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\);

-- Location: LCFF_X27_Y33_N1
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(0));

-- Location: LCCOMB_X27_Y33_N2
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(1) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\)) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(1) & ((\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\) # (GND)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(1),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\);

-- Location: LCFF_X27_Y33_N3
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(1));

-- Location: LCCOMB_X27_Y33_N4
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(2) & (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ $ (GND))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(2) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ & VCC))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(2) & !\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(2),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\);

-- Location: LCFF_X27_Y33_N5
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(2));

-- Location: LCCOMB_X27_Y33_N6
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(3) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\)) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(3) & ((\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\) # (GND)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(3),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\);

-- Location: LCFF_X27_Y33_N7
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(3));

-- Location: LCCOMB_X27_Y33_N8
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(4) & (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ $ (GND))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(4) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ & VCC))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(4) & !\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(4),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\);

-- Location: LCFF_X27_Y33_N9
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(4));

-- Location: LCCOMB_X27_Y33_N10
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(5) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\)) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(5) & ((\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\) # (GND)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(5),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\);

-- Location: LCFF_X27_Y33_N11
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(5));

-- Location: LCCOMB_X27_Y33_N12
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(6) & (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ $ (GND))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(6) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ & VCC))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(6) & !\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(6),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\);

-- Location: LCFF_X27_Y33_N13
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(6));

-- Location: LCCOMB_X27_Y33_N14
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(7) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\)) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(7) & ((\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\) # (GND)))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ = CARRY((!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\) # (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(7),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\);

-- Location: LCFF_X27_Y33_N15
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(7));

-- Location: LCCOMB_X27_Y33_N16
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\ = (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(8) & (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ $ (GND))) # 
-- (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(8) & (!\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ & VCC))
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\ = CARRY((\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(8) & !\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(8),
	datad => VCC,
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\,
	cout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\);

-- Location: LCFF_X27_Y33_N17
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(8));

-- Location: LCCOMB_X27_Y33_N18
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9\ : cycloneii_lcell_comb
-- Equation(s):
-- \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\ = \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\ $ (\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(9),
	cin => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\,
	combout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\);

-- Location: LCFF_X27_Y33_N19
\fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit5a[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\,
	ena => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fifo_inst|scfifo_component|auto_generated|dpfifo|wr_ptr|safe_q\(9));

-- Location: M4K_X26_Y33
\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "FIFO:fifo_inst|scfifo:scfifo_component|scfifo_b5a1:auto_generated|a_dpfifo_3m31:dpfifo|dpram_9v01:FIFOram|altsyncram_quj1:altsyncram2|altsyncram_soc1:altsyncram3|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 10,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 4,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 1023,
	port_b_logical_ram_depth => 1024,
	port_b_logical_ram_width => 8,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock1",
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbrewe => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	clk0 => \clk~clkctrl_outclk\,
	clk1 => \clk~clkctrl_outclk\,
	ena0 => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	ena1 => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portadatain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAIN_bus\,
	portbdatain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTBDATAIN_bus\,
	portaaddr => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTAADDR_bus\,
	portbaddr => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a0_PORTADATAOUT_bus\);

-- Location: M4K_X26_Y32
\fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "FIFO:fifo_inst|scfifo:scfifo_component|scfifo_b5a1:auto_generated|a_dpfifo_3m31:dpfifo|dpram_9v01:FIFOram|altsyncram_quj1:altsyncram2|altsyncram_soc1:altsyncram3|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 8,
	port_a_write_enable_clear => "none",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 10,
	port_b_byte_enable_clear => "none",
	port_b_data_in_clear => "none",
	port_b_data_in_clock => "clock1",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 4,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 1023,
	port_b_logical_ram_depth => 1024,
	port_b_logical_ram_width => 8,
	port_b_read_enable_write_enable_clear => "none",
	port_b_read_enable_write_enable_clock => "clock1",
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portbrewe => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	clk0 => \clk~clkctrl_outclk\,
	clk1 => \clk~clkctrl_outclk\,
	ena0 => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	ena1 => \fifo_inst|scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portadatain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAIN_bus\,
	portbdatain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTBDATAIN_bus\,
	portaaddr => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTAADDR_bus\,
	portbaddr => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|ram_block4a4_PORTADATAOUT_bus\);

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\done~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \done~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_done);

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_entrada[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \write_ctrl|fifo_data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_entrada(0));

-- Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_entrada[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \write_ctrl|fifo_data_out[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_entrada(1));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_entrada[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \write_ctrl|fifo_data_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_entrada(2));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_entrada[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \write_ctrl|fifo_data_out[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_entrada(3));

-- Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_entrada[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \write_ctrl|fifo_data_out[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_entrada(4));

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_entrada[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \write_ctrl|fifo_data_out[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_entrada(5));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_entrada[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \write_ctrl|fifo_data_out[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_entrada(6));

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_entrada[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \write_ctrl|fifo_data_out[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_entrada(7));

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_saida[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_saida(0));

-- Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_saida[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_saida(1));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_saida[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_saida(2));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_saida[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_saida(3));

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_saida[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_saida(4));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_saida[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_saida(5));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_saida[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_saida(6));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dados_saida[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fifo_inst|scfifo_component|auto_generated|dpfifo|FIFOram|altsyncram2|altsyncram3|q_a\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dados_saida(7));
END structure;



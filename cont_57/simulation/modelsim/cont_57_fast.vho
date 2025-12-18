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

-- DATE "09/20/2025 23:46:34"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	cont_57 IS
    PORT (
	clk_50m : IN std_logic;
	rst : IN std_logic;
	clr : IN std_logic;
	en : IN std_logic;
	ld : IN std_logic;
	disp_ten : OUT std_logic_vector(6 DOWNTO 0);
	disp_un : OUT std_logic_vector(6 DOWNTO 0);
	clk_divided_out : OUT std_logic;
	carry_units_out : OUT std_logic;
	load_ten_out : OUT std_logic;
	load_units_out : OUT std_logic;
	tens_out : OUT IEEE.NUMERIC_STD.unsigned(3 DOWNTO 0);
	uns_out : OUT IEEE.NUMERIC_STD.unsigned(3 DOWNTO 0)
	);
END cont_57;

-- Design Ports Information
-- disp_ten[0]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_ten[1]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_ten[2]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_ten[3]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_ten[4]	=>  Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_ten[5]	=>  Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_ten[6]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_un[0]	=>  Location: PIN_F17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_un[1]	=>  Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_un[2]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_un[3]	=>  Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_un[4]	=>  Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_un[5]	=>  Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_un[6]	=>  Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk_divided_out	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- carry_units_out	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- load_ten_out	=>  Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- load_units_out	=>  Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- tens_out[0]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- tens_out[1]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- tens_out[2]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- tens_out[3]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- uns_out[0]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- uns_out[1]	=>  Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- uns_out[2]	=>  Location: PIN_J17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- uns_out[3]	=>  Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- en	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rst	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clr	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ld	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk_50m	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF cont_57 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50m : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_clr : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_ld : std_logic;
SIGNAL ww_disp_ten : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_disp_un : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_clk_divided_out : std_logic;
SIGNAL ww_carry_units_out : std_logic;
SIGNAL ww_load_ten_out : std_logic;
SIGNAL ww_load_units_out : std_logic;
SIGNAL ww_tens_out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_uns_out : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_50m~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_div_1s|temp~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \units_counter|Add0~0_combout\ : std_logic;
SIGNAL \clk_div_1s|temp~clkctrl_outclk\ : std_logic;
SIGNAL \clr~combout\ : std_logic;
SIGNAL \ld~combout\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \load_ten~0_combout\ : std_logic;
SIGNAL \en~combout\ : std_logic;
SIGNAL \units_counter|count_sig[0]~0_combout\ : std_logic;
SIGNAL \ten_counter|Add0~1_combout\ : std_logic;
SIGNAL \ten_counter|count_sig[3]~9_combout\ : std_logic;
SIGNAL \ten_counter|count_sig[3]~10_combout\ : std_logic;
SIGNAL \ten_counter|count_sig[3]~12_combout\ : std_logic;
SIGNAL \units_counter|count_sig[3]~3_combout\ : std_logic;
SIGNAL \units_counter|count_sig[2]~4_combout\ : std_logic;
SIGNAL \reached_68~1_combout\ : std_logic;
SIGNAL \units_counter|count_sig[3]~1_combout\ : std_logic;
SIGNAL \units_counter|count_sig[3]~5_combout\ : std_logic;
SIGNAL \units_counter|count_sig[1]~2_combout\ : std_logic;
SIGNAL \units_counter|Equal0~0_combout\ : std_logic;
SIGNAL \units_counter|co~combout\ : std_logic;
SIGNAL \ten_counter|count_sig[0]~8_combout\ : std_logic;
SIGNAL \ten_counter|Add0~0_combout\ : std_logic;
SIGNAL \ten_counter|count_sig[3]~13_combout\ : std_logic;
SIGNAL \ten_counter|count_sig[2]~11_combout\ : std_logic;
SIGNAL \reached_68~0_combout\ : std_logic;
SIGNAL \load_ten~1_combout\ : std_logic;
SIGNAL \ten_counter|count_sig[1]~14_combout\ : std_logic;
SIGNAL \ten_display|Mux6~0_combout\ : std_logic;
SIGNAL \ten_display|Mux5~0_combout\ : std_logic;
SIGNAL \ten_display|Mux4~0_combout\ : std_logic;
SIGNAL \ten_display|Mux3~0_combout\ : std_logic;
SIGNAL \ten_display|Mux2~0_combout\ : std_logic;
SIGNAL \ten_display|Mux1~0_combout\ : std_logic;
SIGNAL \ten_display|Mux0~0_combout\ : std_logic;
SIGNAL \units_display|Mux6~0_combout\ : std_logic;
SIGNAL \units_display|Mux5~0_combout\ : std_logic;
SIGNAL \units_display|Mux4~0_combout\ : std_logic;
SIGNAL \units_display|Mux3~0_combout\ : std_logic;
SIGNAL \units_display|Mux2~0_combout\ : std_logic;
SIGNAL \units_display|Mux1~0_combout\ : std_logic;
SIGNAL \units_display|Mux0~0_combout\ : std_logic;
SIGNAL \clk_50m~combout\ : std_logic;
SIGNAL \clk_50m~clkctrl_outclk\ : std_logic;
SIGNAL \clk_div_1s|P_div:count[0]~0_combout\ : std_logic;
SIGNAL \clk_div_1s|P_div:count[0]~regout\ : std_logic;
SIGNAL \clk_div_1s|temp~0_combout\ : std_logic;
SIGNAL \clk_div_1s|temp~regout\ : std_logic;
SIGNAL \units_counter|count_sig\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ten_counter|count_sig\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_load_ten~1_combout\ : std_logic;
SIGNAL \units_counter|ALT_INV_co~combout\ : std_logic;
SIGNAL \units_display|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ten_display|ALT_INV_Mux0~0_combout\ : std_logic;

BEGIN

ww_clk_50m <= clk_50m;
ww_rst <= rst;
ww_clr <= clr;
ww_en <= en;
ww_ld <= ld;
disp_ten <= ww_disp_ten;
disp_un <= ww_disp_un;
clk_divided_out <= ww_clk_divided_out;
carry_units_out <= ww_carry_units_out;
load_ten_out <= ww_load_ten_out;
load_units_out <= ww_load_units_out;
tens_out <= IEEE.NUMERIC_STD.UNSIGNED(ww_tens_out);
uns_out <= IEEE.NUMERIC_STD.UNSIGNED(ww_uns_out);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_50m~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk_50m~combout\);

\clk_div_1s|temp~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk_div_1s|temp~regout\);
\ALT_INV_load_ten~1_combout\ <= NOT \load_ten~1_combout\;
\units_counter|ALT_INV_co~combout\ <= NOT \units_counter|co~combout\;
\units_display|ALT_INV_Mux0~0_combout\ <= NOT \units_display|Mux0~0_combout\;
\ten_display|ALT_INV_Mux0~0_combout\ <= NOT \ten_display|Mux0~0_combout\;

-- Location: LCCOMB_X43_Y35_N30
\units_counter|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|Add0~0_combout\ = \units_counter|count_sig\(2) $ (((\units_counter|count_sig\(1) & \units_counter|count_sig\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(1),
	datac => \units_counter|count_sig\(2),
	datad => \units_counter|count_sig\(0),
	combout => \units_counter|Add0~0_combout\);

-- Location: CLKCTRL_G11
\clk_div_1s|temp~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_div_1s|temp~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_div_1s|temp~clkctrl_outclk\);

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clr~I\ : cycloneii_io
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
	padio => ww_clr,
	combout => \clr~combout\);

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ld~I\ : cycloneii_io
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
	padio => ww_ld,
	combout => \ld~combout\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst~I\ : cycloneii_io
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
	padio => ww_rst,
	combout => \rst~combout\);

-- Location: LCCOMB_X30_Y35_N4
\load_ten~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \load_ten~0_combout\ = (!\clr~combout\ & (!\ld~combout\ & !\rst~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clr~combout\,
	datac => \ld~combout\,
	datad => \rst~combout\,
	combout => \load_ten~0_combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\en~I\ : cycloneii_io
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
	padio => ww_en,
	combout => \en~combout\);

-- Location: LCCOMB_X42_Y35_N8
\units_counter|count_sig[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|count_sig[0]~0_combout\ = (\load_ten~1_combout\ & (\en~combout\ $ (\units_counter|count_sig\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \en~combout\,
	datac => \units_counter|count_sig\(0),
	datad => \load_ten~1_combout\,
	combout => \units_counter|count_sig[0]~0_combout\);

-- Location: LCFF_X42_Y35_N9
\units_counter|count_sig[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_div_1s|temp~clkctrl_outclk\,
	datain => \units_counter|count_sig[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \units_counter|count_sig\(0));

-- Location: LCCOMB_X43_Y35_N24
\ten_counter|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|Add0~1_combout\ = \ten_counter|count_sig\(3) $ (((\ten_counter|count_sig\(1) & (\ten_counter|count_sig\(2) & \ten_counter|count_sig\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \ten_counter|count_sig\(3),
	datac => \ten_counter|count_sig\(2),
	datad => \ten_counter|count_sig\(0),
	combout => \ten_counter|Add0~1_combout\);

-- Location: LCCOMB_X43_Y35_N14
\ten_counter|count_sig[3]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|count_sig[3]~9_combout\ = (((!\ten_counter|count_sig\(0)) # (!\ten_counter|count_sig\(2))) # (!\ten_counter|count_sig\(3))) # (!\ten_counter|count_sig\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \ten_counter|count_sig\(3),
	datac => \ten_counter|count_sig\(2),
	datad => \ten_counter|count_sig\(0),
	combout => \ten_counter|count_sig[3]~9_combout\);

-- Location: LCCOMB_X42_Y35_N10
\ten_counter|count_sig[3]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|count_sig[3]~10_combout\ = (!\units_counter|co~combout\ & (\ten_counter|count_sig[3]~9_combout\ & \load_ten~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \units_counter|co~combout\,
	datac => \ten_counter|count_sig[3]~9_combout\,
	datad => \load_ten~1_combout\,
	combout => \ten_counter|count_sig[3]~10_combout\);

-- Location: LCCOMB_X42_Y35_N18
\ten_counter|count_sig[3]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|count_sig[3]~12_combout\ = (\ten_counter|count_sig[3]~13_combout\ & ((\ten_counter|count_sig\(3)) # ((\ten_counter|Add0~1_combout\ & \ten_counter|count_sig[3]~10_combout\)))) # (!\ten_counter|count_sig[3]~13_combout\ & 
-- (\ten_counter|Add0~1_combout\ & ((\ten_counter|count_sig[3]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig[3]~13_combout\,
	datab => \ten_counter|Add0~1_combout\,
	datac => \ten_counter|count_sig\(3),
	datad => \ten_counter|count_sig[3]~10_combout\,
	combout => \ten_counter|count_sig[3]~12_combout\);

-- Location: LCFF_X42_Y35_N19
\ten_counter|count_sig[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_div_1s|temp~clkctrl_outclk\,
	datain => \ten_counter|count_sig[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ten_counter|count_sig\(3));

-- Location: LCCOMB_X42_Y35_N12
\units_counter|count_sig[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|count_sig[3]~3_combout\ = (\en~combout\ & (\load_ten~1_combout\ & ((!\units_counter|count_sig\(3)) # (!\units_counter|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|Equal0~0_combout\,
	datab => \en~combout\,
	datac => \units_counter|count_sig\(3),
	datad => \load_ten~1_combout\,
	combout => \units_counter|count_sig[3]~3_combout\);

-- Location: LCCOMB_X42_Y35_N4
\units_counter|count_sig[2]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|count_sig[2]~4_combout\ = (\units_counter|Add0~0_combout\ & ((\units_counter|count_sig[3]~3_combout\) # ((!\units_counter|count_sig[3]~1_combout\ & \units_counter|count_sig\(2))))) # (!\units_counter|Add0~0_combout\ & 
-- (!\units_counter|count_sig[3]~1_combout\ & (\units_counter|count_sig\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|Add0~0_combout\,
	datab => \units_counter|count_sig[3]~1_combout\,
	datac => \units_counter|count_sig\(2),
	datad => \units_counter|count_sig[3]~3_combout\,
	combout => \units_counter|count_sig[2]~4_combout\);

-- Location: LCFF_X42_Y35_N5
\units_counter|count_sig[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_div_1s|temp~clkctrl_outclk\,
	datain => \units_counter|count_sig[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \units_counter|count_sig\(2));

-- Location: LCCOMB_X42_Y35_N14
\reached_68~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \reached_68~1_combout\ = (!\ten_counter|count_sig\(0) & (!\ten_counter|count_sig\(3) & (!\units_counter|count_sig\(2) & \units_counter|count_sig\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(0),
	datab => \ten_counter|count_sig\(3),
	datac => \units_counter|count_sig\(2),
	datad => \units_counter|count_sig\(3),
	combout => \reached_68~1_combout\);

-- Location: LCCOMB_X41_Y35_N24
\units_counter|count_sig[3]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|count_sig[3]~1_combout\ = (\en~combout\) # (((\reached_68~1_combout\ & \reached_68~0_combout\)) # (!\load_ten~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~combout\,
	datab => \reached_68~1_combout\,
	datac => \reached_68~0_combout\,
	datad => \load_ten~0_combout\,
	combout => \units_counter|count_sig[3]~1_combout\);

-- Location: LCCOMB_X42_Y35_N26
\units_counter|count_sig[3]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|count_sig[3]~5_combout\ = (\units_counter|count_sig[3]~1_combout\ & (\load_ten~1_combout\ & (\units_counter|Equal0~0_combout\ $ (\units_counter|count_sig\(3))))) # (!\units_counter|count_sig[3]~1_combout\ & 
-- (((\units_counter|count_sig\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|Equal0~0_combout\,
	datab => \load_ten~1_combout\,
	datac => \units_counter|count_sig\(3),
	datad => \units_counter|count_sig[3]~1_combout\,
	combout => \units_counter|count_sig[3]~5_combout\);

-- Location: LCFF_X42_Y35_N27
\units_counter|count_sig[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_div_1s|temp~clkctrl_outclk\,
	datain => \units_counter|count_sig[3]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \units_counter|count_sig\(3));

-- Location: LCCOMB_X42_Y35_N2
\units_counter|count_sig[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|count_sig[1]~2_combout\ = (\units_counter|count_sig[3]~1_combout\ & ((\units_counter|count_sig\(0) $ (\units_counter|count_sig\(1))) # (!\load_ten~1_combout\))) # (!\units_counter|count_sig[3]~1_combout\ & 
-- (((\units_counter|count_sig\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(0),
	datab => \load_ten~1_combout\,
	datac => \units_counter|count_sig\(1),
	datad => \units_counter|count_sig[3]~1_combout\,
	combout => \units_counter|count_sig[1]~2_combout\);

-- Location: LCFF_X42_Y35_N3
\units_counter|count_sig[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_div_1s|temp~clkctrl_outclk\,
	datain => \units_counter|count_sig[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \units_counter|count_sig\(1));

-- Location: LCCOMB_X42_Y35_N0
\units_counter|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|Equal0~0_combout\ = (\units_counter|count_sig\(2) & (\units_counter|count_sig\(0) & \units_counter|count_sig\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \units_counter|count_sig\(2),
	datac => \units_counter|count_sig\(0),
	datad => \units_counter|count_sig\(1),
	combout => \units_counter|Equal0~0_combout\);

-- Location: LCCOMB_X42_Y35_N22
\units_counter|co\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_counter|co~combout\ = ((!\units_counter|Equal0~0_combout\) # (!\units_counter|count_sig\(3))) # (!\en~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \en~combout\,
	datac => \units_counter|count_sig\(3),
	datad => \units_counter|Equal0~0_combout\,
	combout => \units_counter|co~combout\);

-- Location: LCCOMB_X42_Y35_N24
\ten_counter|count_sig[0]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|count_sig[0]~8_combout\ = (\ten_counter|count_sig\(0) $ (!\units_counter|co~combout\)) # (!\load_ten~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load_ten~1_combout\,
	datac => \ten_counter|count_sig\(0),
	datad => \units_counter|co~combout\,
	combout => \ten_counter|count_sig[0]~8_combout\);

-- Location: LCFF_X42_Y35_N25
\ten_counter|count_sig[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_div_1s|temp~clkctrl_outclk\,
	datain => \ten_counter|count_sig[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ten_counter|count_sig\(0));

-- Location: LCCOMB_X41_Y35_N30
\ten_counter|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|Add0~0_combout\ = \ten_counter|count_sig\(2) $ (((\ten_counter|count_sig\(1) & \ten_counter|count_sig\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ten_counter|count_sig\(1),
	datac => \ten_counter|count_sig\(0),
	datad => \ten_counter|count_sig\(2),
	combout => \ten_counter|Add0~0_combout\);

-- Location: LCCOMB_X42_Y35_N6
\ten_counter|count_sig[3]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|count_sig[3]~13_combout\ = (\load_ten~1_combout\ & (((!\units_counter|count_sig\(3)) # (!\en~combout\)) # (!\units_counter|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|Equal0~0_combout\,
	datab => \en~combout\,
	datac => \units_counter|count_sig\(3),
	datad => \load_ten~1_combout\,
	combout => \ten_counter|count_sig[3]~13_combout\);

-- Location: LCCOMB_X42_Y35_N20
\ten_counter|count_sig[2]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|count_sig[2]~11_combout\ = (\ten_counter|count_sig[3]~10_combout\ & ((\ten_counter|Add0~0_combout\) # ((\ten_counter|count_sig\(2) & \ten_counter|count_sig[3]~13_combout\)))) # (!\ten_counter|count_sig[3]~10_combout\ & 
-- (((\ten_counter|count_sig\(2) & \ten_counter|count_sig[3]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig[3]~10_combout\,
	datab => \ten_counter|Add0~0_combout\,
	datac => \ten_counter|count_sig\(2),
	datad => \ten_counter|count_sig[3]~13_combout\,
	combout => \ten_counter|count_sig[2]~11_combout\);

-- Location: LCFF_X42_Y35_N21
\ten_counter|count_sig[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_div_1s|temp~clkctrl_outclk\,
	datain => \ten_counter|count_sig[2]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ten_counter|count_sig\(2));

-- Location: LCCOMB_X42_Y35_N16
\reached_68~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \reached_68~0_combout\ = (\ten_counter|count_sig\(1) & (!\units_counter|count_sig\(0) & (\ten_counter|count_sig\(2) & !\units_counter|count_sig\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \units_counter|count_sig\(0),
	datac => \ten_counter|count_sig\(2),
	datad => \units_counter|count_sig\(1),
	combout => \reached_68~0_combout\);

-- Location: LCCOMB_X42_Y35_N28
\load_ten~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \load_ten~1_combout\ = (\load_ten~0_combout\ & ((!\reached_68~1_combout\) # (!\reached_68~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \load_ten~0_combout\,
	datac => \reached_68~0_combout\,
	datad => \reached_68~1_combout\,
	combout => \load_ten~1_combout\);

-- Location: LCCOMB_X42_Y35_N30
\ten_counter|count_sig[1]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_counter|count_sig[1]~14_combout\ = (\load_ten~1_combout\ & (\ten_counter|count_sig\(1) $ (((\ten_counter|count_sig\(0) & !\units_counter|co~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(0),
	datab => \load_ten~1_combout\,
	datac => \ten_counter|count_sig\(1),
	datad => \units_counter|co~combout\,
	combout => \ten_counter|count_sig[1]~14_combout\);

-- Location: LCFF_X42_Y35_N31
\ten_counter|count_sig[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_div_1s|temp~clkctrl_outclk\,
	datain => \ten_counter|count_sig[1]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ten_counter|count_sig\(1));

-- Location: LCCOMB_X43_Y35_N0
\ten_display|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_display|Mux6~0_combout\ = (\ten_counter|count_sig\(0) & (\ten_counter|count_sig\(1) $ (((\ten_counter|count_sig\(2)) # (!\ten_counter|count_sig\(3)))))) # (!\ten_counter|count_sig\(0) & ((\ten_counter|count_sig\(3) & (!\ten_counter|count_sig\(1) & 
-- !\ten_counter|count_sig\(2))) # (!\ten_counter|count_sig\(3) & ((\ten_counter|count_sig\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100100110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \ten_counter|count_sig\(3),
	datac => \ten_counter|count_sig\(2),
	datad => \ten_counter|count_sig\(0),
	combout => \ten_display|Mux6~0_combout\);

-- Location: LCCOMB_X40_Y35_N0
\ten_display|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_display|Mux5~0_combout\ = (\ten_counter|count_sig\(1) & ((\ten_counter|count_sig\(0) & ((\ten_counter|count_sig\(3)))) # (!\ten_counter|count_sig\(0) & (\ten_counter|count_sig\(2))))) # (!\ten_counter|count_sig\(1) & (((\ten_counter|count_sig\(3) & 
-- !\ten_counter|count_sig\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \ten_counter|count_sig\(2),
	datac => \ten_counter|count_sig\(3),
	datad => \ten_counter|count_sig\(0),
	combout => \ten_display|Mux5~0_combout\);

-- Location: LCCOMB_X40_Y35_N6
\ten_display|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_display|Mux4~0_combout\ = (\ten_counter|count_sig\(1) & ((\ten_counter|count_sig\(2) & (\ten_counter|count_sig\(3))) # (!\ten_counter|count_sig\(2) & (!\ten_counter|count_sig\(3) & !\ten_counter|count_sig\(0))))) # (!\ten_counter|count_sig\(1) & 
-- (\ten_counter|count_sig\(3) $ (((\ten_counter|count_sig\(2) & \ten_counter|count_sig\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \ten_counter|count_sig\(2),
	datac => \ten_counter|count_sig\(3),
	datad => \ten_counter|count_sig\(0),
	combout => \ten_display|Mux4~0_combout\);

-- Location: LCCOMB_X43_Y35_N26
\ten_display|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_display|Mux3~0_combout\ = (\ten_counter|count_sig\(0) & (\ten_counter|count_sig\(1) $ (((!\ten_counter|count_sig\(2)))))) # (!\ten_counter|count_sig\(0) & ((\ten_counter|count_sig\(3) & ((!\ten_counter|count_sig\(2)))) # (!\ten_counter|count_sig\(3) 
-- & (!\ten_counter|count_sig\(1) & \ten_counter|count_sig\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \ten_counter|count_sig\(3),
	datac => \ten_counter|count_sig\(2),
	datad => \ten_counter|count_sig\(0),
	combout => \ten_display|Mux3~0_combout\);

-- Location: LCCOMB_X40_Y35_N16
\ten_display|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_display|Mux2~0_combout\ = (\ten_counter|count_sig\(1) & (((!\ten_counter|count_sig\(3) & \ten_counter|count_sig\(0))))) # (!\ten_counter|count_sig\(1) & (\ten_counter|count_sig\(2) $ (((\ten_counter|count_sig\(3)) # (\ten_counter|count_sig\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \ten_counter|count_sig\(2),
	datac => \ten_counter|count_sig\(3),
	datad => \ten_counter|count_sig\(0),
	combout => \ten_display|Mux2~0_combout\);

-- Location: LCCOMB_X40_Y35_N10
\ten_display|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_display|Mux1~0_combout\ = (\ten_counter|count_sig\(2) & (\ten_counter|count_sig\(0) & (\ten_counter|count_sig\(1) $ (\ten_counter|count_sig\(3))))) # (!\ten_counter|count_sig\(2) & (\ten_counter|count_sig\(3) $ (((\ten_counter|count_sig\(1)) # 
-- (\ten_counter|count_sig\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(1),
	datab => \ten_counter|count_sig\(2),
	datac => \ten_counter|count_sig\(3),
	datad => \ten_counter|count_sig\(0),
	combout => \ten_display|Mux1~0_combout\);

-- Location: LCCOMB_X41_Y35_N28
\ten_display|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ten_display|Mux0~0_combout\ = (\ten_counter|count_sig\(3) & ((\ten_counter|count_sig\(1)) # ((\ten_counter|count_sig\(0))))) # (!\ten_counter|count_sig\(3) & ((\ten_counter|count_sig\(1) & ((!\ten_counter|count_sig\(2)) # (!\ten_counter|count_sig\(0)))) 
-- # (!\ten_counter|count_sig\(1) & ((\ten_counter|count_sig\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ten_counter|count_sig\(3),
	datab => \ten_counter|count_sig\(1),
	datac => \ten_counter|count_sig\(0),
	datad => \ten_counter|count_sig\(2),
	combout => \ten_display|Mux0~0_combout\);

-- Location: LCCOMB_X47_Y35_N0
\units_display|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux6~0_combout\ = (\units_counter|count_sig\(0) & (\units_counter|count_sig\(1) $ (((\units_counter|count_sig\(2)) # (!\units_counter|count_sig\(3)))))) # (!\units_counter|count_sig\(0) & ((\units_counter|count_sig\(3) & 
-- (!\units_counter|count_sig\(2) & !\units_counter|count_sig\(1))) # (!\units_counter|count_sig\(3) & (\units_counter|count_sig\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010011010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(3),
	datab => \units_counter|count_sig\(2),
	datac => \units_counter|count_sig\(0),
	datad => \units_counter|count_sig\(1),
	combout => \units_display|Mux6~0_combout\);

-- Location: LCCOMB_X47_Y35_N26
\units_display|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux5~0_combout\ = (\units_counter|count_sig\(0) & (\units_counter|count_sig\(3) & ((\units_counter|count_sig\(1))))) # (!\units_counter|count_sig\(0) & ((\units_counter|count_sig\(1) & ((\units_counter|count_sig\(2)))) # 
-- (!\units_counter|count_sig\(1) & (\units_counter|count_sig\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(3),
	datab => \units_counter|count_sig\(2),
	datac => \units_counter|count_sig\(0),
	datad => \units_counter|count_sig\(1),
	combout => \units_display|Mux5~0_combout\);

-- Location: LCCOMB_X43_Y35_N12
\units_display|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux4~0_combout\ = (\units_counter|count_sig\(1) & ((\units_counter|count_sig\(3) & ((\units_counter|count_sig\(2)))) # (!\units_counter|count_sig\(3) & (!\units_counter|count_sig\(0) & !\units_counter|count_sig\(2))))) # 
-- (!\units_counter|count_sig\(1) & (\units_counter|count_sig\(3) $ (((\units_counter|count_sig\(0) & \units_counter|count_sig\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101000100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(3),
	datab => \units_counter|count_sig\(1),
	datac => \units_counter|count_sig\(0),
	datad => \units_counter|count_sig\(2),
	combout => \units_display|Mux4~0_combout\);

-- Location: LCCOMB_X47_Y35_N16
\units_display|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux3~0_combout\ = (\units_counter|count_sig\(0) & ((\units_counter|count_sig\(2) $ (!\units_counter|count_sig\(1))))) # (!\units_counter|count_sig\(0) & ((\units_counter|count_sig\(3) & (!\units_counter|count_sig\(2))) # 
-- (!\units_counter|count_sig\(3) & (\units_counter|count_sig\(2) & !\units_counter|count_sig\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(3),
	datab => \units_counter|count_sig\(2),
	datac => \units_counter|count_sig\(0),
	datad => \units_counter|count_sig\(1),
	combout => \units_display|Mux3~0_combout\);

-- Location: LCCOMB_X46_Y35_N0
\units_display|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux2~0_combout\ = (\units_counter|count_sig\(1) & (\units_counter|count_sig\(0) & (!\units_counter|count_sig\(3)))) # (!\units_counter|count_sig\(1) & (\units_counter|count_sig\(2) $ (((\units_counter|count_sig\(0)) # 
-- (\units_counter|count_sig\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100100111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(0),
	datab => \units_counter|count_sig\(1),
	datac => \units_counter|count_sig\(3),
	datad => \units_counter|count_sig\(2),
	combout => \units_display|Mux2~0_combout\);

-- Location: LCCOMB_X47_Y35_N2
\units_display|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux1~0_combout\ = (\units_counter|count_sig\(2) & (\units_counter|count_sig\(0) & (\units_counter|count_sig\(3) $ (\units_counter|count_sig\(1))))) # (!\units_counter|count_sig\(2) & (\units_counter|count_sig\(3) $ 
-- (((\units_counter|count_sig\(0)) # (\units_counter|count_sig\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000110010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(3),
	datab => \units_counter|count_sig\(2),
	datac => \units_counter|count_sig\(0),
	datad => \units_counter|count_sig\(1),
	combout => \units_display|Mux1~0_combout\);

-- Location: LCCOMB_X47_Y35_N12
\units_display|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux0~0_combout\ = (\units_counter|count_sig\(3) & (((\units_counter|count_sig\(0)) # (\units_counter|count_sig\(1))))) # (!\units_counter|count_sig\(3) & ((\units_counter|count_sig\(2) & ((!\units_counter|count_sig\(1)) # 
-- (!\units_counter|count_sig\(0)))) # (!\units_counter|count_sig\(2) & ((\units_counter|count_sig\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \units_counter|count_sig\(3),
	datab => \units_counter|count_sig\(2),
	datac => \units_counter|count_sig\(0),
	datad => \units_counter|count_sig\(1),
	combout => \units_display|Mux0~0_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk_50m~I\ : cycloneii_io
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
	padio => ww_clk_50m,
	combout => \clk_50m~combout\);

-- Location: CLKCTRL_G3
\clk_50m~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50m~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50m~clkctrl_outclk\);

-- Location: LCCOMB_X31_Y35_N0
\clk_div_1s|P_div:count[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_div_1s|P_div:count[0]~0_combout\ = !\clk_div_1s|P_div:count[0]~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div_1s|P_div:count[0]~regout\,
	combout => \clk_div_1s|P_div:count[0]~0_combout\);

-- Location: LCFF_X31_Y35_N1
\clk_div_1s|P_div:count[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50m~clkctrl_outclk\,
	datain => \clk_div_1s|P_div:count[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \clk_div_1s|P_div:count[0]~regout\);

-- Location: LCCOMB_X31_Y35_N18
\clk_div_1s|temp~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_div_1s|temp~0_combout\ = \clk_div_1s|temp~regout\ $ (\clk_div_1s|P_div:count[0]~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clk_div_1s|temp~regout\,
	datad => \clk_div_1s|P_div:count[0]~regout\,
	combout => \clk_div_1s|temp~0_combout\);

-- Location: LCFF_X31_Y35_N19
\clk_div_1s|temp\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_50m~clkctrl_outclk\,
	datain => \clk_div_1s|temp~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \clk_div_1s|temp~regout\);

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_ten[0]~I\ : cycloneii_io
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
	datain => \ten_display|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_ten(0));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_ten[1]~I\ : cycloneii_io
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
	datain => \ten_display|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_ten(1));

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_ten[2]~I\ : cycloneii_io
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
	datain => \ten_display|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_ten(2));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_ten[3]~I\ : cycloneii_io
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
	datain => \ten_display|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_ten(3));

-- Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_ten[4]~I\ : cycloneii_io
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
	datain => \ten_display|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_ten(4));

-- Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_ten[5]~I\ : cycloneii_io
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
	datain => \ten_display|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_ten(5));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_ten[6]~I\ : cycloneii_io
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
	datain => \ten_display|ALT_INV_Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_ten(6));

-- Location: PIN_F17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_un[0]~I\ : cycloneii_io
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
	datain => \units_display|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_un(0));

-- Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_un[1]~I\ : cycloneii_io
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
	datain => \units_display|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_un(1));

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_un[2]~I\ : cycloneii_io
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
	datain => \units_display|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_un(2));

-- Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_un[3]~I\ : cycloneii_io
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
	datain => \units_display|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_un(3));

-- Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_un[4]~I\ : cycloneii_io
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
	datain => \units_display|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_un(4));

-- Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_un[5]~I\ : cycloneii_io
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
	datain => \units_display|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_un(5));

-- Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_un[6]~I\ : cycloneii_io
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
	datain => \units_display|ALT_INV_Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_un(6));

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\clk_divided_out~I\ : cycloneii_io
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
	datain => \clk_div_1s|temp~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_clk_divided_out);

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\carry_units_out~I\ : cycloneii_io
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
	datain => \units_counter|ALT_INV_co~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_carry_units_out);

-- Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\load_ten_out~I\ : cycloneii_io
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
	datain => \ALT_INV_load_ten~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_load_ten_out);

-- Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\load_units_out~I\ : cycloneii_io
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
	datain => \ALT_INV_load_ten~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_load_units_out);

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\tens_out[0]~I\ : cycloneii_io
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
	datain => \ten_counter|count_sig\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_tens_out(0));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\tens_out[1]~I\ : cycloneii_io
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
	datain => \ten_counter|count_sig\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_tens_out(1));

-- Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\tens_out[2]~I\ : cycloneii_io
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
	datain => \ten_counter|count_sig\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_tens_out(2));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\tens_out[3]~I\ : cycloneii_io
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
	datain => \ten_counter|count_sig\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_tens_out(3));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\uns_out[0]~I\ : cycloneii_io
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
	datain => \units_counter|count_sig\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_uns_out(0));

-- Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\uns_out[1]~I\ : cycloneii_io
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
	datain => \units_counter|count_sig\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_uns_out(1));

-- Location: PIN_J17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\uns_out[2]~I\ : cycloneii_io
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
	datain => \units_counter|count_sig\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_uns_out(2));

-- Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\uns_out[3]~I\ : cycloneii_io
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
	datain => \units_counter|count_sig\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_uns_out(3));
END structure;



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

-- DATE "09/17/2025 11:46:58"

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

ENTITY 	Lab3 IS
    PORT (
	CLK : IN std_logic;
	button_1 : IN std_logic;
	button_2 : IN std_logic;
	disp_tens : OUT std_logic_vector(6 DOWNTO 0);
	disp_units : OUT std_logic_vector(6 DOWNTO 0);
	disp_hundreth_tens : OUT std_logic_vector(6 DOWNTO 0);
	disp_hundreth_units : OUT std_logic_vector(6 DOWNTO 0)
	);
END Lab3;

-- Design Ports Information
-- disp_tens[0]	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_tens[1]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_tens[2]	=>  Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_tens[3]	=>  Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_tens[4]	=>  Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_tens[5]	=>  Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_tens[6]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_units[0]	=>  Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_units[1]	=>  Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_units[2]	=>  Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_units[3]	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_units[4]	=>  Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_units[5]	=>  Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_units[6]	=>  Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_tens[0]	=>  Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_tens[1]	=>  Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_tens[2]	=>  Location: PIN_P7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_tens[3]	=>  Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_tens[4]	=>  Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_tens[5]	=>  Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_tens[6]	=>  Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_units[0]	=>  Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_units[1]	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_units[2]	=>  Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_units[3]	=>  Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_units[4]	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_units[5]	=>  Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- disp_hundreth_units[6]	=>  Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- button_1	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- button_2	=>  Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Lab3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_button_1 : std_logic;
SIGNAL ww_button_2 : std_logic;
SIGNAL ww_disp_tens : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_disp_units : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_disp_hundreth_tens : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_disp_hundreth_units : std_logic_vector(6 DOWNTO 0);
SIGNAL \CLK~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_millisec_counter[0]~26_combout\ : std_logic;
SIGNAL \clk_millisec_counter[2]~30_combout\ : std_logic;
SIGNAL \clk_millisec_counter[3]~32_combout\ : std_logic;
SIGNAL \clk_millisec_counter[5]~36_combout\ : std_logic;
SIGNAL \clk_millisec_counter[9]~44_combout\ : std_logic;
SIGNAL \clk_millisec_counter[16]~58_combout\ : std_logic;
SIGNAL \clk_millisec_counter[24]~75\ : std_logic;
SIGNAL \clk_millisec_counter[25]~76_combout\ : std_logic;
SIGNAL \clk_button_1_counter[0]~26_combout\ : std_logic;
SIGNAL \clk_button_1_counter[2]~30_combout\ : std_logic;
SIGNAL \clk_button_1_counter[3]~32_combout\ : std_logic;
SIGNAL \clk_button_1_counter[5]~36_combout\ : std_logic;
SIGNAL \clk_button_1_counter[9]~44_combout\ : std_logic;
SIGNAL \clk_button_1_counter[16]~58_combout\ : std_logic;
SIGNAL \clk_button_1_counter[19]~64_combout\ : std_logic;
SIGNAL \clk_button_1_counter[24]~75\ : std_logic;
SIGNAL \clk_button_1_counter[25]~76_combout\ : std_logic;
SIGNAL \clk_button_2_counter[2]~31_combout\ : std_logic;
SIGNAL \clk_button_2_counter[5]~37_combout\ : std_logic;
SIGNAL \clk_button_2_counter[9]~45_combout\ : std_logic;
SIGNAL \clk_button_2_counter[16]~59_combout\ : std_logic;
SIGNAL \clk_button_2_counter[23]~73_combout\ : std_logic;
SIGNAL \clk_button_2_counter[24]~76\ : std_logic;
SIGNAL \clk_button_2_counter[25]~77_combout\ : std_logic;
SIGNAL \U_SEC_TENS|CONT[3]~6_combout\ : std_logic;
SIGNAL \U_SEC_TENS|Add0~0_combout\ : std_logic;
SIGNAL \U_SEC_TENS|Add0~1_combout\ : std_logic;
SIGNAL \U_SEC_UNITS|Add0~0_combout\ : std_logic;
SIGNAL \en_sig~2_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \CLK~clkctrl_outclk\ : std_logic;
SIGNAL \clk_button_2_counter[0]~27\ : std_logic;
SIGNAL \clk_button_2_counter[1]~29_combout\ : std_logic;
SIGNAL \clk_button_2_counter[13]~54\ : std_logic;
SIGNAL \clk_button_2_counter[14]~55_combout\ : std_logic;
SIGNAL \clk_button_2_counter[14]~56\ : std_logic;
SIGNAL \clk_button_2_counter[15]~57_combout\ : std_logic;
SIGNAL \clk_button_2_counter[15]~58\ : std_logic;
SIGNAL \clk_button_2_counter[16]~60\ : std_logic;
SIGNAL \clk_button_2_counter[17]~61_combout\ : std_logic;
SIGNAL \clk_button_2_counter[17]~62\ : std_logic;
SIGNAL \clk_button_2_counter[18]~63_combout\ : std_logic;
SIGNAL \clk_button_2_counter[18]~64\ : std_logic;
SIGNAL \clk_button_2_counter[19]~66\ : std_logic;
SIGNAL \clk_button_2_counter[20]~67_combout\ : std_logic;
SIGNAL \clk_button_2_counter[20]~68\ : std_logic;
SIGNAL \clk_button_2_counter[21]~69_combout\ : std_logic;
SIGNAL \clk_button_2_counter[21]~70\ : std_logic;
SIGNAL \clk_button_2_counter[22]~71_combout\ : std_logic;
SIGNAL \Equal1~6_combout\ : std_logic;
SIGNAL \clk_button_2_counter[22]~72\ : std_logic;
SIGNAL \clk_button_2_counter[23]~74\ : std_logic;
SIGNAL \clk_button_2_counter[24]~75_combout\ : std_logic;
SIGNAL \clk_button_2_counter[19]~65_combout\ : std_logic;
SIGNAL \Equal1~5_combout\ : std_logic;
SIGNAL \Equal1~7_combout\ : std_logic;
SIGNAL \button_2~combout\ : std_logic;
SIGNAL \clk_button_2_counter[12]~28_combout\ : std_logic;
SIGNAL \clk_button_2_counter[1]~30\ : std_logic;
SIGNAL \clk_button_2_counter[2]~32\ : std_logic;
SIGNAL \clk_button_2_counter[3]~34\ : std_logic;
SIGNAL \clk_button_2_counter[4]~35_combout\ : std_logic;
SIGNAL \clk_button_2_counter[4]~36\ : std_logic;
SIGNAL \clk_button_2_counter[5]~38\ : std_logic;
SIGNAL \clk_button_2_counter[6]~39_combout\ : std_logic;
SIGNAL \clk_button_2_counter[6]~40\ : std_logic;
SIGNAL \clk_button_2_counter[7]~41_combout\ : std_logic;
SIGNAL \clk_button_2_counter[7]~42\ : std_logic;
SIGNAL \clk_button_2_counter[8]~43_combout\ : std_logic;
SIGNAL \clk_button_2_counter[8]~44\ : std_logic;
SIGNAL \clk_button_2_counter[9]~46\ : std_logic;
SIGNAL \clk_button_2_counter[10]~47_combout\ : std_logic;
SIGNAL \clk_button_2_counter[10]~48\ : std_logic;
SIGNAL \clk_button_2_counter[11]~49_combout\ : std_logic;
SIGNAL \clk_button_2_counter[11]~50\ : std_logic;
SIGNAL \clk_button_2_counter[12]~51_combout\ : std_logic;
SIGNAL \clk_button_2_counter[12]~52\ : std_logic;
SIGNAL \clk_button_2_counter[13]~53_combout\ : std_logic;
SIGNAL \Equal1~3_combout\ : std_logic;
SIGNAL \clk_button_2_counter[0]~26_combout\ : std_logic;
SIGNAL \clk_button_2_counter[3]~33_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal1~4_combout\ : std_logic;
SIGNAL \clr_sig~0_combout\ : std_logic;
SIGNAL \clr_sig~regout\ : std_logic;
SIGNAL \U_MILLISEC_TENS|CONT[0]~4_combout\ : std_logic;
SIGNAL \U_MILLISEC_TENS|CONT~5_combout\ : std_logic;
SIGNAL \U_SEC_TENS|CONT[3]~13_combout\ : std_logic;
SIGNAL \U_SEC_TENS|CONT[3]~12_combout\ : std_logic;
SIGNAL \U_SEC_TENS|CONT[2]~9_combout\ : std_logic;
SIGNAL \U_SEC_TENS|CONT[1]~11_combout\ : std_logic;
SIGNAL \U_SEC_TENS|CONT[1]~8_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \U_MILLISEC_UNITS|CONT[0]~5_combout\ : std_logic;
SIGNAL \U_MILLISEC_UNITS|CONT~6_combout\ : std_logic;
SIGNAL \clk_millisec_counter[0]~27\ : std_logic;
SIGNAL \clk_millisec_counter[1]~28_combout\ : std_logic;
SIGNAL \clk_millisec_counter[18]~63\ : std_logic;
SIGNAL \clk_millisec_counter[19]~65\ : std_logic;
SIGNAL \clk_millisec_counter[20]~66_combout\ : std_logic;
SIGNAL \clk_millisec_counter[20]~67\ : std_logic;
SIGNAL \clk_millisec_counter[21]~69\ : std_logic;
SIGNAL \clk_millisec_counter[22]~70_combout\ : std_logic;
SIGNAL \clk_millisec_counter[22]~71\ : std_logic;
SIGNAL \clk_millisec_counter[23]~73\ : std_logic;
SIGNAL \clk_millisec_counter[24]~74_combout\ : std_logic;
SIGNAL \clk_millisec_counter[23]~72_combout\ : std_logic;
SIGNAL \clk_millisec_counter[19]~64_combout\ : std_logic;
SIGNAL \clk_millisec_counter[21]~68_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \clk_millisec_counter[7]~40_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \clk_millisec_counter[1]~29\ : std_logic;
SIGNAL \clk_millisec_counter[2]~31\ : std_logic;
SIGNAL \clk_millisec_counter[3]~33\ : std_logic;
SIGNAL \clk_millisec_counter[4]~34_combout\ : std_logic;
SIGNAL \clk_millisec_counter[4]~35\ : std_logic;
SIGNAL \clk_millisec_counter[5]~37\ : std_logic;
SIGNAL \clk_millisec_counter[6]~38_combout\ : std_logic;
SIGNAL \clk_millisec_counter[6]~39\ : std_logic;
SIGNAL \clk_millisec_counter[7]~41\ : std_logic;
SIGNAL \clk_millisec_counter[8]~42_combout\ : std_logic;
SIGNAL \clk_millisec_counter[8]~43\ : std_logic;
SIGNAL \clk_millisec_counter[9]~45\ : std_logic;
SIGNAL \clk_millisec_counter[10]~46_combout\ : std_logic;
SIGNAL \clk_millisec_counter[10]~47\ : std_logic;
SIGNAL \clk_millisec_counter[11]~48_combout\ : std_logic;
SIGNAL \clk_millisec_counter[11]~49\ : std_logic;
SIGNAL \clk_millisec_counter[12]~50_combout\ : std_logic;
SIGNAL \clk_millisec_counter[12]~51\ : std_logic;
SIGNAL \clk_millisec_counter[13]~52_combout\ : std_logic;
SIGNAL \clk_millisec_counter[13]~53\ : std_logic;
SIGNAL \clk_millisec_counter[14]~54_combout\ : std_logic;
SIGNAL \clk_millisec_counter[14]~55\ : std_logic;
SIGNAL \clk_millisec_counter[15]~56_combout\ : std_logic;
SIGNAL \clk_millisec_counter[15]~57\ : std_logic;
SIGNAL \clk_millisec_counter[16]~59\ : std_logic;
SIGNAL \clk_millisec_counter[17]~60_combout\ : std_logic;
SIGNAL \clk_millisec_counter[17]~61\ : std_logic;
SIGNAL \clk_millisec_counter[18]~62_combout\ : std_logic;
SIGNAL \en_millisec_units~0_combout\ : std_logic;
SIGNAL \en_millisec_units~1_combout\ : std_logic;
SIGNAL \en_millisec_units~regout\ : std_logic;
SIGNAL \U_MILLISEC_UNITS|CONT[0]~4_combout\ : std_logic;
SIGNAL \U_MILLISEC_UNITS|CONT~8_combout\ : std_logic;
SIGNAL \U_MILLISEC_UNITS|CONT~3_combout\ : std_logic;
SIGNAL \U_MILLISEC_UNITS|Add0~0_combout\ : std_logic;
SIGNAL \U_MILLISEC_UNITS|CONT~7_combout\ : std_logic;
SIGNAL \U_MILLISEC_UNITS|CONT[0]~2_combout\ : std_logic;
SIGNAL \button_1~combout\ : std_logic;
SIGNAL \clk_button_1_counter[0]~27\ : std_logic;
SIGNAL \clk_button_1_counter[1]~28_combout\ : std_logic;
SIGNAL \clk_button_1_counter[1]~29\ : std_logic;
SIGNAL \clk_button_1_counter[2]~31\ : std_logic;
SIGNAL \clk_button_1_counter[3]~33\ : std_logic;
SIGNAL \clk_button_1_counter[4]~34_combout\ : std_logic;
SIGNAL \clk_button_1_counter[4]~35\ : std_logic;
SIGNAL \clk_button_1_counter[5]~37\ : std_logic;
SIGNAL \clk_button_1_counter[6]~38_combout\ : std_logic;
SIGNAL \clk_button_1_counter[6]~39\ : std_logic;
SIGNAL \clk_button_1_counter[7]~41\ : std_logic;
SIGNAL \clk_button_1_counter[8]~42_combout\ : std_logic;
SIGNAL \clk_button_1_counter[8]~43\ : std_logic;
SIGNAL \clk_button_1_counter[9]~45\ : std_logic;
SIGNAL \clk_button_1_counter[10]~46_combout\ : std_logic;
SIGNAL \clk_button_1_counter[10]~47\ : std_logic;
SIGNAL \clk_button_1_counter[11]~48_combout\ : std_logic;
SIGNAL \clk_button_1_counter[11]~49\ : std_logic;
SIGNAL \clk_button_1_counter[12]~50_combout\ : std_logic;
SIGNAL \clk_button_1_counter[12]~51\ : std_logic;
SIGNAL \clk_button_1_counter[13]~52_combout\ : std_logic;
SIGNAL \clk_button_1_counter[13]~53\ : std_logic;
SIGNAL \clk_button_1_counter[14]~54_combout\ : std_logic;
SIGNAL \clk_button_1_counter[14]~55\ : std_logic;
SIGNAL \clk_button_1_counter[15]~56_combout\ : std_logic;
SIGNAL \clk_button_1_counter[15]~57\ : std_logic;
SIGNAL \clk_button_1_counter[16]~59\ : std_logic;
SIGNAL \clk_button_1_counter[17]~60_combout\ : std_logic;
SIGNAL \clk_button_1_counter[17]~61\ : std_logic;
SIGNAL \clk_button_1_counter[18]~63\ : std_logic;
SIGNAL \clk_button_1_counter[19]~65\ : std_logic;
SIGNAL \clk_button_1_counter[20]~66_combout\ : std_logic;
SIGNAL \clk_button_1_counter[20]~67\ : std_logic;
SIGNAL \clk_button_1_counter[21]~68_combout\ : std_logic;
SIGNAL \clk_button_1_counter[21]~69\ : std_logic;
SIGNAL \clk_button_1_counter[22]~70_combout\ : std_logic;
SIGNAL \clk_button_1_counter[22]~71\ : std_logic;
SIGNAL \clk_button_1_counter[23]~73\ : std_logic;
SIGNAL \clk_button_1_counter[24]~74_combout\ : std_logic;
SIGNAL \clk_button_1_counter[23]~72_combout\ : std_logic;
SIGNAL \en_sig~0_combout\ : std_logic;
SIGNAL \en_sig~1_combout\ : std_logic;
SIGNAL \clk_button_1_counter[18]~62_combout\ : std_logic;
SIGNAL \en_sig~3_combout\ : std_logic;
SIGNAL \clk_button_1_counter[7]~40_combout\ : std_logic;
SIGNAL \en_sig~4_combout\ : std_logic;
SIGNAL \en_sig~5_combout\ : std_logic;
SIGNAL \en_sig~6_combout\ : std_logic;
SIGNAL \en_sig~7_combout\ : std_logic;
SIGNAL \en_sig~regout\ : std_logic;
SIGNAL \en_sec_units~0_combout\ : std_logic;
SIGNAL \U_MILLISEC_TENS|CONT[0]~3_combout\ : std_logic;
SIGNAL \U_MILLISEC_TENS|CONT~7_combout\ : std_logic;
SIGNAL \U_MILLISEC_TENS|CONT~2_combout\ : std_logic;
SIGNAL \en_sec_units~1_combout\ : std_logic;
SIGNAL \en_sec_tens~1_combout\ : std_logic;
SIGNAL \internal_clear~combout\ : std_logic;
SIGNAL \U_SEC_TENS|CONT[0]~7_combout\ : std_logic;
SIGNAL \U_SEC_TENS|CONT[3]~10_combout\ : std_logic;
SIGNAL \tens_display|Mux6~0_combout\ : std_logic;
SIGNAL \tens_display|Mux5~0_combout\ : std_logic;
SIGNAL \tens_display|Mux4~0_combout\ : std_logic;
SIGNAL \tens_display|Mux3~0_combout\ : std_logic;
SIGNAL \tens_display|Mux2~0_combout\ : std_logic;
SIGNAL \tens_display|Mux1~0_combout\ : std_logic;
SIGNAL \tens_display|Mux0~0_combout\ : std_logic;
SIGNAL \U_SEC_UNITS|CONT[0]~4_combout\ : std_logic;
SIGNAL \U_SEC_UNITS|CONT~5_combout\ : std_logic;
SIGNAL \U_SEC_UNITS|CONT[0]~3_combout\ : std_logic;
SIGNAL \U_SEC_UNITS|CONT~7_combout\ : std_logic;
SIGNAL \U_SEC_UNITS|CONT~6_combout\ : std_logic;
SIGNAL \en_sec_tens~0_combout\ : std_logic;
SIGNAL \U_SEC_UNITS|CONT~2_combout\ : std_logic;
SIGNAL \units_display|Mux6~0_combout\ : std_logic;
SIGNAL \units_display|Mux5~0_combout\ : std_logic;
SIGNAL \units_display|Mux4~0_combout\ : std_logic;
SIGNAL \units_display|Mux3~0_combout\ : std_logic;
SIGNAL \units_display|Mux2~0_combout\ : std_logic;
SIGNAL \units_display|Mux1~0_combout\ : std_logic;
SIGNAL \units_display|Mux0~0_combout\ : std_logic;
SIGNAL \U_MILLISEC_TENS|Add0~0_combout\ : std_logic;
SIGNAL \U_MILLISEC_TENS|CONT~6_combout\ : std_logic;
SIGNAL \hundreth_tens_display|Mux6~0_combout\ : std_logic;
SIGNAL \hundreth_tens_display|Mux5~0_combout\ : std_logic;
SIGNAL \hundreth_tens_display|Mux4~0_combout\ : std_logic;
SIGNAL \hundreth_tens_display|Mux3~0_combout\ : std_logic;
SIGNAL \hundreth_tens_display|Mux2~0_combout\ : std_logic;
SIGNAL \hundreth_tens_display|Mux1~0_combout\ : std_logic;
SIGNAL \hundreth_tens_display|Mux0~0_combout\ : std_logic;
SIGNAL \hundreth_units_display|Mux6~0_combout\ : std_logic;
SIGNAL \hundreth_units_display|Mux5~0_combout\ : std_logic;
SIGNAL \hundreth_units_display|Mux4~0_combout\ : std_logic;
SIGNAL \hundreth_units_display|Mux3~0_combout\ : std_logic;
SIGNAL \hundreth_units_display|Mux2~0_combout\ : std_logic;
SIGNAL \hundreth_units_display|Mux1~0_combout\ : std_logic;
SIGNAL \hundreth_units_display|Mux0~0_combout\ : std_logic;
SIGNAL clk_millisec_counter : std_logic_vector(25 DOWNTO 0);
SIGNAL clk_button_2_counter : std_logic_vector(25 DOWNTO 0);
SIGNAL clk_button_1_counter : std_logic_vector(25 DOWNTO 0);
SIGNAL \U_MILLISEC_UNITS|CONT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U_MILLISEC_TENS|CONT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U_SEC_TENS|CONT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \U_SEC_UNITS|CONT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \hundreth_units_display|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \hundreth_tens_display|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \units_display|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \tens_display|ALT_INV_Mux0~0_combout\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_button_1 <= button_1;
ww_button_2 <= button_2;
disp_tens <= ww_disp_tens;
disp_units <= ww_disp_units;
disp_hundreth_tens <= ww_disp_hundreth_tens;
disp_hundreth_units <= ww_disp_hundreth_units;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK~combout\);
\hundreth_units_display|ALT_INV_Mux0~0_combout\ <= NOT \hundreth_units_display|Mux0~0_combout\;
\hundreth_tens_display|ALT_INV_Mux0~0_combout\ <= NOT \hundreth_tens_display|Mux0~0_combout\;
\units_display|ALT_INV_Mux0~0_combout\ <= NOT \units_display|Mux0~0_combout\;
\tens_display|ALT_INV_Mux0~0_combout\ <= NOT \tens_display|Mux0~0_combout\;

-- Location: LCFF_X34_Y12_N25
\clk_millisec_counter[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[25]~76_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(25));

-- Location: LCFF_X34_Y12_N7
\clk_millisec_counter[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[16]~58_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(16));

-- Location: LCFF_X34_Y13_N17
\clk_millisec_counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[5]~36_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(5));

-- Location: LCFF_X34_Y13_N25
\clk_millisec_counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[9]~44_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(9));

-- Location: LCFF_X36_Y12_N25
\clk_button_1_counter[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[25]~76_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(25));

-- Location: LCFF_X36_Y12_N7
\clk_button_1_counter[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[16]~58_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(16));

-- Location: LCFF_X36_Y12_N13
\clk_button_1_counter[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[19]~64_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(19));

-- Location: LCFF_X36_Y13_N25
\clk_button_1_counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[9]~44_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(9));

-- Location: LCFF_X28_Y14_N11
\clk_button_2_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[2]~31_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(2));

-- Location: LCFF_X28_Y14_N17
\clk_button_2_counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[5]~37_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(5));

-- Location: LCFF_X28_Y14_N25
\clk_button_2_counter[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[9]~45_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(9));

-- Location: LCFF_X28_Y13_N7
\clk_button_2_counter[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[16]~59_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(16));

-- Location: LCFF_X28_Y13_N21
\clk_button_2_counter[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[23]~73_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(23));

-- Location: LCFF_X28_Y13_N25
\clk_button_2_counter[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[25]~77_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(25));

-- Location: LCFF_X34_Y13_N13
\clk_millisec_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[3]~32_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(3));

-- Location: LCFF_X34_Y13_N11
\clk_millisec_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[2]~30_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(2));

-- Location: LCFF_X34_Y13_N7
\clk_millisec_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[0]~26_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(0));

-- Location: LCCOMB_X34_Y13_N6
\clk_millisec_counter[0]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[0]~26_combout\ = clk_millisec_counter(0) $ (VCC)
-- \clk_millisec_counter[0]~27\ = CARRY(clk_millisec_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(0),
	datad => VCC,
	combout => \clk_millisec_counter[0]~26_combout\,
	cout => \clk_millisec_counter[0]~27\);

-- Location: LCCOMB_X34_Y13_N10
\clk_millisec_counter[2]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[2]~30_combout\ = (clk_millisec_counter(2) & (\clk_millisec_counter[1]~29\ $ (GND))) # (!clk_millisec_counter(2) & (!\clk_millisec_counter[1]~29\ & VCC))
-- \clk_millisec_counter[2]~31\ = CARRY((clk_millisec_counter(2) & !\clk_millisec_counter[1]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(2),
	datad => VCC,
	cin => \clk_millisec_counter[1]~29\,
	combout => \clk_millisec_counter[2]~30_combout\,
	cout => \clk_millisec_counter[2]~31\);

-- Location: LCCOMB_X34_Y13_N12
\clk_millisec_counter[3]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[3]~32_combout\ = (clk_millisec_counter(3) & (!\clk_millisec_counter[2]~31\)) # (!clk_millisec_counter(3) & ((\clk_millisec_counter[2]~31\) # (GND)))
-- \clk_millisec_counter[3]~33\ = CARRY((!\clk_millisec_counter[2]~31\) # (!clk_millisec_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(3),
	datad => VCC,
	cin => \clk_millisec_counter[2]~31\,
	combout => \clk_millisec_counter[3]~32_combout\,
	cout => \clk_millisec_counter[3]~33\);

-- Location: LCCOMB_X34_Y13_N16
\clk_millisec_counter[5]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[5]~36_combout\ = (clk_millisec_counter(5) & (!\clk_millisec_counter[4]~35\)) # (!clk_millisec_counter(5) & ((\clk_millisec_counter[4]~35\) # (GND)))
-- \clk_millisec_counter[5]~37\ = CARRY((!\clk_millisec_counter[4]~35\) # (!clk_millisec_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(5),
	datad => VCC,
	cin => \clk_millisec_counter[4]~35\,
	combout => \clk_millisec_counter[5]~36_combout\,
	cout => \clk_millisec_counter[5]~37\);

-- Location: LCCOMB_X34_Y13_N24
\clk_millisec_counter[9]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[9]~44_combout\ = (clk_millisec_counter(9) & (!\clk_millisec_counter[8]~43\)) # (!clk_millisec_counter(9) & ((\clk_millisec_counter[8]~43\) # (GND)))
-- \clk_millisec_counter[9]~45\ = CARRY((!\clk_millisec_counter[8]~43\) # (!clk_millisec_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(9),
	datad => VCC,
	cin => \clk_millisec_counter[8]~43\,
	combout => \clk_millisec_counter[9]~44_combout\,
	cout => \clk_millisec_counter[9]~45\);

-- Location: LCCOMB_X34_Y12_N6
\clk_millisec_counter[16]~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[16]~58_combout\ = (clk_millisec_counter(16) & (\clk_millisec_counter[15]~57\ $ (GND))) # (!clk_millisec_counter(16) & (!\clk_millisec_counter[15]~57\ & VCC))
-- \clk_millisec_counter[16]~59\ = CARRY((clk_millisec_counter(16) & !\clk_millisec_counter[15]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(16),
	datad => VCC,
	cin => \clk_millisec_counter[15]~57\,
	combout => \clk_millisec_counter[16]~58_combout\,
	cout => \clk_millisec_counter[16]~59\);

-- Location: LCCOMB_X34_Y12_N22
\clk_millisec_counter[24]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[24]~74_combout\ = (clk_millisec_counter(24) & (\clk_millisec_counter[23]~73\ $ (GND))) # (!clk_millisec_counter(24) & (!\clk_millisec_counter[23]~73\ & VCC))
-- \clk_millisec_counter[24]~75\ = CARRY((clk_millisec_counter(24) & !\clk_millisec_counter[23]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(24),
	datad => VCC,
	cin => \clk_millisec_counter[23]~73\,
	combout => \clk_millisec_counter[24]~74_combout\,
	cout => \clk_millisec_counter[24]~75\);

-- Location: LCCOMB_X34_Y12_N24
\clk_millisec_counter[25]~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[25]~76_combout\ = clk_millisec_counter(25) $ (\clk_millisec_counter[24]~75\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(25),
	cin => \clk_millisec_counter[24]~75\,
	combout => \clk_millisec_counter[25]~76_combout\);

-- Location: LCFF_X36_Y13_N17
\clk_button_1_counter[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[5]~36_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(5));

-- Location: LCFF_X36_Y13_N13
\clk_button_1_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[3]~32_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(3));

-- Location: LCFF_X36_Y13_N11
\clk_button_1_counter[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[2]~30_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(2));

-- Location: LCFF_X36_Y13_N7
\clk_button_1_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[0]~26_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(0));

-- Location: LCCOMB_X36_Y13_N6
\clk_button_1_counter[0]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[0]~26_combout\ = clk_button_1_counter(0) $ (VCC)
-- \clk_button_1_counter[0]~27\ = CARRY(clk_button_1_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(0),
	datad => VCC,
	combout => \clk_button_1_counter[0]~26_combout\,
	cout => \clk_button_1_counter[0]~27\);

-- Location: LCCOMB_X36_Y13_N10
\clk_button_1_counter[2]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[2]~30_combout\ = (clk_button_1_counter(2) & (\clk_button_1_counter[1]~29\ $ (GND))) # (!clk_button_1_counter(2) & (!\clk_button_1_counter[1]~29\ & VCC))
-- \clk_button_1_counter[2]~31\ = CARRY((clk_button_1_counter(2) & !\clk_button_1_counter[1]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(2),
	datad => VCC,
	cin => \clk_button_1_counter[1]~29\,
	combout => \clk_button_1_counter[2]~30_combout\,
	cout => \clk_button_1_counter[2]~31\);

-- Location: LCCOMB_X36_Y13_N12
\clk_button_1_counter[3]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[3]~32_combout\ = (clk_button_1_counter(3) & (!\clk_button_1_counter[2]~31\)) # (!clk_button_1_counter(3) & ((\clk_button_1_counter[2]~31\) # (GND)))
-- \clk_button_1_counter[3]~33\ = CARRY((!\clk_button_1_counter[2]~31\) # (!clk_button_1_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(3),
	datad => VCC,
	cin => \clk_button_1_counter[2]~31\,
	combout => \clk_button_1_counter[3]~32_combout\,
	cout => \clk_button_1_counter[3]~33\);

-- Location: LCCOMB_X36_Y13_N16
\clk_button_1_counter[5]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[5]~36_combout\ = (clk_button_1_counter(5) & (!\clk_button_1_counter[4]~35\)) # (!clk_button_1_counter(5) & ((\clk_button_1_counter[4]~35\) # (GND)))
-- \clk_button_1_counter[5]~37\ = CARRY((!\clk_button_1_counter[4]~35\) # (!clk_button_1_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(5),
	datad => VCC,
	cin => \clk_button_1_counter[4]~35\,
	combout => \clk_button_1_counter[5]~36_combout\,
	cout => \clk_button_1_counter[5]~37\);

-- Location: LCCOMB_X36_Y13_N24
\clk_button_1_counter[9]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[9]~44_combout\ = (clk_button_1_counter(9) & (!\clk_button_1_counter[8]~43\)) # (!clk_button_1_counter(9) & ((\clk_button_1_counter[8]~43\) # (GND)))
-- \clk_button_1_counter[9]~45\ = CARRY((!\clk_button_1_counter[8]~43\) # (!clk_button_1_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(9),
	datad => VCC,
	cin => \clk_button_1_counter[8]~43\,
	combout => \clk_button_1_counter[9]~44_combout\,
	cout => \clk_button_1_counter[9]~45\);

-- Location: LCCOMB_X36_Y12_N6
\clk_button_1_counter[16]~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[16]~58_combout\ = (clk_button_1_counter(16) & (\clk_button_1_counter[15]~57\ $ (GND))) # (!clk_button_1_counter(16) & (!\clk_button_1_counter[15]~57\ & VCC))
-- \clk_button_1_counter[16]~59\ = CARRY((clk_button_1_counter(16) & !\clk_button_1_counter[15]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(16),
	datad => VCC,
	cin => \clk_button_1_counter[15]~57\,
	combout => \clk_button_1_counter[16]~58_combout\,
	cout => \clk_button_1_counter[16]~59\);

-- Location: LCCOMB_X36_Y12_N12
\clk_button_1_counter[19]~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[19]~64_combout\ = (clk_button_1_counter(19) & (!\clk_button_1_counter[18]~63\)) # (!clk_button_1_counter(19) & ((\clk_button_1_counter[18]~63\) # (GND)))
-- \clk_button_1_counter[19]~65\ = CARRY((!\clk_button_1_counter[18]~63\) # (!clk_button_1_counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(19),
	datad => VCC,
	cin => \clk_button_1_counter[18]~63\,
	combout => \clk_button_1_counter[19]~64_combout\,
	cout => \clk_button_1_counter[19]~65\);

-- Location: LCCOMB_X36_Y12_N22
\clk_button_1_counter[24]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[24]~74_combout\ = (clk_button_1_counter(24) & (\clk_button_1_counter[23]~73\ $ (GND))) # (!clk_button_1_counter(24) & (!\clk_button_1_counter[23]~73\ & VCC))
-- \clk_button_1_counter[24]~75\ = CARRY((clk_button_1_counter(24) & !\clk_button_1_counter[23]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(24),
	datad => VCC,
	cin => \clk_button_1_counter[23]~73\,
	combout => \clk_button_1_counter[24]~74_combout\,
	cout => \clk_button_1_counter[24]~75\);

-- Location: LCCOMB_X36_Y12_N24
\clk_button_1_counter[25]~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[25]~76_combout\ = clk_button_1_counter(25) $ (\clk_button_1_counter[24]~75\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(25),
	cin => \clk_button_1_counter[24]~75\,
	combout => \clk_button_1_counter[25]~76_combout\);

-- Location: LCCOMB_X28_Y14_N10
\clk_button_2_counter[2]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[2]~31_combout\ = (clk_button_2_counter(2) & (\clk_button_2_counter[1]~30\ $ (GND))) # (!clk_button_2_counter(2) & (!\clk_button_2_counter[1]~30\ & VCC))
-- \clk_button_2_counter[2]~32\ = CARRY((clk_button_2_counter(2) & !\clk_button_2_counter[1]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(2),
	datad => VCC,
	cin => \clk_button_2_counter[1]~30\,
	combout => \clk_button_2_counter[2]~31_combout\,
	cout => \clk_button_2_counter[2]~32\);

-- Location: LCCOMB_X28_Y14_N16
\clk_button_2_counter[5]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[5]~37_combout\ = (clk_button_2_counter(5) & (!\clk_button_2_counter[4]~36\)) # (!clk_button_2_counter(5) & ((\clk_button_2_counter[4]~36\) # (GND)))
-- \clk_button_2_counter[5]~38\ = CARRY((!\clk_button_2_counter[4]~36\) # (!clk_button_2_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(5),
	datad => VCC,
	cin => \clk_button_2_counter[4]~36\,
	combout => \clk_button_2_counter[5]~37_combout\,
	cout => \clk_button_2_counter[5]~38\);

-- Location: LCCOMB_X28_Y14_N24
\clk_button_2_counter[9]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[9]~45_combout\ = (clk_button_2_counter(9) & (!\clk_button_2_counter[8]~44\)) # (!clk_button_2_counter(9) & ((\clk_button_2_counter[8]~44\) # (GND)))
-- \clk_button_2_counter[9]~46\ = CARRY((!\clk_button_2_counter[8]~44\) # (!clk_button_2_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(9),
	datad => VCC,
	cin => \clk_button_2_counter[8]~44\,
	combout => \clk_button_2_counter[9]~45_combout\,
	cout => \clk_button_2_counter[9]~46\);

-- Location: LCCOMB_X28_Y13_N6
\clk_button_2_counter[16]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[16]~59_combout\ = (clk_button_2_counter(16) & (\clk_button_2_counter[15]~58\ $ (GND))) # (!clk_button_2_counter(16) & (!\clk_button_2_counter[15]~58\ & VCC))
-- \clk_button_2_counter[16]~60\ = CARRY((clk_button_2_counter(16) & !\clk_button_2_counter[15]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(16),
	datad => VCC,
	cin => \clk_button_2_counter[15]~58\,
	combout => \clk_button_2_counter[16]~59_combout\,
	cout => \clk_button_2_counter[16]~60\);

-- Location: LCCOMB_X28_Y13_N20
\clk_button_2_counter[23]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[23]~73_combout\ = (clk_button_2_counter(23) & (!\clk_button_2_counter[22]~72\)) # (!clk_button_2_counter(23) & ((\clk_button_2_counter[22]~72\) # (GND)))
-- \clk_button_2_counter[23]~74\ = CARRY((!\clk_button_2_counter[22]~72\) # (!clk_button_2_counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(23),
	datad => VCC,
	cin => \clk_button_2_counter[22]~72\,
	combout => \clk_button_2_counter[23]~73_combout\,
	cout => \clk_button_2_counter[23]~74\);

-- Location: LCCOMB_X28_Y13_N22
\clk_button_2_counter[24]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[24]~75_combout\ = (clk_button_2_counter(24) & (\clk_button_2_counter[23]~74\ $ (GND))) # (!clk_button_2_counter(24) & (!\clk_button_2_counter[23]~74\ & VCC))
-- \clk_button_2_counter[24]~76\ = CARRY((clk_button_2_counter(24) & !\clk_button_2_counter[23]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(24),
	datad => VCC,
	cin => \clk_button_2_counter[23]~74\,
	combout => \clk_button_2_counter[24]~75_combout\,
	cout => \clk_button_2_counter[24]~76\);

-- Location: LCCOMB_X28_Y13_N24
\clk_button_2_counter[25]~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[25]~77_combout\ = clk_button_2_counter(25) $ (\clk_button_2_counter[24]~76\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(25),
	cin => \clk_button_2_counter[24]~76\,
	combout => \clk_button_2_counter[25]~77_combout\);

-- Location: LCCOMB_X5_Y12_N6
\U_SEC_TENS|CONT[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|CONT[3]~6_combout\ = ((\U_SEC_TENS|CONT\(2)) # ((\U_SEC_TENS|CONT\(1)) # (!\U_SEC_TENS|CONT\(0)))) # (!\U_SEC_TENS|CONT\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(3),
	datab => \U_SEC_TENS|CONT\(2),
	datac => \U_SEC_TENS|CONT\(0),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \U_SEC_TENS|CONT[3]~6_combout\);

-- Location: LCCOMB_X5_Y12_N26
\U_SEC_TENS|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|Add0~0_combout\ = \U_SEC_TENS|CONT\(2) $ (((\U_SEC_TENS|CONT\(0) & \U_SEC_TENS|CONT\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_TENS|CONT\(2),
	datac => \U_SEC_TENS|CONT\(0),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \U_SEC_TENS|Add0~0_combout\);

-- Location: LCCOMB_X5_Y12_N8
\U_SEC_TENS|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|Add0~1_combout\ = \U_SEC_TENS|CONT\(3) $ (((\U_SEC_TENS|CONT\(2) & (\U_SEC_TENS|CONT\(0) & \U_SEC_TENS|CONT\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(3),
	datab => \U_SEC_TENS|CONT\(2),
	datac => \U_SEC_TENS|CONT\(0),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \U_SEC_TENS|Add0~1_combout\);

-- Location: LCCOMB_X4_Y12_N10
\U_SEC_UNITS|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_UNITS|Add0~0_combout\ = (\U_SEC_UNITS|CONT\(1) & \U_SEC_UNITS|CONT\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(0),
	combout => \U_SEC_UNITS|Add0~0_combout\);

-- Location: LCCOMB_X36_Y12_N26
\en_sig~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sig~2_combout\ = (!clk_button_1_counter(17) & (((!clk_button_1_counter(14)) # (!clk_button_1_counter(15))) # (!clk_button_1_counter(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(16),
	datab => clk_button_1_counter(17),
	datac => clk_button_1_counter(15),
	datad => clk_button_1_counter(14),
	combout => \en_sig~2_combout\);

-- Location: LCCOMB_X28_Y14_N0
\Equal1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = ((clk_button_2_counter(8)) # ((clk_button_2_counter(11)) # (!clk_button_2_counter(10)))) # (!clk_button_2_counter(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(9),
	datab => clk_button_2_counter(8),
	datac => clk_button_2_counter(10),
	datad => clk_button_2_counter(11),
	combout => \Equal1~2_combout\);

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
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
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: CLKCTRL_G2
\CLK~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~clkctrl_outclk\);

-- Location: LCCOMB_X28_Y14_N6
\clk_button_2_counter[0]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[0]~26_combout\ = clk_button_2_counter(0) $ (VCC)
-- \clk_button_2_counter[0]~27\ = CARRY(clk_button_2_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(0),
	datad => VCC,
	combout => \clk_button_2_counter[0]~26_combout\,
	cout => \clk_button_2_counter[0]~27\);

-- Location: LCCOMB_X28_Y14_N8
\clk_button_2_counter[1]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[1]~29_combout\ = (clk_button_2_counter(1) & (!\clk_button_2_counter[0]~27\)) # (!clk_button_2_counter(1) & ((\clk_button_2_counter[0]~27\) # (GND)))
-- \clk_button_2_counter[1]~30\ = CARRY((!\clk_button_2_counter[0]~27\) # (!clk_button_2_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(1),
	datad => VCC,
	cin => \clk_button_2_counter[0]~27\,
	combout => \clk_button_2_counter[1]~29_combout\,
	cout => \clk_button_2_counter[1]~30\);

-- Location: LCCOMB_X28_Y13_N0
\clk_button_2_counter[13]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[13]~53_combout\ = (clk_button_2_counter(13) & (!\clk_button_2_counter[12]~52\)) # (!clk_button_2_counter(13) & ((\clk_button_2_counter[12]~52\) # (GND)))
-- \clk_button_2_counter[13]~54\ = CARRY((!\clk_button_2_counter[12]~52\) # (!clk_button_2_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(13),
	datad => VCC,
	cin => \clk_button_2_counter[12]~52\,
	combout => \clk_button_2_counter[13]~53_combout\,
	cout => \clk_button_2_counter[13]~54\);

-- Location: LCCOMB_X28_Y13_N2
\clk_button_2_counter[14]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[14]~55_combout\ = (clk_button_2_counter(14) & (\clk_button_2_counter[13]~54\ $ (GND))) # (!clk_button_2_counter(14) & (!\clk_button_2_counter[13]~54\ & VCC))
-- \clk_button_2_counter[14]~56\ = CARRY((clk_button_2_counter(14) & !\clk_button_2_counter[13]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(14),
	datad => VCC,
	cin => \clk_button_2_counter[13]~54\,
	combout => \clk_button_2_counter[14]~55_combout\,
	cout => \clk_button_2_counter[14]~56\);

-- Location: LCFF_X28_Y13_N3
\clk_button_2_counter[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[14]~55_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(14));

-- Location: LCCOMB_X28_Y13_N4
\clk_button_2_counter[15]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[15]~57_combout\ = (clk_button_2_counter(15) & (!\clk_button_2_counter[14]~56\)) # (!clk_button_2_counter(15) & ((\clk_button_2_counter[14]~56\) # (GND)))
-- \clk_button_2_counter[15]~58\ = CARRY((!\clk_button_2_counter[14]~56\) # (!clk_button_2_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(15),
	datad => VCC,
	cin => \clk_button_2_counter[14]~56\,
	combout => \clk_button_2_counter[15]~57_combout\,
	cout => \clk_button_2_counter[15]~58\);

-- Location: LCFF_X28_Y13_N5
\clk_button_2_counter[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[15]~57_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(15));

-- Location: LCCOMB_X28_Y13_N8
\clk_button_2_counter[17]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[17]~61_combout\ = (clk_button_2_counter(17) & (!\clk_button_2_counter[16]~60\)) # (!clk_button_2_counter(17) & ((\clk_button_2_counter[16]~60\) # (GND)))
-- \clk_button_2_counter[17]~62\ = CARRY((!\clk_button_2_counter[16]~60\) # (!clk_button_2_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(17),
	datad => VCC,
	cin => \clk_button_2_counter[16]~60\,
	combout => \clk_button_2_counter[17]~61_combout\,
	cout => \clk_button_2_counter[17]~62\);

-- Location: LCFF_X28_Y13_N9
\clk_button_2_counter[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[17]~61_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(17));

-- Location: LCCOMB_X28_Y13_N10
\clk_button_2_counter[18]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[18]~63_combout\ = (clk_button_2_counter(18) & (\clk_button_2_counter[17]~62\ $ (GND))) # (!clk_button_2_counter(18) & (!\clk_button_2_counter[17]~62\ & VCC))
-- \clk_button_2_counter[18]~64\ = CARRY((clk_button_2_counter(18) & !\clk_button_2_counter[17]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(18),
	datad => VCC,
	cin => \clk_button_2_counter[17]~62\,
	combout => \clk_button_2_counter[18]~63_combout\,
	cout => \clk_button_2_counter[18]~64\);

-- Location: LCFF_X28_Y13_N11
\clk_button_2_counter[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[18]~63_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(18));

-- Location: LCCOMB_X28_Y13_N12
\clk_button_2_counter[19]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[19]~65_combout\ = (clk_button_2_counter(19) & (!\clk_button_2_counter[18]~64\)) # (!clk_button_2_counter(19) & ((\clk_button_2_counter[18]~64\) # (GND)))
-- \clk_button_2_counter[19]~66\ = CARRY((!\clk_button_2_counter[18]~64\) # (!clk_button_2_counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(19),
	datad => VCC,
	cin => \clk_button_2_counter[18]~64\,
	combout => \clk_button_2_counter[19]~65_combout\,
	cout => \clk_button_2_counter[19]~66\);

-- Location: LCCOMB_X28_Y13_N14
\clk_button_2_counter[20]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[20]~67_combout\ = (clk_button_2_counter(20) & (\clk_button_2_counter[19]~66\ $ (GND))) # (!clk_button_2_counter(20) & (!\clk_button_2_counter[19]~66\ & VCC))
-- \clk_button_2_counter[20]~68\ = CARRY((clk_button_2_counter(20) & !\clk_button_2_counter[19]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(20),
	datad => VCC,
	cin => \clk_button_2_counter[19]~66\,
	combout => \clk_button_2_counter[20]~67_combout\,
	cout => \clk_button_2_counter[20]~68\);

-- Location: LCFF_X28_Y13_N15
\clk_button_2_counter[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[20]~67_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(20));

-- Location: LCCOMB_X28_Y13_N16
\clk_button_2_counter[21]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[21]~69_combout\ = (clk_button_2_counter(21) & (!\clk_button_2_counter[20]~68\)) # (!clk_button_2_counter(21) & ((\clk_button_2_counter[20]~68\) # (GND)))
-- \clk_button_2_counter[21]~70\ = CARRY((!\clk_button_2_counter[20]~68\) # (!clk_button_2_counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(21),
	datad => VCC,
	cin => \clk_button_2_counter[20]~68\,
	combout => \clk_button_2_counter[21]~69_combout\,
	cout => \clk_button_2_counter[21]~70\);

-- Location: LCFF_X28_Y13_N17
\clk_button_2_counter[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[21]~69_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(21));

-- Location: LCCOMB_X28_Y13_N18
\clk_button_2_counter[22]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[22]~71_combout\ = (clk_button_2_counter(22) & (\clk_button_2_counter[21]~70\ $ (GND))) # (!clk_button_2_counter(22) & (!\clk_button_2_counter[21]~70\ & VCC))
-- \clk_button_2_counter[22]~72\ = CARRY((clk_button_2_counter(22) & !\clk_button_2_counter[21]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(22),
	datad => VCC,
	cin => \clk_button_2_counter[21]~70\,
	combout => \clk_button_2_counter[22]~71_combout\,
	cout => \clk_button_2_counter[22]~72\);

-- Location: LCFF_X28_Y13_N19
\clk_button_2_counter[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[22]~71_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(22));

-- Location: LCCOMB_X28_Y13_N28
\Equal1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~6_combout\ = (clk_button_2_counter(23)) # ((clk_button_2_counter(20)) # ((clk_button_2_counter(22)) # (!clk_button_2_counter(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(23),
	datab => clk_button_2_counter(20),
	datac => clk_button_2_counter(21),
	datad => clk_button_2_counter(22),
	combout => \Equal1~6_combout\);

-- Location: LCFF_X28_Y13_N23
\clk_button_2_counter[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[24]~75_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(24));

-- Location: LCFF_X28_Y13_N13
\clk_button_2_counter[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[19]~65_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(19));

-- Location: LCCOMB_X28_Y13_N26
\Equal1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~5_combout\ = ((clk_button_2_counter(17)) # ((!clk_button_2_counter(19)) # (!clk_button_2_counter(18)))) # (!clk_button_2_counter(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(16),
	datab => clk_button_2_counter(17),
	datac => clk_button_2_counter(18),
	datad => clk_button_2_counter(19),
	combout => \Equal1~5_combout\);

-- Location: LCCOMB_X28_Y13_N30
\Equal1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~7_combout\ = (clk_button_2_counter(25)) # ((\Equal1~6_combout\) # ((clk_button_2_counter(24)) # (\Equal1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(25),
	datab => \Equal1~6_combout\,
	datac => clk_button_2_counter(24),
	datad => \Equal1~5_combout\,
	combout => \Equal1~7_combout\);

-- Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\button_2~I\ : cycloneii_io
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
	padio => ww_button_2,
	combout => \button_2~combout\);

-- Location: LCCOMB_X27_Y13_N26
\clk_button_2_counter[12]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[12]~28_combout\ = (\button_2~combout\) # ((!\Equal1~7_combout\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal1~7_combout\,
	datac => \button_2~combout\,
	datad => \Equal1~4_combout\,
	combout => \clk_button_2_counter[12]~28_combout\);

-- Location: LCFF_X28_Y14_N9
\clk_button_2_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[1]~29_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(1));

-- Location: LCCOMB_X28_Y14_N12
\clk_button_2_counter[3]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[3]~33_combout\ = (clk_button_2_counter(3) & (!\clk_button_2_counter[2]~32\)) # (!clk_button_2_counter(3) & ((\clk_button_2_counter[2]~32\) # (GND)))
-- \clk_button_2_counter[3]~34\ = CARRY((!\clk_button_2_counter[2]~32\) # (!clk_button_2_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(3),
	datad => VCC,
	cin => \clk_button_2_counter[2]~32\,
	combout => \clk_button_2_counter[3]~33_combout\,
	cout => \clk_button_2_counter[3]~34\);

-- Location: LCCOMB_X28_Y14_N14
\clk_button_2_counter[4]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[4]~35_combout\ = (clk_button_2_counter(4) & (\clk_button_2_counter[3]~34\ $ (GND))) # (!clk_button_2_counter(4) & (!\clk_button_2_counter[3]~34\ & VCC))
-- \clk_button_2_counter[4]~36\ = CARRY((clk_button_2_counter(4) & !\clk_button_2_counter[3]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(4),
	datad => VCC,
	cin => \clk_button_2_counter[3]~34\,
	combout => \clk_button_2_counter[4]~35_combout\,
	cout => \clk_button_2_counter[4]~36\);

-- Location: LCFF_X28_Y14_N15
\clk_button_2_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[4]~35_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(4));

-- Location: LCCOMB_X28_Y14_N18
\clk_button_2_counter[6]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[6]~39_combout\ = (clk_button_2_counter(6) & (\clk_button_2_counter[5]~38\ $ (GND))) # (!clk_button_2_counter(6) & (!\clk_button_2_counter[5]~38\ & VCC))
-- \clk_button_2_counter[6]~40\ = CARRY((clk_button_2_counter(6) & !\clk_button_2_counter[5]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(6),
	datad => VCC,
	cin => \clk_button_2_counter[5]~38\,
	combout => \clk_button_2_counter[6]~39_combout\,
	cout => \clk_button_2_counter[6]~40\);

-- Location: LCFF_X28_Y14_N19
\clk_button_2_counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[6]~39_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(6));

-- Location: LCCOMB_X28_Y14_N20
\clk_button_2_counter[7]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[7]~41_combout\ = (clk_button_2_counter(7) & (!\clk_button_2_counter[6]~40\)) # (!clk_button_2_counter(7) & ((\clk_button_2_counter[6]~40\) # (GND)))
-- \clk_button_2_counter[7]~42\ = CARRY((!\clk_button_2_counter[6]~40\) # (!clk_button_2_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(7),
	datad => VCC,
	cin => \clk_button_2_counter[6]~40\,
	combout => \clk_button_2_counter[7]~41_combout\,
	cout => \clk_button_2_counter[7]~42\);

-- Location: LCFF_X28_Y14_N21
\clk_button_2_counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[7]~41_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(7));

-- Location: LCCOMB_X28_Y14_N22
\clk_button_2_counter[8]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[8]~43_combout\ = (clk_button_2_counter(8) & (\clk_button_2_counter[7]~42\ $ (GND))) # (!clk_button_2_counter(8) & (!\clk_button_2_counter[7]~42\ & VCC))
-- \clk_button_2_counter[8]~44\ = CARRY((clk_button_2_counter(8) & !\clk_button_2_counter[7]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(8),
	datad => VCC,
	cin => \clk_button_2_counter[7]~42\,
	combout => \clk_button_2_counter[8]~43_combout\,
	cout => \clk_button_2_counter[8]~44\);

-- Location: LCFF_X28_Y14_N23
\clk_button_2_counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[8]~43_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(8));

-- Location: LCCOMB_X28_Y14_N26
\clk_button_2_counter[10]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[10]~47_combout\ = (clk_button_2_counter(10) & (\clk_button_2_counter[9]~46\ $ (GND))) # (!clk_button_2_counter(10) & (!\clk_button_2_counter[9]~46\ & VCC))
-- \clk_button_2_counter[10]~48\ = CARRY((clk_button_2_counter(10) & !\clk_button_2_counter[9]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(10),
	datad => VCC,
	cin => \clk_button_2_counter[9]~46\,
	combout => \clk_button_2_counter[10]~47_combout\,
	cout => \clk_button_2_counter[10]~48\);

-- Location: LCFF_X28_Y14_N27
\clk_button_2_counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[10]~47_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(10));

-- Location: LCCOMB_X28_Y14_N28
\clk_button_2_counter[11]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[11]~49_combout\ = (clk_button_2_counter(11) & (!\clk_button_2_counter[10]~48\)) # (!clk_button_2_counter(11) & ((\clk_button_2_counter[10]~48\) # (GND)))
-- \clk_button_2_counter[11]~50\ = CARRY((!\clk_button_2_counter[10]~48\) # (!clk_button_2_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(11),
	datad => VCC,
	cin => \clk_button_2_counter[10]~48\,
	combout => \clk_button_2_counter[11]~49_combout\,
	cout => \clk_button_2_counter[11]~50\);

-- Location: LCFF_X28_Y14_N29
\clk_button_2_counter[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[11]~49_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(11));

-- Location: LCCOMB_X28_Y14_N30
\clk_button_2_counter[12]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_2_counter[12]~51_combout\ = (clk_button_2_counter(12) & (\clk_button_2_counter[11]~50\ $ (GND))) # (!clk_button_2_counter(12) & (!\clk_button_2_counter[11]~50\ & VCC))
-- \clk_button_2_counter[12]~52\ = CARRY((clk_button_2_counter(12) & !\clk_button_2_counter[11]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_2_counter(12),
	datad => VCC,
	cin => \clk_button_2_counter[11]~50\,
	combout => \clk_button_2_counter[12]~51_combout\,
	cout => \clk_button_2_counter[12]~52\);

-- Location: LCFF_X28_Y14_N31
\clk_button_2_counter[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[12]~51_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(12));

-- Location: LCFF_X28_Y13_N1
\clk_button_2_counter[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[13]~53_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(13));

-- Location: LCCOMB_X27_Y13_N30
\Equal1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~3_combout\ = ((clk_button_2_counter(13)) # ((clk_button_2_counter(12)) # (!clk_button_2_counter(15)))) # (!clk_button_2_counter(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(14),
	datab => clk_button_2_counter(13),
	datac => clk_button_2_counter(12),
	datad => clk_button_2_counter(15),
	combout => \Equal1~3_combout\);

-- Location: LCFF_X28_Y14_N7
\clk_button_2_counter[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[0]~26_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(0));

-- Location: LCFF_X28_Y14_N13
\clk_button_2_counter[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_2_counter[3]~33_combout\,
	sclr => \clk_button_2_counter[12]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_2_counter(3));

-- Location: LCCOMB_X28_Y14_N4
\Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (clk_button_2_counter(2)) # ((clk_button_2_counter(1)) # ((clk_button_2_counter(0)) # (clk_button_2_counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(2),
	datab => clk_button_2_counter(1),
	datac => clk_button_2_counter(0),
	datad => clk_button_2_counter(3),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X28_Y14_N2
\Equal1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (clk_button_2_counter(5)) # ((clk_button_2_counter(4)) # ((!clk_button_2_counter(6)) # (!clk_button_2_counter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_2_counter(5),
	datab => clk_button_2_counter(4),
	datac => clk_button_2_counter(7),
	datad => clk_button_2_counter(6),
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X27_Y13_N28
\Equal1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal1~4_combout\ = (\Equal1~2_combout\) # ((\Equal1~3_combout\) # ((\Equal1~0_combout\) # (\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~2_combout\,
	datab => \Equal1~3_combout\,
	datac => \Equal1~0_combout\,
	datad => \Equal1~1_combout\,
	combout => \Equal1~4_combout\);

-- Location: LCCOMB_X27_Y13_N24
\clr_sig~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \clr_sig~0_combout\ = (!\button_2~combout\ & ((\clr_sig~regout\) # ((!\Equal1~4_combout\ & !\Equal1~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \button_2~combout\,
	datab => \Equal1~4_combout\,
	datac => \clr_sig~regout\,
	datad => \Equal1~7_combout\,
	combout => \clr_sig~0_combout\);

-- Location: LCFF_X27_Y13_N25
clr_sig : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clr_sig~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \clr_sig~regout\);

-- Location: LCCOMB_X5_Y12_N16
\U_MILLISEC_TENS|CONT[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_TENS|CONT[0]~4_combout\ = (!\Equal0~0_combout\ & (!\clr_sig~regout\ & !\en_sec_units~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datac => \clr_sig~regout\,
	datad => \en_sec_units~1_combout\,
	combout => \U_MILLISEC_TENS|CONT[0]~4_combout\);

-- Location: LCCOMB_X6_Y12_N12
\U_MILLISEC_TENS|CONT~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_TENS|CONT~5_combout\ = (\U_MILLISEC_TENS|CONT[0]~4_combout\ & (\U_MILLISEC_TENS|CONT\(0) $ (\U_MILLISEC_TENS|CONT\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(0),
	datac => \U_MILLISEC_TENS|CONT\(1),
	datad => \U_MILLISEC_TENS|CONT[0]~4_combout\,
	combout => \U_MILLISEC_TENS|CONT~5_combout\);

-- Location: LCCOMB_X5_Y12_N18
\U_SEC_TENS|CONT[3]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|CONT[3]~13_combout\ = (!\Equal0~0_combout\ & (!\clr_sig~regout\ & \en_sec_tens~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datac => \clr_sig~regout\,
	datad => \en_sec_tens~1_combout\,
	combout => \U_SEC_TENS|CONT[3]~13_combout\);

-- Location: LCCOMB_X5_Y12_N12
\U_SEC_TENS|CONT[3]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|CONT[3]~12_combout\ = (\U_SEC_TENS|CONT[3]~6_combout\ & (!\clr_sig~regout\ & (!\Equal0~0_combout\ & !\en_sec_tens~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT[3]~6_combout\,
	datab => \clr_sig~regout\,
	datac => \Equal0~0_combout\,
	datad => \en_sec_tens~1_combout\,
	combout => \U_SEC_TENS|CONT[3]~12_combout\);

-- Location: LCCOMB_X5_Y12_N0
\U_SEC_TENS|CONT[2]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|CONT[2]~9_combout\ = (\U_SEC_TENS|Add0~0_combout\ & ((\U_SEC_TENS|CONT[3]~12_combout\) # ((\U_SEC_TENS|CONT[3]~13_combout\ & \U_SEC_TENS|CONT\(2))))) # (!\U_SEC_TENS|Add0~0_combout\ & (\U_SEC_TENS|CONT[3]~13_combout\ & (\U_SEC_TENS|CONT\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|Add0~0_combout\,
	datab => \U_SEC_TENS|CONT[3]~13_combout\,
	datac => \U_SEC_TENS|CONT\(2),
	datad => \U_SEC_TENS|CONT[3]~12_combout\,
	combout => \U_SEC_TENS|CONT[2]~9_combout\);

-- Location: LCFF_X5_Y12_N1
\U_SEC_TENS|CONT[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_SEC_TENS|CONT[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_SEC_TENS|CONT\(2));

-- Location: LCCOMB_X5_Y12_N2
\U_SEC_TENS|CONT[1]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|CONT[1]~11_combout\ = (\U_SEC_TENS|CONT\(0) & (!\U_SEC_TENS|CONT\(1) & ((\U_SEC_TENS|CONT\(2)) # (!\U_SEC_TENS|CONT\(3))))) # (!\U_SEC_TENS|CONT\(0) & (((\U_SEC_TENS|CONT\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(3),
	datab => \U_SEC_TENS|CONT\(2),
	datac => \U_SEC_TENS|CONT\(0),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \U_SEC_TENS|CONT[1]~11_combout\);

-- Location: LCCOMB_X5_Y12_N22
\U_SEC_TENS|CONT[1]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|CONT[1]~8_combout\ = (!\internal_clear~combout\ & ((\en_sec_tens~1_combout\ & ((\U_SEC_TENS|CONT\(1)))) # (!\en_sec_tens~1_combout\ & (\U_SEC_TENS|CONT[1]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \internal_clear~combout\,
	datab => \U_SEC_TENS|CONT[1]~11_combout\,
	datac => \U_SEC_TENS|CONT\(1),
	datad => \en_sec_tens~1_combout\,
	combout => \U_SEC_TENS|CONT[1]~8_combout\);

-- Location: LCFF_X5_Y12_N23
\U_SEC_TENS|CONT[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_SEC_TENS|CONT[1]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_SEC_TENS|CONT\(1));

-- Location: LCCOMB_X5_Y12_N24
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\U_SEC_TENS|CONT\(3) & (\U_SEC_TENS|CONT\(2) & (!\U_SEC_TENS|CONT\(0) & \U_SEC_TENS|CONT\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(3),
	datab => \U_SEC_TENS|CONT\(2),
	datac => \U_SEC_TENS|CONT\(0),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X1_Y12_N30
\U_MILLISEC_UNITS|CONT[0]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_UNITS|CONT[0]~5_combout\ = (!\U_MILLISEC_UNITS|CONT[0]~2_combout\ & (!\Equal0~0_combout\ & !\clr_sig~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MILLISEC_UNITS|CONT[0]~2_combout\,
	datac => \Equal0~0_combout\,
	datad => \clr_sig~regout\,
	combout => \U_MILLISEC_UNITS|CONT[0]~5_combout\);

-- Location: LCCOMB_X1_Y12_N14
\U_MILLISEC_UNITS|CONT~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_UNITS|CONT~6_combout\ = (\U_MILLISEC_UNITS|CONT[0]~5_combout\ & (\U_MILLISEC_UNITS|CONT\(0) $ (\U_MILLISEC_UNITS|CONT\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datac => \U_MILLISEC_UNITS|CONT\(1),
	datad => \U_MILLISEC_UNITS|CONT[0]~5_combout\,
	combout => \U_MILLISEC_UNITS|CONT~6_combout\);

-- Location: LCCOMB_X34_Y13_N8
\clk_millisec_counter[1]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[1]~28_combout\ = (clk_millisec_counter(1) & (!\clk_millisec_counter[0]~27\)) # (!clk_millisec_counter(1) & ((\clk_millisec_counter[0]~27\) # (GND)))
-- \clk_millisec_counter[1]~29\ = CARRY((!\clk_millisec_counter[0]~27\) # (!clk_millisec_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(1),
	datad => VCC,
	cin => \clk_millisec_counter[0]~27\,
	combout => \clk_millisec_counter[1]~28_combout\,
	cout => \clk_millisec_counter[1]~29\);

-- Location: LCCOMB_X34_Y12_N10
\clk_millisec_counter[18]~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[18]~62_combout\ = (clk_millisec_counter(18) & (\clk_millisec_counter[17]~61\ $ (GND))) # (!clk_millisec_counter(18) & (!\clk_millisec_counter[17]~61\ & VCC))
-- \clk_millisec_counter[18]~63\ = CARRY((clk_millisec_counter(18) & !\clk_millisec_counter[17]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(18),
	datad => VCC,
	cin => \clk_millisec_counter[17]~61\,
	combout => \clk_millisec_counter[18]~62_combout\,
	cout => \clk_millisec_counter[18]~63\);

-- Location: LCCOMB_X34_Y12_N12
\clk_millisec_counter[19]~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[19]~64_combout\ = (clk_millisec_counter(19) & (!\clk_millisec_counter[18]~63\)) # (!clk_millisec_counter(19) & ((\clk_millisec_counter[18]~63\) # (GND)))
-- \clk_millisec_counter[19]~65\ = CARRY((!\clk_millisec_counter[18]~63\) # (!clk_millisec_counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(19),
	datad => VCC,
	cin => \clk_millisec_counter[18]~63\,
	combout => \clk_millisec_counter[19]~64_combout\,
	cout => \clk_millisec_counter[19]~65\);

-- Location: LCCOMB_X34_Y12_N14
\clk_millisec_counter[20]~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[20]~66_combout\ = (clk_millisec_counter(20) & (\clk_millisec_counter[19]~65\ $ (GND))) # (!clk_millisec_counter(20) & (!\clk_millisec_counter[19]~65\ & VCC))
-- \clk_millisec_counter[20]~67\ = CARRY((clk_millisec_counter(20) & !\clk_millisec_counter[19]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(20),
	datad => VCC,
	cin => \clk_millisec_counter[19]~65\,
	combout => \clk_millisec_counter[20]~66_combout\,
	cout => \clk_millisec_counter[20]~67\);

-- Location: LCFF_X34_Y12_N15
\clk_millisec_counter[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[20]~66_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(20));

-- Location: LCCOMB_X34_Y12_N16
\clk_millisec_counter[21]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[21]~68_combout\ = (clk_millisec_counter(21) & (!\clk_millisec_counter[20]~67\)) # (!clk_millisec_counter(21) & ((\clk_millisec_counter[20]~67\) # (GND)))
-- \clk_millisec_counter[21]~69\ = CARRY((!\clk_millisec_counter[20]~67\) # (!clk_millisec_counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(21),
	datad => VCC,
	cin => \clk_millisec_counter[20]~67\,
	combout => \clk_millisec_counter[21]~68_combout\,
	cout => \clk_millisec_counter[21]~69\);

-- Location: LCCOMB_X34_Y12_N18
\clk_millisec_counter[22]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[22]~70_combout\ = (clk_millisec_counter(22) & (\clk_millisec_counter[21]~69\ $ (GND))) # (!clk_millisec_counter(22) & (!\clk_millisec_counter[21]~69\ & VCC))
-- \clk_millisec_counter[22]~71\ = CARRY((clk_millisec_counter(22) & !\clk_millisec_counter[21]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(22),
	datad => VCC,
	cin => \clk_millisec_counter[21]~69\,
	combout => \clk_millisec_counter[22]~70_combout\,
	cout => \clk_millisec_counter[22]~71\);

-- Location: LCFF_X34_Y12_N19
\clk_millisec_counter[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[22]~70_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(22));

-- Location: LCCOMB_X34_Y12_N20
\clk_millisec_counter[23]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[23]~72_combout\ = (clk_millisec_counter(23) & (!\clk_millisec_counter[22]~71\)) # (!clk_millisec_counter(23) & ((\clk_millisec_counter[22]~71\) # (GND)))
-- \clk_millisec_counter[23]~73\ = CARRY((!\clk_millisec_counter[22]~71\) # (!clk_millisec_counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(23),
	datad => VCC,
	cin => \clk_millisec_counter[22]~71\,
	combout => \clk_millisec_counter[23]~72_combout\,
	cout => \clk_millisec_counter[23]~73\);

-- Location: LCFF_X34_Y12_N23
\clk_millisec_counter[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[24]~74_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(24));

-- Location: LCFF_X34_Y12_N21
\clk_millisec_counter[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[23]~72_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(23));

-- Location: LCFF_X34_Y12_N13
\clk_millisec_counter[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[19]~64_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(19));

-- Location: LCFF_X34_Y12_N17
\clk_millisec_counter[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[21]~68_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(21));

-- Location: LCCOMB_X35_Y12_N10
\LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!clk_millisec_counter(20) & (!clk_millisec_counter(22) & (!clk_millisec_counter(19) & !clk_millisec_counter(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(20),
	datab => clk_millisec_counter(22),
	datac => clk_millisec_counter(19),
	datad => clk_millisec_counter(21),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X35_Y12_N16
\LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!clk_millisec_counter(25) & (!clk_millisec_counter(24) & (!clk_millisec_counter(23) & \LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(25),
	datab => clk_millisec_counter(24),
	datac => clk_millisec_counter(23),
	datad => \LessThan0~0_combout\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X34_Y13_N2
\LessThan0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (!clk_millisec_counter(9) & (!clk_millisec_counter(11) & (!clk_millisec_counter(10) & !clk_millisec_counter(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(9),
	datab => clk_millisec_counter(11),
	datac => clk_millisec_counter(10),
	datad => clk_millisec_counter(12),
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X34_Y12_N30
\LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (((!clk_millisec_counter(14) & !clk_millisec_counter(13))) # (!clk_millisec_counter(15))) # (!clk_millisec_counter(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(16),
	datab => clk_millisec_counter(14),
	datac => clk_millisec_counter(15),
	datad => clk_millisec_counter(13),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X34_Y13_N20
\clk_millisec_counter[7]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[7]~40_combout\ = (clk_millisec_counter(7) & (!\clk_millisec_counter[6]~39\)) # (!clk_millisec_counter(7) & ((\clk_millisec_counter[6]~39\) # (GND)))
-- \clk_millisec_counter[7]~41\ = CARRY((!\clk_millisec_counter[6]~39\) # (!clk_millisec_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(7),
	datad => VCC,
	cin => \clk_millisec_counter[6]~39\,
	combout => \clk_millisec_counter[7]~40_combout\,
	cout => \clk_millisec_counter[7]~41\);

-- Location: LCFF_X34_Y13_N21
\clk_millisec_counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[7]~40_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(7));

-- Location: LCCOMB_X34_Y13_N4
\LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = ((!clk_millisec_counter(5) & (!clk_millisec_counter(7) & !clk_millisec_counter(6)))) # (!clk_millisec_counter(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(5),
	datab => clk_millisec_counter(8),
	datac => clk_millisec_counter(7),
	datad => clk_millisec_counter(6),
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X34_Y12_N28
\LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (\LessThan0~2_combout\) # ((!clk_millisec_counter(14) & (\LessThan0~4_combout\ & \LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(14),
	datab => \LessThan0~4_combout\,
	datac => \LessThan0~2_combout\,
	datad => \LessThan0~3_combout\,
	combout => \LessThan0~5_combout\);

-- Location: LCCOMB_X34_Y12_N26
\LessThan0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = ((clk_millisec_counter(18) & (clk_millisec_counter(17) & !\LessThan0~5_combout\))) # (!\LessThan0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(18),
	datab => clk_millisec_counter(17),
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~5_combout\,
	combout => \LessThan0~6_combout\);

-- Location: LCFF_X34_Y13_N9
\clk_millisec_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[1]~28_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(1));

-- Location: LCCOMB_X34_Y13_N14
\clk_millisec_counter[4]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[4]~34_combout\ = (clk_millisec_counter(4) & (\clk_millisec_counter[3]~33\ $ (GND))) # (!clk_millisec_counter(4) & (!\clk_millisec_counter[3]~33\ & VCC))
-- \clk_millisec_counter[4]~35\ = CARRY((clk_millisec_counter(4) & !\clk_millisec_counter[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(4),
	datad => VCC,
	cin => \clk_millisec_counter[3]~33\,
	combout => \clk_millisec_counter[4]~34_combout\,
	cout => \clk_millisec_counter[4]~35\);

-- Location: LCFF_X34_Y13_N15
\clk_millisec_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[4]~34_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(4));

-- Location: LCCOMB_X34_Y13_N18
\clk_millisec_counter[6]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[6]~38_combout\ = (clk_millisec_counter(6) & (\clk_millisec_counter[5]~37\ $ (GND))) # (!clk_millisec_counter(6) & (!\clk_millisec_counter[5]~37\ & VCC))
-- \clk_millisec_counter[6]~39\ = CARRY((clk_millisec_counter(6) & !\clk_millisec_counter[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(6),
	datad => VCC,
	cin => \clk_millisec_counter[5]~37\,
	combout => \clk_millisec_counter[6]~38_combout\,
	cout => \clk_millisec_counter[6]~39\);

-- Location: LCFF_X34_Y13_N19
\clk_millisec_counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[6]~38_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(6));

-- Location: LCCOMB_X34_Y13_N22
\clk_millisec_counter[8]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[8]~42_combout\ = (clk_millisec_counter(8) & (\clk_millisec_counter[7]~41\ $ (GND))) # (!clk_millisec_counter(8) & (!\clk_millisec_counter[7]~41\ & VCC))
-- \clk_millisec_counter[8]~43\ = CARRY((clk_millisec_counter(8) & !\clk_millisec_counter[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(8),
	datad => VCC,
	cin => \clk_millisec_counter[7]~41\,
	combout => \clk_millisec_counter[8]~42_combout\,
	cout => \clk_millisec_counter[8]~43\);

-- Location: LCFF_X34_Y13_N23
\clk_millisec_counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[8]~42_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(8));

-- Location: LCCOMB_X34_Y13_N26
\clk_millisec_counter[10]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[10]~46_combout\ = (clk_millisec_counter(10) & (\clk_millisec_counter[9]~45\ $ (GND))) # (!clk_millisec_counter(10) & (!\clk_millisec_counter[9]~45\ & VCC))
-- \clk_millisec_counter[10]~47\ = CARRY((clk_millisec_counter(10) & !\clk_millisec_counter[9]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(10),
	datad => VCC,
	cin => \clk_millisec_counter[9]~45\,
	combout => \clk_millisec_counter[10]~46_combout\,
	cout => \clk_millisec_counter[10]~47\);

-- Location: LCFF_X34_Y13_N27
\clk_millisec_counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[10]~46_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(10));

-- Location: LCCOMB_X34_Y13_N28
\clk_millisec_counter[11]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[11]~48_combout\ = (clk_millisec_counter(11) & (!\clk_millisec_counter[10]~47\)) # (!clk_millisec_counter(11) & ((\clk_millisec_counter[10]~47\) # (GND)))
-- \clk_millisec_counter[11]~49\ = CARRY((!\clk_millisec_counter[10]~47\) # (!clk_millisec_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(11),
	datad => VCC,
	cin => \clk_millisec_counter[10]~47\,
	combout => \clk_millisec_counter[11]~48_combout\,
	cout => \clk_millisec_counter[11]~49\);

-- Location: LCFF_X34_Y13_N29
\clk_millisec_counter[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[11]~48_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(11));

-- Location: LCCOMB_X34_Y13_N30
\clk_millisec_counter[12]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[12]~50_combout\ = (clk_millisec_counter(12) & (\clk_millisec_counter[11]~49\ $ (GND))) # (!clk_millisec_counter(12) & (!\clk_millisec_counter[11]~49\ & VCC))
-- \clk_millisec_counter[12]~51\ = CARRY((clk_millisec_counter(12) & !\clk_millisec_counter[11]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(12),
	datad => VCC,
	cin => \clk_millisec_counter[11]~49\,
	combout => \clk_millisec_counter[12]~50_combout\,
	cout => \clk_millisec_counter[12]~51\);

-- Location: LCFF_X34_Y13_N31
\clk_millisec_counter[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[12]~50_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(12));

-- Location: LCCOMB_X34_Y12_N0
\clk_millisec_counter[13]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[13]~52_combout\ = (clk_millisec_counter(13) & (!\clk_millisec_counter[12]~51\)) # (!clk_millisec_counter(13) & ((\clk_millisec_counter[12]~51\) # (GND)))
-- \clk_millisec_counter[13]~53\ = CARRY((!\clk_millisec_counter[12]~51\) # (!clk_millisec_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(13),
	datad => VCC,
	cin => \clk_millisec_counter[12]~51\,
	combout => \clk_millisec_counter[13]~52_combout\,
	cout => \clk_millisec_counter[13]~53\);

-- Location: LCFF_X34_Y12_N1
\clk_millisec_counter[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[13]~52_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(13));

-- Location: LCCOMB_X34_Y12_N2
\clk_millisec_counter[14]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[14]~54_combout\ = (clk_millisec_counter(14) & (\clk_millisec_counter[13]~53\ $ (GND))) # (!clk_millisec_counter(14) & (!\clk_millisec_counter[13]~53\ & VCC))
-- \clk_millisec_counter[14]~55\ = CARRY((clk_millisec_counter(14) & !\clk_millisec_counter[13]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(14),
	datad => VCC,
	cin => \clk_millisec_counter[13]~53\,
	combout => \clk_millisec_counter[14]~54_combout\,
	cout => \clk_millisec_counter[14]~55\);

-- Location: LCFF_X34_Y12_N3
\clk_millisec_counter[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[14]~54_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(14));

-- Location: LCCOMB_X34_Y12_N4
\clk_millisec_counter[15]~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[15]~56_combout\ = (clk_millisec_counter(15) & (!\clk_millisec_counter[14]~55\)) # (!clk_millisec_counter(15) & ((\clk_millisec_counter[14]~55\) # (GND)))
-- \clk_millisec_counter[15]~57\ = CARRY((!\clk_millisec_counter[14]~55\) # (!clk_millisec_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(15),
	datad => VCC,
	cin => \clk_millisec_counter[14]~55\,
	combout => \clk_millisec_counter[15]~56_combout\,
	cout => \clk_millisec_counter[15]~57\);

-- Location: LCFF_X34_Y12_N5
\clk_millisec_counter[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[15]~56_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(15));

-- Location: LCCOMB_X34_Y12_N8
\clk_millisec_counter[17]~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_millisec_counter[17]~60_combout\ = (clk_millisec_counter(17) & (!\clk_millisec_counter[16]~59\)) # (!clk_millisec_counter(17) & ((\clk_millisec_counter[16]~59\) # (GND)))
-- \clk_millisec_counter[17]~61\ = CARRY((!\clk_millisec_counter[16]~59\) # (!clk_millisec_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_millisec_counter(17),
	datad => VCC,
	cin => \clk_millisec_counter[16]~59\,
	combout => \clk_millisec_counter[17]~60_combout\,
	cout => \clk_millisec_counter[17]~61\);

-- Location: LCFF_X34_Y12_N9
\clk_millisec_counter[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[17]~60_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(17));

-- Location: LCFF_X34_Y12_N11
\clk_millisec_counter[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_millisec_counter[18]~62_combout\,
	sclr => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_millisec_counter(18));

-- Location: LCCOMB_X35_Y12_N30
\en_millisec_units~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_millisec_units~0_combout\ = (clk_millisec_counter(17) & clk_millisec_counter(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_millisec_counter(17),
	datad => clk_millisec_counter(18),
	combout => \en_millisec_units~0_combout\);

-- Location: LCCOMB_X35_Y12_N0
\en_millisec_units~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_millisec_units~1_combout\ = (!\en_sig~regout\ & (((\en_millisec_units~0_combout\ & !\LessThan0~5_combout\)) # (!\LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en_sig~regout\,
	datab => \en_millisec_units~0_combout\,
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~5_combout\,
	combout => \en_millisec_units~1_combout\);

-- Location: LCFF_X35_Y12_N1
en_millisec_units : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \en_millisec_units~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \en_millisec_units~regout\);

-- Location: LCCOMB_X1_Y12_N20
\U_MILLISEC_UNITS|CONT[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_UNITS|CONT[0]~4_combout\ = (\clr_sig~regout\) # ((\Equal0~0_combout\) # (\en_millisec_units~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clr_sig~regout\,
	datac => \Equal0~0_combout\,
	datad => \en_millisec_units~regout\,
	combout => \U_MILLISEC_UNITS|CONT[0]~4_combout\);

-- Location: LCFF_X1_Y12_N15
\U_MILLISEC_UNITS|CONT[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_MILLISEC_UNITS|CONT~6_combout\,
	ena => \U_MILLISEC_UNITS|CONT[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_MILLISEC_UNITS|CONT\(1));

-- Location: LCCOMB_X1_Y12_N16
\U_MILLISEC_UNITS|CONT~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_UNITS|CONT~8_combout\ = (\U_MILLISEC_UNITS|CONT[0]~5_combout\ & (\U_MILLISEC_UNITS|CONT\(2) $ (((\U_MILLISEC_UNITS|CONT\(0) & \U_MILLISEC_UNITS|CONT\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT[0]~5_combout\,
	combout => \U_MILLISEC_UNITS|CONT~8_combout\);

-- Location: LCFF_X1_Y12_N17
\U_MILLISEC_UNITS|CONT[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_MILLISEC_UNITS|CONT~8_combout\,
	ena => \U_MILLISEC_UNITS|CONT[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_MILLISEC_UNITS|CONT\(2));

-- Location: LCCOMB_X1_Y12_N12
\U_MILLISEC_UNITS|CONT~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_UNITS|CONT~3_combout\ = (!\Equal0~0_combout\ & (!\U_MILLISEC_UNITS|CONT[0]~2_combout\ & (!\U_MILLISEC_UNITS|CONT\(0) & !\clr_sig~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \U_MILLISEC_UNITS|CONT[0]~2_combout\,
	datac => \U_MILLISEC_UNITS|CONT\(0),
	datad => \clr_sig~regout\,
	combout => \U_MILLISEC_UNITS|CONT~3_combout\);

-- Location: LCFF_X1_Y12_N13
\U_MILLISEC_UNITS|CONT[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_MILLISEC_UNITS|CONT~3_combout\,
	ena => \U_MILLISEC_UNITS|CONT[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_MILLISEC_UNITS|CONT\(0));

-- Location: LCCOMB_X1_Y12_N28
\U_MILLISEC_UNITS|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_UNITS|Add0~0_combout\ = (\U_MILLISEC_UNITS|CONT\(1) & \U_MILLISEC_UNITS|CONT\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datad => \U_MILLISEC_UNITS|CONT\(0),
	combout => \U_MILLISEC_UNITS|Add0~0_combout\);

-- Location: LCCOMB_X1_Y12_N6
\U_MILLISEC_UNITS|CONT~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_UNITS|CONT~7_combout\ = (\U_MILLISEC_UNITS|CONT[0]~5_combout\ & (\U_MILLISEC_UNITS|CONT\(3) $ (((\U_MILLISEC_UNITS|CONT\(2) & \U_MILLISEC_UNITS|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(2),
	datab => \U_MILLISEC_UNITS|Add0~0_combout\,
	datac => \U_MILLISEC_UNITS|CONT\(3),
	datad => \U_MILLISEC_UNITS|CONT[0]~5_combout\,
	combout => \U_MILLISEC_UNITS|CONT~7_combout\);

-- Location: LCFF_X1_Y12_N7
\U_MILLISEC_UNITS|CONT[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_MILLISEC_UNITS|CONT~7_combout\,
	ena => \U_MILLISEC_UNITS|CONT[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_MILLISEC_UNITS|CONT\(3));

-- Location: LCCOMB_X1_Y12_N22
\U_MILLISEC_UNITS|CONT[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_UNITS|CONT[0]~2_combout\ = (\U_MILLISEC_UNITS|CONT\(0) & (!\U_MILLISEC_UNITS|CONT\(1) & (!\U_MILLISEC_UNITS|CONT\(2) & \U_MILLISEC_UNITS|CONT\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT\(3),
	combout => \U_MILLISEC_UNITS|CONT[0]~2_combout\);

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\button_1~I\ : cycloneii_io
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
	padio => ww_button_1,
	combout => \button_1~combout\);

-- Location: LCCOMB_X36_Y13_N8
\clk_button_1_counter[1]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[1]~28_combout\ = (clk_button_1_counter(1) & (!\clk_button_1_counter[0]~27\)) # (!clk_button_1_counter(1) & ((\clk_button_1_counter[0]~27\) # (GND)))
-- \clk_button_1_counter[1]~29\ = CARRY((!\clk_button_1_counter[0]~27\) # (!clk_button_1_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(1),
	datad => VCC,
	cin => \clk_button_1_counter[0]~27\,
	combout => \clk_button_1_counter[1]~28_combout\,
	cout => \clk_button_1_counter[1]~29\);

-- Location: LCFF_X36_Y13_N9
\clk_button_1_counter[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[1]~28_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(1));

-- Location: LCCOMB_X36_Y13_N14
\clk_button_1_counter[4]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[4]~34_combout\ = (clk_button_1_counter(4) & (\clk_button_1_counter[3]~33\ $ (GND))) # (!clk_button_1_counter(4) & (!\clk_button_1_counter[3]~33\ & VCC))
-- \clk_button_1_counter[4]~35\ = CARRY((clk_button_1_counter(4) & !\clk_button_1_counter[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(4),
	datad => VCC,
	cin => \clk_button_1_counter[3]~33\,
	combout => \clk_button_1_counter[4]~34_combout\,
	cout => \clk_button_1_counter[4]~35\);

-- Location: LCFF_X36_Y13_N15
\clk_button_1_counter[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[4]~34_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(4));

-- Location: LCCOMB_X36_Y13_N18
\clk_button_1_counter[6]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[6]~38_combout\ = (clk_button_1_counter(6) & (\clk_button_1_counter[5]~37\ $ (GND))) # (!clk_button_1_counter(6) & (!\clk_button_1_counter[5]~37\ & VCC))
-- \clk_button_1_counter[6]~39\ = CARRY((clk_button_1_counter(6) & !\clk_button_1_counter[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(6),
	datad => VCC,
	cin => \clk_button_1_counter[5]~37\,
	combout => \clk_button_1_counter[6]~38_combout\,
	cout => \clk_button_1_counter[6]~39\);

-- Location: LCFF_X36_Y13_N19
\clk_button_1_counter[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[6]~38_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(6));

-- Location: LCCOMB_X36_Y13_N20
\clk_button_1_counter[7]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[7]~40_combout\ = (clk_button_1_counter(7) & (!\clk_button_1_counter[6]~39\)) # (!clk_button_1_counter(7) & ((\clk_button_1_counter[6]~39\) # (GND)))
-- \clk_button_1_counter[7]~41\ = CARRY((!\clk_button_1_counter[6]~39\) # (!clk_button_1_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(7),
	datad => VCC,
	cin => \clk_button_1_counter[6]~39\,
	combout => \clk_button_1_counter[7]~40_combout\,
	cout => \clk_button_1_counter[7]~41\);

-- Location: LCCOMB_X36_Y13_N22
\clk_button_1_counter[8]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[8]~42_combout\ = (clk_button_1_counter(8) & (\clk_button_1_counter[7]~41\ $ (GND))) # (!clk_button_1_counter(8) & (!\clk_button_1_counter[7]~41\ & VCC))
-- \clk_button_1_counter[8]~43\ = CARRY((clk_button_1_counter(8) & !\clk_button_1_counter[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(8),
	datad => VCC,
	cin => \clk_button_1_counter[7]~41\,
	combout => \clk_button_1_counter[8]~42_combout\,
	cout => \clk_button_1_counter[8]~43\);

-- Location: LCFF_X36_Y13_N23
\clk_button_1_counter[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[8]~42_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(8));

-- Location: LCCOMB_X36_Y13_N26
\clk_button_1_counter[10]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[10]~46_combout\ = (clk_button_1_counter(10) & (\clk_button_1_counter[9]~45\ $ (GND))) # (!clk_button_1_counter(10) & (!\clk_button_1_counter[9]~45\ & VCC))
-- \clk_button_1_counter[10]~47\ = CARRY((clk_button_1_counter(10) & !\clk_button_1_counter[9]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(10),
	datad => VCC,
	cin => \clk_button_1_counter[9]~45\,
	combout => \clk_button_1_counter[10]~46_combout\,
	cout => \clk_button_1_counter[10]~47\);

-- Location: LCFF_X36_Y13_N27
\clk_button_1_counter[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[10]~46_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(10));

-- Location: LCCOMB_X36_Y13_N28
\clk_button_1_counter[11]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[11]~48_combout\ = (clk_button_1_counter(11) & (!\clk_button_1_counter[10]~47\)) # (!clk_button_1_counter(11) & ((\clk_button_1_counter[10]~47\) # (GND)))
-- \clk_button_1_counter[11]~49\ = CARRY((!\clk_button_1_counter[10]~47\) # (!clk_button_1_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(11),
	datad => VCC,
	cin => \clk_button_1_counter[10]~47\,
	combout => \clk_button_1_counter[11]~48_combout\,
	cout => \clk_button_1_counter[11]~49\);

-- Location: LCFF_X36_Y13_N29
\clk_button_1_counter[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[11]~48_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(11));

-- Location: LCCOMB_X36_Y13_N30
\clk_button_1_counter[12]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[12]~50_combout\ = (clk_button_1_counter(12) & (\clk_button_1_counter[11]~49\ $ (GND))) # (!clk_button_1_counter(12) & (!\clk_button_1_counter[11]~49\ & VCC))
-- \clk_button_1_counter[12]~51\ = CARRY((clk_button_1_counter(12) & !\clk_button_1_counter[11]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(12),
	datad => VCC,
	cin => \clk_button_1_counter[11]~49\,
	combout => \clk_button_1_counter[12]~50_combout\,
	cout => \clk_button_1_counter[12]~51\);

-- Location: LCFF_X36_Y13_N31
\clk_button_1_counter[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[12]~50_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(12));

-- Location: LCCOMB_X36_Y12_N0
\clk_button_1_counter[13]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[13]~52_combout\ = (clk_button_1_counter(13) & (!\clk_button_1_counter[12]~51\)) # (!clk_button_1_counter(13) & ((\clk_button_1_counter[12]~51\) # (GND)))
-- \clk_button_1_counter[13]~53\ = CARRY((!\clk_button_1_counter[12]~51\) # (!clk_button_1_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(13),
	datad => VCC,
	cin => \clk_button_1_counter[12]~51\,
	combout => \clk_button_1_counter[13]~52_combout\,
	cout => \clk_button_1_counter[13]~53\);

-- Location: LCFF_X36_Y12_N1
\clk_button_1_counter[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[13]~52_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(13));

-- Location: LCCOMB_X36_Y12_N2
\clk_button_1_counter[14]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[14]~54_combout\ = (clk_button_1_counter(14) & (\clk_button_1_counter[13]~53\ $ (GND))) # (!clk_button_1_counter(14) & (!\clk_button_1_counter[13]~53\ & VCC))
-- \clk_button_1_counter[14]~55\ = CARRY((clk_button_1_counter(14) & !\clk_button_1_counter[13]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(14),
	datad => VCC,
	cin => \clk_button_1_counter[13]~53\,
	combout => \clk_button_1_counter[14]~54_combout\,
	cout => \clk_button_1_counter[14]~55\);

-- Location: LCFF_X36_Y12_N3
\clk_button_1_counter[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[14]~54_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(14));

-- Location: LCCOMB_X36_Y12_N4
\clk_button_1_counter[15]~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[15]~56_combout\ = (clk_button_1_counter(15) & (!\clk_button_1_counter[14]~55\)) # (!clk_button_1_counter(15) & ((\clk_button_1_counter[14]~55\) # (GND)))
-- \clk_button_1_counter[15]~57\ = CARRY((!\clk_button_1_counter[14]~55\) # (!clk_button_1_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(15),
	datad => VCC,
	cin => \clk_button_1_counter[14]~55\,
	combout => \clk_button_1_counter[15]~56_combout\,
	cout => \clk_button_1_counter[15]~57\);

-- Location: LCFF_X36_Y12_N5
\clk_button_1_counter[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[15]~56_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(15));

-- Location: LCCOMB_X36_Y12_N8
\clk_button_1_counter[17]~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[17]~60_combout\ = (clk_button_1_counter(17) & (!\clk_button_1_counter[16]~59\)) # (!clk_button_1_counter(17) & ((\clk_button_1_counter[16]~59\) # (GND)))
-- \clk_button_1_counter[17]~61\ = CARRY((!\clk_button_1_counter[16]~59\) # (!clk_button_1_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(17),
	datad => VCC,
	cin => \clk_button_1_counter[16]~59\,
	combout => \clk_button_1_counter[17]~60_combout\,
	cout => \clk_button_1_counter[17]~61\);

-- Location: LCFF_X36_Y12_N9
\clk_button_1_counter[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[17]~60_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(17));

-- Location: LCCOMB_X36_Y12_N10
\clk_button_1_counter[18]~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[18]~62_combout\ = (clk_button_1_counter(18) & (\clk_button_1_counter[17]~61\ $ (GND))) # (!clk_button_1_counter(18) & (!\clk_button_1_counter[17]~61\ & VCC))
-- \clk_button_1_counter[18]~63\ = CARRY((clk_button_1_counter(18) & !\clk_button_1_counter[17]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(18),
	datad => VCC,
	cin => \clk_button_1_counter[17]~61\,
	combout => \clk_button_1_counter[18]~62_combout\,
	cout => \clk_button_1_counter[18]~63\);

-- Location: LCCOMB_X36_Y12_N14
\clk_button_1_counter[20]~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[20]~66_combout\ = (clk_button_1_counter(20) & (\clk_button_1_counter[19]~65\ $ (GND))) # (!clk_button_1_counter(20) & (!\clk_button_1_counter[19]~65\ & VCC))
-- \clk_button_1_counter[20]~67\ = CARRY((clk_button_1_counter(20) & !\clk_button_1_counter[19]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(20),
	datad => VCC,
	cin => \clk_button_1_counter[19]~65\,
	combout => \clk_button_1_counter[20]~66_combout\,
	cout => \clk_button_1_counter[20]~67\);

-- Location: LCFF_X36_Y12_N15
\clk_button_1_counter[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[20]~66_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(20));

-- Location: LCCOMB_X36_Y12_N16
\clk_button_1_counter[21]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[21]~68_combout\ = (clk_button_1_counter(21) & (!\clk_button_1_counter[20]~67\)) # (!clk_button_1_counter(21) & ((\clk_button_1_counter[20]~67\) # (GND)))
-- \clk_button_1_counter[21]~69\ = CARRY((!\clk_button_1_counter[20]~67\) # (!clk_button_1_counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(21),
	datad => VCC,
	cin => \clk_button_1_counter[20]~67\,
	combout => \clk_button_1_counter[21]~68_combout\,
	cout => \clk_button_1_counter[21]~69\);

-- Location: LCFF_X36_Y12_N17
\clk_button_1_counter[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[21]~68_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(21));

-- Location: LCCOMB_X36_Y12_N18
\clk_button_1_counter[22]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[22]~70_combout\ = (clk_button_1_counter(22) & (\clk_button_1_counter[21]~69\ $ (GND))) # (!clk_button_1_counter(22) & (!\clk_button_1_counter[21]~69\ & VCC))
-- \clk_button_1_counter[22]~71\ = CARRY((clk_button_1_counter(22) & !\clk_button_1_counter[21]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => clk_button_1_counter(22),
	datad => VCC,
	cin => \clk_button_1_counter[21]~69\,
	combout => \clk_button_1_counter[22]~70_combout\,
	cout => \clk_button_1_counter[22]~71\);

-- Location: LCFF_X36_Y12_N19
\clk_button_1_counter[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[22]~70_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(22));

-- Location: LCCOMB_X36_Y12_N20
\clk_button_1_counter[23]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \clk_button_1_counter[23]~72_combout\ = (clk_button_1_counter(23) & (!\clk_button_1_counter[22]~71\)) # (!clk_button_1_counter(23) & ((\clk_button_1_counter[22]~71\) # (GND)))
-- \clk_button_1_counter[23]~73\ = CARRY((!\clk_button_1_counter[22]~71\) # (!clk_button_1_counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(23),
	datad => VCC,
	cin => \clk_button_1_counter[22]~71\,
	combout => \clk_button_1_counter[23]~72_combout\,
	cout => \clk_button_1_counter[23]~73\);

-- Location: LCFF_X36_Y12_N23
\clk_button_1_counter[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[24]~74_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(24));

-- Location: LCFF_X36_Y12_N21
\clk_button_1_counter[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[23]~72_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(23));

-- Location: LCCOMB_X36_Y12_N30
\en_sig~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sig~0_combout\ = (!clk_button_1_counter(25) & (!clk_button_1_counter(24) & (!clk_button_1_counter(23) & !clk_button_1_counter(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(25),
	datab => clk_button_1_counter(24),
	datac => clk_button_1_counter(23),
	datad => clk_button_1_counter(22),
	combout => \en_sig~0_combout\);

-- Location: LCCOMB_X36_Y12_N28
\en_sig~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sig~1_combout\ = (\button_1~combout\) # ((!clk_button_1_counter(21) & \en_sig~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \button_1~combout\,
	datac => clk_button_1_counter(21),
	datad => \en_sig~0_combout\,
	combout => \en_sig~1_combout\);

-- Location: LCFF_X36_Y12_N11
\clk_button_1_counter[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[18]~62_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(18));

-- Location: LCCOMB_X36_Y13_N4
\en_sig~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sig~3_combout\ = (!clk_button_1_counter(12) & (!clk_button_1_counter(11) & (!clk_button_1_counter(17) & !clk_button_1_counter(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(12),
	datab => clk_button_1_counter(11),
	datac => clk_button_1_counter(17),
	datad => clk_button_1_counter(13),
	combout => \en_sig~3_combout\);

-- Location: LCFF_X36_Y13_N21
\clk_button_1_counter[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \clk_button_1_counter[7]~40_combout\,
	sclr => \button_1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => clk_button_1_counter(7));

-- Location: LCCOMB_X36_Y13_N2
\en_sig~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sig~4_combout\ = ((!clk_button_1_counter(8) & ((!clk_button_1_counter(7)) # (!clk_button_1_counter(6))))) # (!clk_button_1_counter(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(9),
	datab => clk_button_1_counter(6),
	datac => clk_button_1_counter(7),
	datad => clk_button_1_counter(8),
	combout => \en_sig~4_combout\);

-- Location: LCCOMB_X36_Y13_N0
\en_sig~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sig~5_combout\ = (clk_button_1_counter(19) & (((clk_button_1_counter(10) & !\en_sig~4_combout\)) # (!\en_sig~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(19),
	datab => clk_button_1_counter(10),
	datac => \en_sig~3_combout\,
	datad => \en_sig~4_combout\,
	combout => \en_sig~5_combout\);

-- Location: LCCOMB_X35_Y12_N28
\en_sig~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sig~6_combout\ = (\en_sig~0_combout\ & ((\en_sig~2_combout\) # ((!\en_sig~5_combout\) # (!clk_button_1_counter(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en_sig~2_combout\,
	datab => clk_button_1_counter(18),
	datac => \en_sig~5_combout\,
	datad => \en_sig~0_combout\,
	combout => \en_sig~6_combout\);

-- Location: LCCOMB_X35_Y12_N26
\en_sig~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sig~7_combout\ = \en_sig~regout\ $ (((!\en_sig~1_combout\ & ((clk_button_1_counter(20)) # (!\en_sig~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_button_1_counter(20),
	datab => \en_sig~1_combout\,
	datac => \en_sig~regout\,
	datad => \en_sig~6_combout\,
	combout => \en_sig~7_combout\);

-- Location: LCFF_X35_Y12_N27
en_sig : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \en_sig~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \en_sig~regout\);

-- Location: LCCOMB_X35_Y12_N12
\en_sec_units~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sec_units~0_combout\ = (\en_millisec_units~regout\ & !\en_sig~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \en_millisec_units~regout\,
	datad => \en_sig~regout\,
	combout => \en_sec_units~0_combout\);

-- Location: LCCOMB_X5_Y12_N30
\U_MILLISEC_TENS|CONT[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_TENS|CONT[0]~3_combout\ = (\Equal0~0_combout\) # ((\clr_sig~regout\) # ((\U_MILLISEC_UNITS|CONT[0]~2_combout\ & \en_sec_units~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \U_MILLISEC_UNITS|CONT[0]~2_combout\,
	datac => \clr_sig~regout\,
	datad => \en_sec_units~0_combout\,
	combout => \U_MILLISEC_TENS|CONT[0]~3_combout\);

-- Location: LCFF_X6_Y12_N13
\U_MILLISEC_TENS|CONT[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_MILLISEC_TENS|CONT~5_combout\,
	ena => \U_MILLISEC_TENS|CONT[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_MILLISEC_TENS|CONT\(1));

-- Location: LCCOMB_X6_Y12_N30
\U_MILLISEC_TENS|CONT~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_TENS|CONT~7_combout\ = (\U_MILLISEC_TENS|CONT[0]~4_combout\ & (\U_MILLISEC_TENS|CONT\(2) $ (((\U_MILLISEC_TENS|CONT\(0) & \U_MILLISEC_TENS|CONT\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(0),
	datab => \U_MILLISEC_TENS|CONT[0]~4_combout\,
	datac => \U_MILLISEC_TENS|CONT\(2),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \U_MILLISEC_TENS|CONT~7_combout\);

-- Location: LCFF_X6_Y12_N31
\U_MILLISEC_TENS|CONT[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_MILLISEC_TENS|CONT~7_combout\,
	ena => \U_MILLISEC_TENS|CONT[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_MILLISEC_TENS|CONT\(2));

-- Location: LCCOMB_X5_Y12_N20
\U_MILLISEC_TENS|CONT~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_TENS|CONT~2_combout\ = (!\Equal0~0_combout\ & (!\clr_sig~regout\ & (!\U_MILLISEC_TENS|CONT\(0) & !\en_sec_units~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \clr_sig~regout\,
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \en_sec_units~1_combout\,
	combout => \U_MILLISEC_TENS|CONT~2_combout\);

-- Location: LCFF_X5_Y12_N21
\U_MILLISEC_TENS|CONT[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_MILLISEC_TENS|CONT~2_combout\,
	ena => \U_MILLISEC_TENS|CONT[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_MILLISEC_TENS|CONT\(0));

-- Location: LCCOMB_X6_Y12_N22
\en_sec_units~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sec_units~1_combout\ = (\U_MILLISEC_TENS|CONT\(3) & (!\U_MILLISEC_TENS|CONT\(2) & (\U_MILLISEC_TENS|CONT\(0) & !\U_MILLISEC_TENS|CONT\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(3),
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \en_sec_units~1_combout\);

-- Location: LCCOMB_X5_Y12_N28
\en_sec_tens~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sec_tens~1_combout\ = (((!\en_sec_units~0_combout\) # (!\U_MILLISEC_UNITS|CONT[0]~2_combout\)) # (!\en_sec_units~1_combout\)) # (!\en_sec_tens~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en_sec_tens~0_combout\,
	datab => \en_sec_units~1_combout\,
	datac => \U_MILLISEC_UNITS|CONT[0]~2_combout\,
	datad => \en_sec_units~0_combout\,
	combout => \en_sec_tens~1_combout\);

-- Location: LCCOMB_X4_Y12_N12
internal_clear : cycloneii_lcell_comb
-- Equation(s):
-- \internal_clear~combout\ = (\Equal0~0_combout\) # (\clr_sig~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~0_combout\,
	datad => \clr_sig~regout\,
	combout => \internal_clear~combout\);

-- Location: LCCOMB_X5_Y12_N4
\U_SEC_TENS|CONT[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|CONT[0]~7_combout\ = (!\internal_clear~combout\ & ((\en_sec_tens~1_combout\ & ((\U_SEC_TENS|CONT\(0)))) # (!\en_sec_tens~1_combout\ & (\U_SEC_TENS|CONT[3]~6_combout\ & !\U_SEC_TENS|CONT\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT[3]~6_combout\,
	datab => \en_sec_tens~1_combout\,
	datac => \U_SEC_TENS|CONT\(0),
	datad => \internal_clear~combout\,
	combout => \U_SEC_TENS|CONT[0]~7_combout\);

-- Location: LCFF_X5_Y12_N5
\U_SEC_TENS|CONT[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_SEC_TENS|CONT[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_SEC_TENS|CONT\(0));

-- Location: LCCOMB_X5_Y12_N10
\U_SEC_TENS|CONT[3]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_TENS|CONT[3]~10_combout\ = (\U_SEC_TENS|Add0~1_combout\ & ((\U_SEC_TENS|CONT[3]~12_combout\) # ((\U_SEC_TENS|CONT[3]~13_combout\ & \U_SEC_TENS|CONT\(3))))) # (!\U_SEC_TENS|Add0~1_combout\ & (\U_SEC_TENS|CONT[3]~13_combout\ & 
-- (\U_SEC_TENS|CONT\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|Add0~1_combout\,
	datab => \U_SEC_TENS|CONT[3]~13_combout\,
	datac => \U_SEC_TENS|CONT\(3),
	datad => \U_SEC_TENS|CONT[3]~12_combout\,
	combout => \U_SEC_TENS|CONT[3]~10_combout\);

-- Location: LCFF_X5_Y12_N11
\U_SEC_TENS|CONT[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_SEC_TENS|CONT[3]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_SEC_TENS|CONT\(3));

-- Location: LCCOMB_X4_Y24_N24
\tens_display|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tens_display|Mux6~0_combout\ = (\U_SEC_TENS|CONT\(1) & (((\U_SEC_TENS|CONT\(3))))) # (!\U_SEC_TENS|CONT\(1) & (\U_SEC_TENS|CONT\(2) $ (((\U_SEC_TENS|CONT\(0) & !\U_SEC_TENS|CONT\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(0),
	datab => \U_SEC_TENS|CONT\(3),
	datac => \U_SEC_TENS|CONT\(2),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \tens_display|Mux6~0_combout\);

-- Location: LCCOMB_X4_Y24_N26
\tens_display|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tens_display|Mux5~0_combout\ = (\U_SEC_TENS|CONT\(3) & (((\U_SEC_TENS|CONT\(2)) # (\U_SEC_TENS|CONT\(1))))) # (!\U_SEC_TENS|CONT\(3) & (\U_SEC_TENS|CONT\(2) & (\U_SEC_TENS|CONT\(0) $ (\U_SEC_TENS|CONT\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(0),
	datab => \U_SEC_TENS|CONT\(3),
	datac => \U_SEC_TENS|CONT\(2),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \tens_display|Mux5~0_combout\);

-- Location: LCCOMB_X4_Y24_N12
\tens_display|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tens_display|Mux4~0_combout\ = (\U_SEC_TENS|CONT\(2) & (((\U_SEC_TENS|CONT\(3))))) # (!\U_SEC_TENS|CONT\(2) & (\U_SEC_TENS|CONT\(1) & ((\U_SEC_TENS|CONT\(3)) # (!\U_SEC_TENS|CONT\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(0),
	datab => \U_SEC_TENS|CONT\(3),
	datac => \U_SEC_TENS|CONT\(2),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \tens_display|Mux4~0_combout\);

-- Location: LCCOMB_X4_Y24_N10
\tens_display|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tens_display|Mux3~0_combout\ = (\U_SEC_TENS|CONT\(0) & ((\U_SEC_TENS|CONT\(3)) # (\U_SEC_TENS|CONT\(2) $ (!\U_SEC_TENS|CONT\(1))))) # (!\U_SEC_TENS|CONT\(0) & ((\U_SEC_TENS|CONT\(1) & (\U_SEC_TENS|CONT\(3))) # (!\U_SEC_TENS|CONT\(1) & 
-- ((\U_SEC_TENS|CONT\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(0),
	datab => \U_SEC_TENS|CONT\(3),
	datac => \U_SEC_TENS|CONT\(2),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \tens_display|Mux3~0_combout\);

-- Location: LCCOMB_X4_Y24_N8
\tens_display|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tens_display|Mux2~0_combout\ = (\U_SEC_TENS|CONT\(0)) # ((\U_SEC_TENS|CONT\(1) & (\U_SEC_TENS|CONT\(3))) # (!\U_SEC_TENS|CONT\(1) & ((\U_SEC_TENS|CONT\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(0),
	datab => \U_SEC_TENS|CONT\(3),
	datac => \U_SEC_TENS|CONT\(2),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \tens_display|Mux2~0_combout\);

-- Location: LCCOMB_X4_Y24_N22
\tens_display|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tens_display|Mux1~0_combout\ = (\U_SEC_TENS|CONT\(0) & ((\U_SEC_TENS|CONT\(1)) # (\U_SEC_TENS|CONT\(3) $ (!\U_SEC_TENS|CONT\(2))))) # (!\U_SEC_TENS|CONT\(0) & ((\U_SEC_TENS|CONT\(2) & (\U_SEC_TENS|CONT\(3))) # (!\U_SEC_TENS|CONT\(2) & 
-- ((\U_SEC_TENS|CONT\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(0),
	datab => \U_SEC_TENS|CONT\(3),
	datac => \U_SEC_TENS|CONT\(2),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \tens_display|Mux1~0_combout\);

-- Location: LCCOMB_X4_Y24_N0
\tens_display|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \tens_display|Mux0~0_combout\ = (\U_SEC_TENS|CONT\(2) & (!\U_SEC_TENS|CONT\(3) & ((!\U_SEC_TENS|CONT\(1)) # (!\U_SEC_TENS|CONT\(0))))) # (!\U_SEC_TENS|CONT\(2) & ((\U_SEC_TENS|CONT\(3) $ (\U_SEC_TENS|CONT\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_TENS|CONT\(0),
	datab => \U_SEC_TENS|CONT\(3),
	datac => \U_SEC_TENS|CONT\(2),
	datad => \U_SEC_TENS|CONT\(1),
	combout => \tens_display|Mux0~0_combout\);

-- Location: LCCOMB_X4_Y12_N28
\U_SEC_UNITS|CONT[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_UNITS|CONT[0]~4_combout\ = (!\en_sec_tens~0_combout\ & (!\clr_sig~regout\ & !\Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \en_sec_tens~0_combout\,
	datac => \clr_sig~regout\,
	datad => \Equal0~0_combout\,
	combout => \U_SEC_UNITS|CONT[0]~4_combout\);

-- Location: LCCOMB_X4_Y12_N18
\U_SEC_UNITS|CONT~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_UNITS|CONT~5_combout\ = (\U_SEC_UNITS|CONT[0]~4_combout\ & (\U_SEC_UNITS|CONT\(0) $ (\U_SEC_UNITS|CONT\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datac => \U_SEC_UNITS|CONT\(1),
	datad => \U_SEC_UNITS|CONT[0]~4_combout\,
	combout => \U_SEC_UNITS|CONT~5_combout\);

-- Location: LCCOMB_X4_Y12_N22
\U_SEC_UNITS|CONT[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_UNITS|CONT[0]~3_combout\ = (\internal_clear~combout\) # ((\U_MILLISEC_UNITS|CONT[0]~2_combout\ & (\en_sec_units~1_combout\ & \en_sec_units~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT[0]~2_combout\,
	datab => \en_sec_units~1_combout\,
	datac => \en_sec_units~0_combout\,
	datad => \internal_clear~combout\,
	combout => \U_SEC_UNITS|CONT[0]~3_combout\);

-- Location: LCFF_X4_Y12_N19
\U_SEC_UNITS|CONT[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_SEC_UNITS|CONT~5_combout\,
	ena => \U_SEC_UNITS|CONT[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_SEC_UNITS|CONT\(1));

-- Location: LCCOMB_X4_Y12_N4
\U_SEC_UNITS|CONT~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_UNITS|CONT~7_combout\ = (\U_SEC_UNITS|CONT[0]~4_combout\ & (\U_SEC_UNITS|CONT\(2) $ (((\U_SEC_UNITS|CONT\(0) & \U_SEC_UNITS|CONT\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT[0]~4_combout\,
	combout => \U_SEC_UNITS|CONT~7_combout\);

-- Location: LCFF_X4_Y12_N5
\U_SEC_UNITS|CONT[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_SEC_UNITS|CONT~7_combout\,
	ena => \U_SEC_UNITS|CONT[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_SEC_UNITS|CONT\(2));

-- Location: LCCOMB_X4_Y12_N2
\U_SEC_UNITS|CONT~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_UNITS|CONT~6_combout\ = (\U_SEC_UNITS|CONT[0]~4_combout\ & (\U_SEC_UNITS|CONT\(3) $ (((\U_SEC_UNITS|Add0~0_combout\ & \U_SEC_UNITS|CONT\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|Add0~0_combout\,
	datab => \U_SEC_UNITS|CONT\(2),
	datac => \U_SEC_UNITS|CONT\(3),
	datad => \U_SEC_UNITS|CONT[0]~4_combout\,
	combout => \U_SEC_UNITS|CONT~6_combout\);

-- Location: LCFF_X4_Y12_N3
\U_SEC_UNITS|CONT[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_SEC_UNITS|CONT~6_combout\,
	ena => \U_SEC_UNITS|CONT[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_SEC_UNITS|CONT\(3));

-- Location: LCCOMB_X4_Y12_N14
\en_sec_tens~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \en_sec_tens~0_combout\ = (\U_SEC_UNITS|CONT\(0) & (!\U_SEC_UNITS|CONT\(1) & (!\U_SEC_UNITS|CONT\(2) & \U_SEC_UNITS|CONT\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT\(3),
	combout => \en_sec_tens~0_combout\);

-- Location: LCCOMB_X4_Y12_N24
\U_SEC_UNITS|CONT~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_SEC_UNITS|CONT~2_combout\ = (!\clr_sig~regout\ & (!\en_sec_tens~0_combout\ & (!\U_SEC_UNITS|CONT\(0) & !\Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clr_sig~regout\,
	datab => \en_sec_tens~0_combout\,
	datac => \U_SEC_UNITS|CONT\(0),
	datad => \Equal0~0_combout\,
	combout => \U_SEC_UNITS|CONT~2_combout\);

-- Location: LCFF_X4_Y12_N25
\U_SEC_UNITS|CONT[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_SEC_UNITS|CONT~2_combout\,
	ena => \U_SEC_UNITS|CONT[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_SEC_UNITS|CONT\(0));

-- Location: LCCOMB_X4_Y12_N0
\units_display|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux6~0_combout\ = (\U_SEC_UNITS|CONT\(1) & (((\U_SEC_UNITS|CONT\(3))))) # (!\U_SEC_UNITS|CONT\(1) & (\U_SEC_UNITS|CONT\(2) $ (((\U_SEC_UNITS|CONT\(0) & !\U_SEC_UNITS|CONT\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT\(3),
	combout => \units_display|Mux6~0_combout\);

-- Location: LCCOMB_X4_Y12_N26
\units_display|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux5~0_combout\ = (\U_SEC_UNITS|CONT\(2) & ((\U_SEC_UNITS|CONT\(3)) # (\U_SEC_UNITS|CONT\(0) $ (\U_SEC_UNITS|CONT\(1))))) # (!\U_SEC_UNITS|CONT\(2) & (((\U_SEC_UNITS|CONT\(1) & \U_SEC_UNITS|CONT\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT\(3),
	combout => \units_display|Mux5~0_combout\);

-- Location: LCCOMB_X4_Y12_N20
\units_display|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux4~0_combout\ = (\U_SEC_UNITS|CONT\(2) & (((\U_SEC_UNITS|CONT\(3))))) # (!\U_SEC_UNITS|CONT\(2) & (\U_SEC_UNITS|CONT\(1) & ((\U_SEC_UNITS|CONT\(3)) # (!\U_SEC_UNITS|CONT\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT\(3),
	combout => \units_display|Mux4~0_combout\);

-- Location: LCCOMB_X4_Y12_N6
\units_display|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux3~0_combout\ = (\U_SEC_UNITS|CONT\(0) & ((\U_SEC_UNITS|CONT\(3)) # (\U_SEC_UNITS|CONT\(1) $ (!\U_SEC_UNITS|CONT\(2))))) # (!\U_SEC_UNITS|CONT\(0) & ((\U_SEC_UNITS|CONT\(1) & ((\U_SEC_UNITS|CONT\(3)))) # (!\U_SEC_UNITS|CONT\(1) & 
-- (\U_SEC_UNITS|CONT\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT\(3),
	combout => \units_display|Mux3~0_combout\);

-- Location: LCCOMB_X4_Y12_N8
\units_display|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux2~0_combout\ = (\U_SEC_UNITS|CONT\(0)) # ((\U_SEC_UNITS|CONT\(1) & ((\U_SEC_UNITS|CONT\(3)))) # (!\U_SEC_UNITS|CONT\(1) & (\U_SEC_UNITS|CONT\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT\(3),
	combout => \units_display|Mux2~0_combout\);

-- Location: LCCOMB_X4_Y12_N30
\units_display|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux1~0_combout\ = (\U_SEC_UNITS|CONT\(0) & ((\U_SEC_UNITS|CONT\(1)) # (\U_SEC_UNITS|CONT\(2) $ (!\U_SEC_UNITS|CONT\(3))))) # (!\U_SEC_UNITS|CONT\(0) & ((\U_SEC_UNITS|CONT\(2) & ((\U_SEC_UNITS|CONT\(3)))) # (!\U_SEC_UNITS|CONT\(2) & 
-- (\U_SEC_UNITS|CONT\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT\(3),
	combout => \units_display|Mux1~0_combout\);

-- Location: LCCOMB_X4_Y12_N16
\units_display|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \units_display|Mux0~0_combout\ = (\U_SEC_UNITS|CONT\(1) & (!\U_SEC_UNITS|CONT\(3) & ((!\U_SEC_UNITS|CONT\(2)) # (!\U_SEC_UNITS|CONT\(0))))) # (!\U_SEC_UNITS|CONT\(1) & ((\U_SEC_UNITS|CONT\(2) $ (\U_SEC_UNITS|CONT\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_SEC_UNITS|CONT\(0),
	datab => \U_SEC_UNITS|CONT\(1),
	datac => \U_SEC_UNITS|CONT\(2),
	datad => \U_SEC_UNITS|CONT\(3),
	combout => \units_display|Mux0~0_combout\);

-- Location: LCCOMB_X6_Y12_N4
\U_MILLISEC_TENS|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_TENS|Add0~0_combout\ = (\U_MILLISEC_TENS|CONT\(0) & \U_MILLISEC_TENS|CONT\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \U_MILLISEC_TENS|Add0~0_combout\);

-- Location: LCCOMB_X5_Y12_N14
\U_MILLISEC_TENS|CONT~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \U_MILLISEC_TENS|CONT~6_combout\ = (\U_MILLISEC_TENS|CONT[0]~4_combout\ & (\U_MILLISEC_TENS|CONT\(3) $ (((\U_MILLISEC_TENS|CONT\(2) & \U_MILLISEC_TENS|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT[0]~4_combout\,
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(3),
	datad => \U_MILLISEC_TENS|Add0~0_combout\,
	combout => \U_MILLISEC_TENS|CONT~6_combout\);

-- Location: LCFF_X5_Y12_N15
\U_MILLISEC_TENS|CONT[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~clkctrl_outclk\,
	datain => \U_MILLISEC_TENS|CONT~6_combout\,
	ena => \U_MILLISEC_TENS|CONT[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \U_MILLISEC_TENS|CONT\(3));

-- Location: LCCOMB_X6_Y12_N20
\hundreth_tens_display|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_tens_display|Mux6~0_combout\ = (\U_MILLISEC_TENS|CONT\(1) & (\U_MILLISEC_TENS|CONT\(3))) # (!\U_MILLISEC_TENS|CONT\(1) & (\U_MILLISEC_TENS|CONT\(2) $ (((!\U_MILLISEC_TENS|CONT\(3) & \U_MILLISEC_TENS|CONT\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(3),
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \hundreth_tens_display|Mux6~0_combout\);

-- Location: LCCOMB_X6_Y12_N6
\hundreth_tens_display|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_tens_display|Mux5~0_combout\ = (\U_MILLISEC_TENS|CONT\(3) & ((\U_MILLISEC_TENS|CONT\(2)) # ((\U_MILLISEC_TENS|CONT\(1))))) # (!\U_MILLISEC_TENS|CONT\(3) & (\U_MILLISEC_TENS|CONT\(2) & (\U_MILLISEC_TENS|CONT\(0) $ (\U_MILLISEC_TENS|CONT\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(3),
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \hundreth_tens_display|Mux5~0_combout\);

-- Location: LCCOMB_X6_Y12_N28
\hundreth_tens_display|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_tens_display|Mux4~0_combout\ = (\U_MILLISEC_TENS|CONT\(2) & (\U_MILLISEC_TENS|CONT\(3))) # (!\U_MILLISEC_TENS|CONT\(2) & (\U_MILLISEC_TENS|CONT\(1) & ((\U_MILLISEC_TENS|CONT\(3)) # (!\U_MILLISEC_TENS|CONT\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(3),
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \hundreth_tens_display|Mux4~0_combout\);

-- Location: LCCOMB_X6_Y12_N26
\hundreth_tens_display|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_tens_display|Mux3~0_combout\ = (\U_MILLISEC_TENS|CONT\(2) & ((\U_MILLISEC_TENS|CONT\(3)) # (\U_MILLISEC_TENS|CONT\(0) $ (!\U_MILLISEC_TENS|CONT\(1))))) # (!\U_MILLISEC_TENS|CONT\(2) & ((\U_MILLISEC_TENS|CONT\(1) & (\U_MILLISEC_TENS|CONT\(3))) # 
-- (!\U_MILLISEC_TENS|CONT\(1) & ((\U_MILLISEC_TENS|CONT\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(3),
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \hundreth_tens_display|Mux3~0_combout\);

-- Location: LCCOMB_X6_Y12_N24
\hundreth_tens_display|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_tens_display|Mux2~0_combout\ = (\U_MILLISEC_TENS|CONT\(0)) # ((\U_MILLISEC_TENS|CONT\(1) & (\U_MILLISEC_TENS|CONT\(3))) # (!\U_MILLISEC_TENS|CONT\(1) & ((\U_MILLISEC_TENS|CONT\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(3),
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \hundreth_tens_display|Mux2~0_combout\);

-- Location: LCCOMB_X6_Y12_N10
\hundreth_tens_display|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_tens_display|Mux1~0_combout\ = (\U_MILLISEC_TENS|CONT\(2) & ((\U_MILLISEC_TENS|CONT\(3)) # ((\U_MILLISEC_TENS|CONT\(0) & \U_MILLISEC_TENS|CONT\(1))))) # (!\U_MILLISEC_TENS|CONT\(2) & ((\U_MILLISEC_TENS|CONT\(1)) # ((!\U_MILLISEC_TENS|CONT\(3) & 
-- \U_MILLISEC_TENS|CONT\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(3),
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \hundreth_tens_display|Mux1~0_combout\);

-- Location: LCCOMB_X6_Y12_N0
\hundreth_tens_display|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_tens_display|Mux0~0_combout\ = (\U_MILLISEC_TENS|CONT\(2) & (!\U_MILLISEC_TENS|CONT\(3) & ((!\U_MILLISEC_TENS|CONT\(1)) # (!\U_MILLISEC_TENS|CONT\(0))))) # (!\U_MILLISEC_TENS|CONT\(2) & (\U_MILLISEC_TENS|CONT\(3) $ 
-- (((\U_MILLISEC_TENS|CONT\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_TENS|CONT\(3),
	datab => \U_MILLISEC_TENS|CONT\(2),
	datac => \U_MILLISEC_TENS|CONT\(0),
	datad => \U_MILLISEC_TENS|CONT\(1),
	combout => \hundreth_tens_display|Mux0~0_combout\);

-- Location: LCCOMB_X1_Y12_N0
\hundreth_units_display|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_units_display|Mux6~0_combout\ = (\U_MILLISEC_UNITS|CONT\(1) & (((\U_MILLISEC_UNITS|CONT\(3))))) # (!\U_MILLISEC_UNITS|CONT\(1) & (\U_MILLISEC_UNITS|CONT\(2) $ (((\U_MILLISEC_UNITS|CONT\(0) & !\U_MILLISEC_UNITS|CONT\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT\(3),
	combout => \hundreth_units_display|Mux6~0_combout\);

-- Location: LCCOMB_X1_Y12_N2
\hundreth_units_display|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_units_display|Mux5~0_combout\ = (\U_MILLISEC_UNITS|CONT\(2) & ((\U_MILLISEC_UNITS|CONT\(3)) # (\U_MILLISEC_UNITS|CONT\(0) $ (\U_MILLISEC_UNITS|CONT\(1))))) # (!\U_MILLISEC_UNITS|CONT\(2) & (((\U_MILLISEC_UNITS|CONT\(1) & 
-- \U_MILLISEC_UNITS|CONT\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT\(3),
	combout => \hundreth_units_display|Mux5~0_combout\);

-- Location: LCCOMB_X1_Y12_N8
\hundreth_units_display|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_units_display|Mux4~0_combout\ = (\U_MILLISEC_UNITS|CONT\(2) & (((\U_MILLISEC_UNITS|CONT\(3))))) # (!\U_MILLISEC_UNITS|CONT\(2) & (\U_MILLISEC_UNITS|CONT\(1) & ((\U_MILLISEC_UNITS|CONT\(3)) # (!\U_MILLISEC_UNITS|CONT\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT\(3),
	combout => \hundreth_units_display|Mux4~0_combout\);

-- Location: LCCOMB_X1_Y12_N26
\hundreth_units_display|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_units_display|Mux3~0_combout\ = (\U_MILLISEC_UNITS|CONT\(0) & ((\U_MILLISEC_UNITS|CONT\(3)) # (\U_MILLISEC_UNITS|CONT\(1) $ (!\U_MILLISEC_UNITS|CONT\(2))))) # (!\U_MILLISEC_UNITS|CONT\(0) & ((\U_MILLISEC_UNITS|CONT\(1) & 
-- ((\U_MILLISEC_UNITS|CONT\(3)))) # (!\U_MILLISEC_UNITS|CONT\(1) & (\U_MILLISEC_UNITS|CONT\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT\(3),
	combout => \hundreth_units_display|Mux3~0_combout\);

-- Location: LCCOMB_X1_Y12_N4
\hundreth_units_display|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_units_display|Mux2~0_combout\ = (\U_MILLISEC_UNITS|CONT\(0)) # ((\U_MILLISEC_UNITS|CONT\(1) & ((\U_MILLISEC_UNITS|CONT\(3)))) # (!\U_MILLISEC_UNITS|CONT\(1) & (\U_MILLISEC_UNITS|CONT\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT\(3),
	combout => \hundreth_units_display|Mux2~0_combout\);

-- Location: LCCOMB_X1_Y12_N18
\hundreth_units_display|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_units_display|Mux1~0_combout\ = (\U_MILLISEC_UNITS|CONT\(0) & ((\U_MILLISEC_UNITS|CONT\(1)) # (\U_MILLISEC_UNITS|CONT\(2) $ (!\U_MILLISEC_UNITS|CONT\(3))))) # (!\U_MILLISEC_UNITS|CONT\(0) & ((\U_MILLISEC_UNITS|CONT\(2) & 
-- ((\U_MILLISEC_UNITS|CONT\(3)))) # (!\U_MILLISEC_UNITS|CONT\(2) & (\U_MILLISEC_UNITS|CONT\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT\(3),
	combout => \hundreth_units_display|Mux1~0_combout\);

-- Location: LCCOMB_X1_Y12_N24
\hundreth_units_display|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \hundreth_units_display|Mux0~0_combout\ = (\U_MILLISEC_UNITS|CONT\(1) & (!\U_MILLISEC_UNITS|CONT\(3) & ((!\U_MILLISEC_UNITS|CONT\(2)) # (!\U_MILLISEC_UNITS|CONT\(0))))) # (!\U_MILLISEC_UNITS|CONT\(1) & ((\U_MILLISEC_UNITS|CONT\(2) $ 
-- (\U_MILLISEC_UNITS|CONT\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_MILLISEC_UNITS|CONT\(0),
	datab => \U_MILLISEC_UNITS|CONT\(1),
	datac => \U_MILLISEC_UNITS|CONT\(2),
	datad => \U_MILLISEC_UNITS|CONT\(3),
	combout => \hundreth_units_display|Mux0~0_combout\);

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_tens[0]~I\ : cycloneii_io
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
	datain => \tens_display|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_tens(0));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_tens[1]~I\ : cycloneii_io
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
	datain => \tens_display|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_tens(1));

-- Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_tens[2]~I\ : cycloneii_io
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
	datain => \tens_display|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_tens(2));

-- Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_tens[3]~I\ : cycloneii_io
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
	datain => \tens_display|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_tens(3));

-- Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_tens[4]~I\ : cycloneii_io
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
	datain => \tens_display|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_tens(4));

-- Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_tens[5]~I\ : cycloneii_io
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
	datain => \tens_display|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_tens(5));

-- Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_tens[6]~I\ : cycloneii_io
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
	datain => \tens_display|ALT_INV_Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_tens(6));

-- Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_units[0]~I\ : cycloneii_io
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
	padio => ww_disp_units(0));

-- Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_units[1]~I\ : cycloneii_io
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
	padio => ww_disp_units(1));

-- Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_units[2]~I\ : cycloneii_io
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
	padio => ww_disp_units(2));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_units[3]~I\ : cycloneii_io
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
	padio => ww_disp_units(3));

-- Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_units[4]~I\ : cycloneii_io
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
	padio => ww_disp_units(4));

-- Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_units[5]~I\ : cycloneii_io
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
	padio => ww_disp_units(5));

-- Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_units[6]~I\ : cycloneii_io
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
	padio => ww_disp_units(6));

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_tens[0]~I\ : cycloneii_io
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
	datain => \hundreth_tens_display|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_tens(0));

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_tens[1]~I\ : cycloneii_io
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
	datain => \hundreth_tens_display|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_tens(1));

-- Location: PIN_P7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_tens[2]~I\ : cycloneii_io
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
	datain => \hundreth_tens_display|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_tens(2));

-- Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_tens[3]~I\ : cycloneii_io
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
	datain => \hundreth_tens_display|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_tens(3));

-- Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_tens[4]~I\ : cycloneii_io
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
	datain => \hundreth_tens_display|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_tens(4));

-- Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_tens[5]~I\ : cycloneii_io
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
	datain => \hundreth_tens_display|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_tens(5));

-- Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_tens[6]~I\ : cycloneii_io
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
	datain => \hundreth_tens_display|ALT_INV_Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_tens(6));

-- Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_units[0]~I\ : cycloneii_io
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
	datain => \hundreth_units_display|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_units(0));

-- Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_units[1]~I\ : cycloneii_io
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
	datain => \hundreth_units_display|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_units(1));

-- Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_units[2]~I\ : cycloneii_io
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
	datain => \hundreth_units_display|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_units(2));

-- Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_units[3]~I\ : cycloneii_io
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
	datain => \hundreth_units_display|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_units(3));

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_units[4]~I\ : cycloneii_io
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
	datain => \hundreth_units_display|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_units(4));

-- Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_units[5]~I\ : cycloneii_io
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
	datain => \hundreth_units_display|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_units(5));

-- Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\disp_hundreth_units[6]~I\ : cycloneii_io
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
	datain => \hundreth_units_display|ALT_INV_Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_disp_hundreth_units(6));
END structure;



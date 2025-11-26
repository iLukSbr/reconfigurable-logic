library ieee;
use ieee.std_logic_1164.all;

entity sinaleiro is
	port(
		o_seg_un: out std_logic_vector(6 downto 0);
		o_seg_dez: out std_logic_vector(6 downto 0);
		leds_bcd: out std_logic_vector(7 downto 0);
		rst, clk: in std_logic;
		o0_vermelho, o0_amarelo, o0_verde: out std_logic;
		o1_vermelho, o1_amarelo, o1_verde: out std_logic
	);
end entity;

architecture behave of sinaleiro is

	component timer is
		port(
			timer_c1, timer_c2, timer_c3, timer_c4, timer_c5, timer_pisca: out std_logic;
			btn_1, btn_2: in std_logic; --sw0 (n25) e sw1 (n26)
			o_seg_un: out std_logic_vector(6 downto 0);
			o_seg_dez: out std_logic_vector(6 downto 0);
			o_cent_un: out std_logic_vector(6 downto 0);
			o_cent_dez: out std_logic_vector(6 downto 0);
			counter_test0: out std_logic_vector(3 downto 0);
			test, divisor_test: out std_logic; 
			clk, rst, en: in std_logic -- clk > n2 ou v1
			
		);
	end component;

	component semaforo is
		port(
			i_c1, i_c2, i_c3, i_c4, i_c5, i_pisca, rst: in std_logic;
			o0_vermelho, o0_amarelo, o0_verde: out std_logic;
			o1_vermelho, o1_amarelo, o1_verde: out std_logic
		);
	end component;

	signal c1, c2, c3,c4,c5: std_logic := '0';
	signal pisca: std_logic:= '0';
	signal ground: std_logic:= '0';
	signal ground_4: std_logic_vector(3 downto 0) := "0000";
	signal ground_7: std_logic_vector(6 downto 0):= "0000000";

begin
	--port map do btn_controller
	timer_45: timer
		port map(
		timer_c1 => c1, 
		timer_c2 => c2, 
		timer_c3 => c3, 
		timer_c4 => c4, 
		timer_c5 => c5, 
		timer_pisca=> pisca,
		btn_1 =>ground, 
		btn_2 =>ground,
		o_seg_un =>o_seg_un,
		o_seg_dez =>o_seg_dez,
		o_cent_un =>ground_7,
		o_cent_dez =>ground_7,
		counter_test0 => ground_4,
		test => ground, 
		divisor_test =>ground,
		clk => clk, 
		rst => rst, 
		en => ground
		);
	
	sem: semaforo
	port map(
		i_c1=> c1, 
		i_c2=> c2,
		i_c3=> c3,
		i_c4=> c4,
		i_c5=> c5,
		i_pisca=> pisca,
		rst=> rst,
		o0_vermelho => o0_vermelho,
		o0_amarelo => o0_amarelo,
		o0_verde => o0_verde,
		o1_vermelho => o1_vermelho, 
		o1_amarelo => o1_amarelo,
		o1_verde => o1_verde
	);
	process(clk)
	begin
	leds_bcd <= "11111111"; -- apaga outros leds
	end process;
end architecture;

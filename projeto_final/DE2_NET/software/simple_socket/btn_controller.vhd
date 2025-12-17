library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity btn_controller is
	port(
		clk, rst: in std_logic;
		btn_1, btn_2: in std_logic;
		en_count, rst_count: out std_logic
		
		--btn_1 é a entrada física do botão 1
		--btn_2 é a entrada física do botão 2 
		
		--en_count -> permite a contagem, ligado no enable do timer
		--rst_count -> lógica do botão2, ligado ao reset do timer
	);
end entity;

architecture behave of btn_controller is
 
 --debounce botão 1 
	signal count_1_up: integer range 0 to 500000;
	signal count_1_down: integer range 0 to 500000;
	
 --debounce botão 2
	signal count_2_up: integer range 0 to 500000:=0;
	signal count_2_down: integer range 0 to 500000:=0;
	
	signal is_counting: std_logic:='0';
	
	signal btn_1_debounced: std_logic:='0';
	signal btn_2_debounced: std_logic:='0';
	
	begin
	process (clk)
	begin
	--Começo lógica --> btn pressionado é '0'
	if (clk='1' and clk'event) then
		rst_count <= '0';
		
		en_count <= '1';
		
				---FIM LÓGICA DO BOUNCE
	end if; -- if clock
	--fim lógica
	end process;
end architecture;
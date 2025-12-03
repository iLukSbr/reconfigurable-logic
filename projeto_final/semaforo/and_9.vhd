library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity and_9 is

port(	
		 input: in std_logic_vector (3 downto 0);
		 and_en: in std_logic;
		 and_9: out std_logic
		 );
		 
End entity;

Architecture x of	and_9 is

--SIGNAL LEDAUX: std_logic;
--SIGNAL CONT: integer range 0 to 500000;

begin
process (input, and_en)
	begin
		if input = "1001" and and_en = '1' then
			and_9 <= '1';
		else
			and_9 <= '0';
		end if;
	
end process;
end architecture;
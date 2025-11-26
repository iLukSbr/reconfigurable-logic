library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity and_5 is

port(
		 input: in std_logic_vector (3 downto 0);
		 and_en: in std_logic;
		 and_5: out std_logic
		 );
		 
End entity;

Architecture x of and_5 is

begin
process (input)
	begin

		if input = "0101" and and_en = '1' then
			and_5 <= '1';
		else
			and_5 <= '0';
		end if;
	
end process;
end architecture;


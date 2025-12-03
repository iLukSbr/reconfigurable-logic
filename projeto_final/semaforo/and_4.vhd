library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity and_4 is

port(
		 input: in std_logic_vector (3 downto 0);
		 and_en: in std_logic;
		 and_4: out std_logic
		 );
		 
End entity;

Architecture x of and_4 is

begin
process (input)
	begin

		if input = "0100" and and_en = '1' then
			and_4 <= '1';
		else
			and_4 <= '0';
		end if;
	
end process;
end architecture;


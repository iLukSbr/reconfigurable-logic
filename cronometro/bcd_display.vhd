library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_display is
    port(
        bcd : in unsigned(3 downto 0);
        seg : out std_logic_vector(6 downto 0)
    );
end bcd_display;

architecture bcd_display_arch of bcd_display is
begin
    with bcd select
        seg <= "1000000" when "0000", -- 0
					"1111001" when "0001", -- 1
					"0100100" when "0010", -- 2
					"0110000" when "0011", -- 3
					"0011001" when "0100", -- 4
					"0010010" when "0101", -- 5
					"0000010" when "0110", -- 6
					"1111000" when "0111", -- 7
					"0000000" when "1000", -- 8
					"0011000" when "1001", -- 9
               "1111111" when others;
end bcd_display_arch;

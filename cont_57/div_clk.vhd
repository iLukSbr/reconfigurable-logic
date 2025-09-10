library ieee;
use ieee.std_logic_1164.all;

entity div_clk is
    generic (
        CRYSTAL_FREQ_HZ : integer := 50_000_000;
        OUTPUT_FREQ_HZ  : integer := 1
    );
    port (
        clk_in  : in  std_logic;
        clk_out : out std_logic
    );
end div_clk;

architecture div_clk_arch of div_clk is
    constant DIVIDER : integer := CRYSTAL_FREQ_HZ / (2 * OUTPUT_FREQ_HZ);
    signal temp : std_logic := '0';
begin
    P_div: process (clk_in)
        variable count : integer range 0 to DIVIDER := 0;
    begin
        if rising_edge(clk_in) then
            count := count + 1;
            if count = DIVIDER then
                temp <= not temp;
                count := 0;
            end if;
        end if;
    end process P_div;

    clk_out <= temp;
end div_clk_arch;

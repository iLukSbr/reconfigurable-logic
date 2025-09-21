library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont_up_mod16 is
    port(
        clk, en, load : in  std_logic;
        data_in       : in  unsigned(3 downto 0);
        q             : out unsigned(3 downto 0);
        co            : out std_logic
    );
end cont_up_mod16;

architecture cont_up_mod16_arch of cont_up_mod16 is
    signal count_sig : unsigned(3 downto 0) := (others => '0');
begin
    process(clk, count_sig)
    begin
        if rising_edge(clk) then
            if load = '1' then
                count_sig <= data_in;
            elsif en = '1' then
                if count_sig = to_unsigned(15, 4) then
                    count_sig <= (others => '0');
                else
                    count_sig <= count_sig + 1;
                end if;
            end if;
        end if;
        q <= count_sig;
    end process;

    -- Carry: ativo quando o contador volta de 15 para 0
    co <= '1' when (count_sig = to_unsigned(15, 4) and en = '1') else '0';
end cont_up_mod16_arch;

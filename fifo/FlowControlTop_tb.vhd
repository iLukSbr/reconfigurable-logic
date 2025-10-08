library ieee;
use ieee.std_logic_1164.all;

entity FlowControlTop_tb is
end entity FlowControlTop_tb;

architecture tb of FlowControlTop_tb is
    constant c_clk_period : time := 20 ns; -- Período do clock

    signal clk   : std_logic := '0'; -- Sinal de clock
    signal reset : std_logic := '1'; -- Sinal de reset
    signal done  : std_logic := '0'; -- Sinal de conclusão

begin
    clk <= not clk after c_clk_period / 2;

    uut : entity work.FlowControlTop
        port map (
            clk   => clk,
            reset => reset,
            done  => done
        );

    stimulus : process
    begin
        reset <= '1';
        wait for 10 * c_clk_period;
        reset <= '0';

        wait until done = '1';
        wait for 5 * c_clk_period;
        assert false report "FlowControlTop completed transfer" severity note;
        wait;
    end process;

end architecture tb;

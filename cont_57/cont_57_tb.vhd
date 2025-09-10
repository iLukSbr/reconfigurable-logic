library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont_57_tb is
end entity;

architecture tb_arch of cont_57_tb is
    signal rst, clr, ld, en : std_logic := '0';
    signal clk_50m : std_logic := '0';
    signal disp_tens, disp_un : std_logic_vector(6 downto 0);
begin
    -- Clock
    clock_process: process
    begin
        while now < 10 sec loop
            clk_50m <= '0';
            wait for 10 ns;
            clk_50m <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process;

    -- Reset
    reset_process: process
    begin
        rst <= '1';
        wait for 15 ns;
        rst <= '0';
        wait;
    end process;

    -- Enable
    enable_process: process
    begin
        en <= '1';
        wait;
    end process;

    -- Estímulo para clr e ld
    stimulus_process: process
    begin
        clr <= '0';
        ld  <= '0';
        wait for 100 ns;
        clr <= '1';
        wait for 20 ns;
        clr <= '0';
        wait for 100 ns;
        ld  <= '1';
        wait for 20 ns;
        ld  <= '0';
        wait;
    end process;

    -- Device Under Test (DUT)
    DUT: entity work.cont_57
        port map (
            clk_50m   => clk_50m,
            rst       => rst,
            clr       => clr,
            en        => en,
            ld        => ld,
            disp_tens => disp_tens,
            disp_un   => disp_un
        );

    -- Parar simulação
    stop_sim : process
    begin
        wait for 10 sec;
        assert false report "Fim da simulação (10 segundos)" severity failure;
    end process;

end architecture;

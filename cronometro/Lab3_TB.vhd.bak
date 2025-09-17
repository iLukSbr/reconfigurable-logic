library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Lab3_TB is
end entity;

architecture sim of Lab3_TB is
    signal RST : std_logic := '0';
    signal CLK : std_logic := '0';
    signal EN  : std_logic := '0';
    signal CLR : std_logic := '0';
    button_1, button_2 : std_logic := '0';
    Q_SEC      : unsigned(7 downto 0);
    Q_MILLISEC : unsigned(7 downto 0);
    disp_tens, disp_units, disp_hundreth_tens, disp_hundreth_units : std_logic_vector(6 downto 0);

    component Cont4_mod10
        port(
            RST  : in std_logic;
            CLK  : in std_logic;
            EN   : in std_logic;
            CLR  : in std_logic;
            Q    : out unsigned(3 downto 0);
            COUT : out std_logic
        );
    end component;

begin
    UUT: Lab3
        port map (
            RST => RST,
            CLK => CLK,
            EN  => EN,
            CLR => CLR,
            button_1 => button_1,
            button_2 => button_2,
            Q_SEC => Q_SEC,
            Q_MILLISEC => Q_MILLISEC,
            disp_tens => disp_tens,
            disp_units => disp_units,
            disp_hundreth_tens => disp_hundreth_tens,
            disp_hundreth_units => disp_hundreth_units
        );

    -------------------------------------------------------------------------------
    -- Geração do clock 50 MHz: começa em '0', período 20 ns (10 ns baixo + 10 ns alto)
    -------------------------------------------------------------------------------
    clk_gen: process
    begin
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
    end process;

    -------------------------------------------------------------------------------
    -- RST: nível alto de 0 a 5 ns
    -------------------------------------------------------------------------------
    rst_gen: process
    begin
        RST <= '1';
        wait for 5 ns;
        RST <= '0';
        wait;
    end process;

    -------------------------------------------------------------------------------
    -- EN: alto de 0 a 5 s, baixo no restante
    -------------------------------------------------------------------------------
    en_gen: process
    begin
        EN <= '1';
        wait for 5 sec;
        EN <= '0';
        wait;
    end process;

    -------------------------------------------------------------------------------
    -- CLR: alto de 75 a 95 ns
    -------------------------------------------------------------------------------
    clr_gen: process
    begin
        CLR <= '0';
        wait for 75 ns;
        CLR <= '1';
        wait for 20 ns;
        CLR <= '0';
        wait;
    end process;

end architecture;

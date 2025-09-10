library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Lab3 is
    port(
        RST  : in std_logic;
        CLK  : in std_logic;
        EN   : in std_logic;
        CLR  : in std_logic;
        button_1, button_2 : in std_logic;
        Q_SEC      : out unsigned(7 downto 0);
        Q_MILLISEC : out unsigned(7 downto 0);
        disp_tens, disp_units, disp_hundreth_tens, disp_hundreth_units : out std_logic_vector(6 downto 0)
    );
end entity;

architecture X of Lab3 is
    signal q_sec_units, q_sec_tens, q_millisec_units, q_millisec_tens : unsigned(3 downto 0) := (others => '0');
    signal clk_millisec_counter, clk_button_1_counter, clk_button_2_counter : unsigned(25 downto 0) := (others => '0');
    signal en_millisec_tens, en_millisec_units, en_sec_units, en_sec_tens, en_button_1, en_button_2 : std_logic := '0';
    signal button_1_inv, button_2_inv, paused : std_logic := '0';
    signal cout_millisec_units, cout_millisec_tens, cout_sec_units : std_logic := '0';

    -- BCD to 7-segment display
    component bcd_display is
        port(
            bcd : in unsigned(3 downto 0);
            seg : out std_logic_vector(6 downto 0)
        );
    end component;

    begin

    button_1_inv <= not button_1;
    button_2_inv <= not button_2;
    en_millisec_tens <= EN and cout_millisec_units;
    en_sec_units <= EN and cout_millisec_tens;
    en_sec_tens <= EN and cout_sec_units;

    U_MILLISEC_UNITS: entity work.Cont4_mod10
    port map(
        RST  => RST,
        CLK  => CLK,
        EN   => en_millisec_units,
        CLR  => CLR,
        Q    => q_millisec_units,
        COUT => cout_millisec_units
    );
        
    U_MILLISEC_TENS: entity work.Cont4_mod10
    port map(
        RST  => RST,
        CLK  => CLK,
        EN   => en_millisec_tens,
        CLR  => CLR,
        Q    => q_millisec_tens,
        COUT => cout_millisec_tens
    );
        
    U_SEC_UNITS: entity work.Cont4_mod10
    port map(
        RST  => RST,
        CLK  => CLK,
        EN   => en_sec_units,
        CLR  => CLR,
        Q    => q_sec_units,
        COUT => cout_sec_units
    );
        
    U_SEC_TENS: entity work.Cont4_mod10
    port map(
        RST  => RST,
        CLK  => CLK,
        EN   => en_sec_tens,
        CLR  => CLR,
        Q    => q_sec_tens,
        COUT => open
    );

    -- Processo principal
    process(CLK, RST)
    begin
        if RST = '1' then
            q_sec_units <= (others => '0');
            q_sec_tens <= (others => '0');
            q_millisec_units <= (others => '0');
            q_millisec_tens <= (others => '0');

        elsif rising_edge(CLK) then
            clk_millisec_counter <= clk_millisec_counter + 1;
            if clk_millisec_counter = "101111101011110000100000" then -- 10 ms
                clk_millisec_counter <= (others => '0');
                en_millisec_units <= not paused or EN;
            end if;

            if button_1_inv = '1' then
                clk_button_1_counter <= clk_button_1_counter + 1;
            else
                clk_button_1_counter <= (others => '0');
            end if;
            if clk_button_1_counter = "1011011100011011000000" then -- 30 ms
                clk_button_1_counter <= (others => '0');
                if button_1_inv = '1' then
                    en_button_1 <= '1';
                    paused <= not paused;
                end if;
            elsif button_1_inv = '0' then
                en_button_1 <= '0';
            end if;

            if button_2_inv = '1' then
                clk_button_2_counter <= clk_button_2_counter + 1;
            else
                clk_button_2_counter <= (others => '0');
            end if;
            if clk_button_2_counter = "1011011100011011000000" then -- 30 ms
                clk_button_2_counter <= (others => '0');
                if button_2_inv = '1' then
                    en_button_2 <= '1';
                end if;
            elsif button_2_inv = '0' then
                en_button_2 <= '0';
            end if;

            if CLR = '1' and button_2_inv = '1' and en_button_2 = '1' and paused = '1' then
                q_sec_units <= (others => '0');
                q_sec_tens <= (others => '0');
                q_millisec_units <= (others => '0');
                q_millisec_tens <= (others => '0');

            elsif EN = '1' then
                --Reseta quando tiver '6' na dezena dos segundos
                if (q_sec_tens = "0110") then
                    q_sec_units <= (others => '0');
                    q_sec_tens <= (others => '0');
                    q_millisec_units <= (others => '0');
                    q_millisec_tens <= (others => '0');
                end if;
            end if;
        end if;
    end process;

    -- Saída combinacional
    Q_SEC <= to_unsigned(to_integer(q_sec_tens) * 10 + to_integer(q_sec_units), 8);
    Q_MILLISEC <= to_unsigned(to_integer(q_millisec_tens) * 10 + to_integer(q_millisec_units), 8);

    -- Saída displays
    tens_display: bcd_display port map(bcd => q_sec_tens, seg => disp_tens);
    units_display: bcd_display port map(bcd => q_sec_units, seg => disp_units);
    hundreth_tens_display: bcd_display port map(bcd => q_millisec_tens, seg => disp_hundreth_tens);
    hundreth_units_display: bcd_display port map(bcd => q_millisec_units, seg => disp_hundreth_units);

end architecture;

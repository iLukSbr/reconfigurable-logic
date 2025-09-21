library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- EP2C35F672C6

entity Lab3 is
    port(
--        RST  : in std_logic;
        CLK  : in std_logic;
--        EN   : in std_logic;
--        CLR  : in std_logic;
        button_1, button_2 : in std_logic;
--        Q_SEC      : out unsigned(7 downto 0);
--        Q_HUNDRETHS : out unsigned(7 downto 0);
        disp_tens, disp_units, disp_hundreth_tens, disp_hundreth_units : out std_logic_vector(6 downto 0)
    );
end entity;

architecture X of Lab3 is
    signal q_sec_units, q_sec_tens, q_hundreths_units, q_hundreths_tens : unsigned(3 downto 0) := (others => '0');
    signal clk_hundreths_counter, clk_button_1_counter, clk_button_2_counter : unsigned(25 downto 0) := (others => '0');
    signal en_hundreths_tens, en_hundreths_units, en_sec_units, en_sec_tens : std_logic := '0';
    signal button_1_inv, button_2_inv, clr_sig, rst_sig : std_logic := '0';
    signal en_sig : std_logic := '1';
    signal cout_hundreths_units, cout_hundreths_tens, cout_sec_units : std_logic := '0';
    signal internal_clear : std_logic := '0';

    -- BCD to 7-segment display
    component bcd_display is
        port(
            bcd : in unsigned(3 downto 0);
            seg : out std_logic_vector(6 downto 0)
        );
    end component;
	 
	 component Cont4_mod10 is
		 PORT(RST  : in std_logic;
				CLK  : in std_logic;
				EN   : in std_logic;
				CLR  : in std_logic;
				Q    : out unsigned(3 downto 0);
				COUT : out std_logic
		 );
	 end component;

    begin

	 internal_clear <= '1' when (q_sec_tens = "0110") or (clr_sig = '1') else '0';
	 
    button_1_inv <= not button_1;
    button_2_inv <= not button_2;
    en_hundreths_tens <= en_sig and cout_hundreths_units;
    en_sec_units <= en_sig and cout_hundreths_tens;
    en_sec_tens <= en_sig and cout_sec_units;

    U_HUNDRETHS_UNITS: entity work.Cont4_mod10
    port map(
        RST  => rst_sig,
        CLK  => CLK,
        EN   => en_hundreths_units,
        CLR  => internal_clear,
        Q    => q_hundreths_units,
        COUT => cout_hundreths_units
    );
        
    U_HUNDRETHS_TENS: entity work.Cont4_mod10
    port map(
        RST  => rst_sig,
        CLK  => CLK,
        EN   => en_hundreths_tens,
        CLR  => internal_clear,
        Q    => q_hundreths_tens,
        COUT => cout_hundreths_tens
    );
        
    U_SEC_UNITS: entity work.Cont4_mod10
    port map(
        RST  => rst_sig,
        CLK  => CLK,
        EN   => en_sec_units,
        CLR  => internal_clear,
        Q    => q_sec_units,
        COUT => cout_sec_units
    );
        
    U_SEC_TENS: entity work.Cont4_mod10
    port map(
        RST  => rst_sig,
        CLK  => CLK,
        EN   => en_sec_tens,
        CLR  => internal_clear,
        Q    => q_sec_tens,
        COUT => open
    );

    -- Processo principal
    process(CLK, rst_sig)
    begin
        if rst_sig = '1' then
--            q_sec_units <= (others => '0');
--            q_sec_tens <= (others => '0');
--            q_hundreths_units <= (others => '0');
--            q_hundreths_tens <= (others => '0');
--
				  clk_hundreths_counter <= (others => '0');
				  clk_button_1_counter <= (others => '0');
				  clk_button_2_counter <= (others => '0');
				  en_sig <= '0';
				  en_hundreths_units <= '0';
				  
        elsif rising_edge(CLK) then
            if clk_hundreths_counter >= "00000001111010000100100000" then -- 10 ms
                clk_hundreths_counter <= (others => '0');
                en_hundreths_units <= en_sig;
				else
					 clk_hundreths_counter <= clk_hundreths_counter + 1;
					 en_hundreths_units <= '0';
            end if;

            if button_1_inv = '1' then
					 if clk_button_1_counter >= "1011011100011011000000" then -- 30 ms
						  clk_button_1_counter <= (others => '0');
						  en_sig <= not en_sig;
					 end if;
                clk_button_1_counter <= clk_button_1_counter + 1;
            else
                clk_button_1_counter <= (others => '0');
            end if;
				
            if button_2_inv = '1' and en_sig = '0' then
                clk_button_2_counter <= clk_button_2_counter + 1;
					 if clk_button_2_counter = "1011011100011011000000" then -- 30 ms
						  clk_button_2_counter <= (others => '0');
						  clr_sig <= '1';
					 end if;
            else
                clk_button_2_counter <= (others => '0');
					 clr_sig <= '0';
            end if;
				
--
--            if CLR = '1' and clr_sig = '1' and en_sig = '0' then
--                q_sec_units <= (others => '0');
--                q_sec_tens <= (others => '0');
--                q_hundreths_units <= (others => '0');
--                q_hundreths_tens <= (others => '0');
--
--            elsif EN = '1' then
--                --Reseta quando tiver '6' na dezena dos segundos
--                if (q_sec_tens = "0110") then
--                    q_sec_units <= (others => '0');
--                    q_sec_tens <= (others => '0');
--                    q_hundreths_units <= (others => '0');
--                    q_hundreths_tens <= (others => '0');
--                end if;
--            end if;
        end if;
    end process;

    -- Saída combinacional
    --Q_SEC <= to_unsigned(to_integer(q_sec_tens) * 10 + to_integer(q_sec_units), 8);
    --Q_HUNDRETHS <= to_unsigned(to_integer(q_hundreths_tens) * 10 + to_integer(q_hundreths_units), 8);

    -- Saída displays
    tens_display: bcd_display port map(bcd => q_sec_tens, seg => disp_tens);
    units_display: bcd_display port map(bcd => q_sec_units, seg => disp_units);
    hundreth_tens_display: bcd_display port map(bcd => q_hundreths_tens, seg => disp_hundreth_tens);
    hundreth_units_display: bcd_display port map(bcd => q_hundreths_units, seg => disp_hundreth_units);

end architecture;

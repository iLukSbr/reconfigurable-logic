library ieee;
use ieee.std_logic_1164.all;


entity cont_57 is
    port(
        clk_50m, rst, clr, en, ld : in  std_logic;
        disp_ten, disp_un         : out std_logic_vector(6 downto 0)
    );
end cont_57;

architecture cont_57_arch of cont_57 is
    signal clk_1s, clk_50m_signal: std_logic;
    signal ten, un: std_logic_vector(3 downto 0);
    signal carry_units: std_logic;
    signal reset_or_clear: std_logic;
    signal load_ten, load_units: std_logic;
    signal data_ten, data_units: std_logic_vector(3 downto 0);
    signal reached_68: std_logic;

    -- Clock divider component
    component div_clk is
        generic(CRYSTAL_FREQ_HZ : integer := 50000000;
                OUTPUT_FREQ_HZ  : integer := 1);
        port(
            clk_in  : in  std_logic;
            clk_out : out std_logic
        );
    end component;

    -- BCD up counter (0-9)
    component cont_up_mod16 is
        port(
            clk, z, en, load : in  std_logic;
            data_in          : in  std_logic_vector(3 downto 0);
            q                : out std_logic_vector(3 downto 0);
            co               : out std_logic
        );
    end component;

    -- BCD to 7-segment display
    component bcd_display is
        port(
            bcd : in std_logic_vector(3 downto 0);
            seg : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    clk_50m_signal <= clk_50m;
    reset_or_clear <= rst or clr;

    -- Clock divider for 1 Hz
    clk_div_1s: div_clk generic map(
        CRYSTAL_FREQ_HZ => 50000000, -- 50 MHz
        OUTPUT_FREQ_HZ  => 1         -- 1 Hz
    )
    port map(clk_in => clk_50m_signal, clk_out => clk_1s);

    -- Load logic
    -- Initialize at 12 (ten=1, un=2)
    data_ten <= "0001"; -- 1
    data_units  <= "0010"; -- 2

    -- Load signal: when reaches 68 or reset/clear/ld
    reached_68 <= '1' when (ten = "0110" and un = "1000") else '0';
    load_units  <= reached_68 or reset_or_clear or ld;
    load_ten   <= reached_68 or reset_or_clear or ld;

    -- Units counter (0-9)
    units_counter: cont_up_mod16 port map(
        clk => clk_1s,
        z => '0',
        en => en,
        load => load_units,
        data_in => data_units,
        q => un,
        co => carry_units
    );

    -- ten counter (1-6)
    ten_counter: cont_up_mod16 port map(
        clk => carry_units,
        z => '0',
        en => en,
        load => load_ten,
        data_in => data_ten,
        q => ten,
        co => open
    );

    ten_display: bcd_display port map(bcd => ten, seg => disp_ten);
    units_display:  bcd_display port map(bcd => un,  seg => disp_un);

end cont_57_arch;

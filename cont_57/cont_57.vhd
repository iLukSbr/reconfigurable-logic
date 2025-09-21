library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- EP2C35F672C6

entity cont_57 is
    port(
        clk_50m, rst, clr, en, ld : in  std_logic;
        disp_ten, disp_un         : out std_logic_vector(6 downto 0);
        clk_divided_out, carry_units_out, load_ten_out, load_units_out : out std_logic;
        tens_out, uns_out : out unsigned(3 downto 0)
    );
end cont_57;

architecture cont_57_arch of cont_57 is
    signal clk_divided, clk_50m_signal: std_logic := '0';
    signal carry_units: std_logic := '0';
    signal reset_or_clear: std_logic := '0';
    signal load_ten, load_units: std_logic := '0';
    signal data_tens, data_units: unsigned(3 downto 0) := (others => '0'); -- valor de carga
    signal tens, uns: unsigned(3 downto 0) := (others => '0'); -- valor atual dos contadores (mod16)
    signal reached_68: std_logic := '0';

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
            clk, en, load : in  std_logic;
            data_in       : in unsigned(3 downto 0);
            q             : out unsigned(3 downto 0);
            co            : out std_logic
        );
    end component;

    -- BCD to 7-segment display
    component bcd_display is
        port(
            bcd : in unsigned(3 downto 0);
            seg : out std_logic_vector(6 downto 0)
        );
    end component;

begin
    clk_50m_signal <= clk_50m;
    reset_or_clear <= rst or clr;

    -- Clock divider for 1 Hz
    clk_div_1s: div_clk generic map(
        CRYSTAL_FREQ_HZ => 50000000, -- 50 MHz
        OUTPUT_FREQ_HZ  => 10000000  -- 10 MHz
    )
    port map(clk_in => clk_50m_signal, clk_out => clk_divided);

    -- Valores de carga inicial (apenas uma vez)
    data_tens <= to_unsigned(1, 4); -- 1
    data_units <= to_unsigned(2, 4); -- 2

    -- Sinal para recarregar quando chega em 68 ou reset/clear/ld
    reached_68 <= '1' when (tens = to_unsigned(6, 4) and uns = to_unsigned(8, 4)) else '0';
    load_units <= reached_68 or reset_or_clear or ld;
    load_ten   <= reached_68 or reset_or_clear or ld;

    -- Contador das unidades (0-15)
    units_counter: entity work.cont_up_mod16 port map(
        clk => clk_divided,
        en => en,
        load => load_units,
        data_in => data_units,
        q => uns,
        co => carry_units
    );

    -- Contador das dezenas (0-15)
    ten_counter: entity work.cont_up_mod16 port map(
        clk => clk_divided,
        en => carry_units,
        load => load_ten,
        data_in => data_tens,
        q => tens,
        co => open
    );

    ten_display: bcd_display port map(bcd => tens, seg => disp_ten);
    units_display:  bcd_display port map(bcd => uns,  seg => disp_un);

    -- Conexão dos sinais internos às saídas para visualização
    clk_divided_out <= clk_divided;
    carry_units_out <= carry_units;
    load_ten_out <= load_ten;
    load_units_out <= load_units;
    -- Saídas: valor hexadecimal dos contadores internos
    tens_out <= tens;
    uns_out  <= uns;

end cont_57_arch;

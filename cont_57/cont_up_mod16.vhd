library ieee;
use ieee.std_logic_1164.all;

entity cont_up_mod16 is
    port(
        clk, z, en, load : in  std_logic;
        data_in          : in  std_logic_vector(3 downto 0);
        q                : out std_logic_vector(3 downto 0);
        co               : out std_logic
    );
end cont_up_mod16;

architecture cont_up_mod16_arch of cont_up_mod16 is
    signal zn, clkn, rst, rst1, rst2, f, q_reset_extend, qn_reset_extend: std_logic;
    signal qn, q_signal: std_logic_vector(3 downto 0);
    signal clk_gated: std_logic;
    signal d_in: std_logic_vector(3 downto 0);

    component dff_vhdl is
        port (
            d, clk, prs, clr : in  std_logic;
            q, qn            : out std_logic
        );
    end component;
    
begin
    clk_gated <= clk and en;
    
    d_in(0) <= data_in(0) when load = '1' else qn(0);
    d_in(1) <= data_in(1) when load = '1' else qn(1);
    d_in(2) <= data_in(2) when load = '1' else qn(2);
    d_in(3) <= data_in(3) when load = '1' else qn(3);

    ff_d0: dff_vhdl port map(d => d_in(0), prs => '0', clr => rst1, clk => clk_gated, q => q_signal(0), qn => qn(0));
    ff_d1: dff_vhdl port map(d => d_in(1), prs => '0', clr => rst2, clk => q_signal(0), q => q_signal(1), qn => qn(1));
    ff_d2: dff_vhdl port map(d => d_in(2), prs => '0', clr => rst2, clk => q_signal(1), q => q_signal(2), qn => qn(2));
    ff_d3: dff_vhdl port map(d => d_in(3), prs => '0', clr => rst1, clk => q_signal(2), q => q_signal(3), qn => qn(3));
    ff_reset_extend: dff_vhdl port map(d => '0', prs => f, clr => clkn, clk => '0', q => q_reset_extend, qn => qn_reset_extend);
    
    zn <= not z;
    clkn <= not clk;
    f <= q_signal(0) and q_signal(1) and q_signal(2) and q_signal(3);
    rst <= f;
    rst1 <= zn or q_reset_extend;
    rst2 <= rst1 or rst;
    co <= rst2;
    q <= q_signal;
end cont_up_mod16_arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library altera_mf;
use altera_mf.all;

entity bram_origem_tb is
end entity bram_origem_tb;

architecture tb of bram_origem_tb is
    constant c_clk_period : time := 20 ns; -- Período do clock

    signal clk     : std_logic := '0';                                 -- Clock da BRAM de origem
    signal address : std_logic_vector(10 downto 0) := (others => '0'); -- Endereço da BRAM de origem
    signal data_in : std_logic_vector(7 downto 0) := (others => '0');  -- Dado a ser escrito na BRAM de origem
    signal wren    : std_logic := '0';                                 -- Write enable para a BRAM de origem
    signal data_out: std_logic_vector(7 downto 0);                     -- Dado lido da BRAM de origem

    type data_array is array (natural range <>) of integer; -- Array de dados para teste
    constant c_test_values : data_array := (
        16#12#, 16#34#, 16#56#, 16#78#,
        16#9a#, 16#bc#, 16#de#, 16#f0#
    ); -- Valores de teste

    signal read_value : std_logic_vector(7 downto 0); -- Dado lido da BRAM de origem

begin
    clk <= not clk after c_clk_period / 2;

    uut : entity work.BRAM_Origem
        port map (
            address => address,
            clock   => clk,
            data    => data_in,
            wren    => wren,
            q       => data_out
        );

    stimulus : process
    begin
        wait for 2 * c_clk_period;

        -- Escreve um padrão de teste na BRAM de origem
        for idx in 0 to c_test_values'length - 1 loop
            address <= std_logic_vector(to_unsigned(idx, address'length));
            data_in <= std_logic_vector(to_unsigned(c_test_values(idx), data_in'length));
            wren    <= '1';
            wait for c_clk_period;
        end loop;
        wren <= '0';
        wait for c_clk_period;

        -- Lê os dados de volta compensando a latência de um ciclo
        for idx in 0 to c_test_values'length - 1 loop
            address <= std_logic_vector(to_unsigned(idx, address'length));
            wait for c_clk_period; -- latência da saída registrada
            read_value <= data_out;
            wait for 1 ps; -- garante que o sinal atualize
            assert unsigned(data_out) = to_unsigned(c_test_values(idx), data_out'length)
                report "BRAM_Origem: dado divergente no endereço " & integer'image(idx)
                    & ": esperado " & integer'image(c_test_values(idx))
                    & ", obtido " & integer'image(to_integer(unsigned(data_out)))
                severity error;
        end loop;

        assert false report "Testbench da BRAM_Origem finalizado com sucesso" severity note;
        wait;
    end process;

end architecture tb;

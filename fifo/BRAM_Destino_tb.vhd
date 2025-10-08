library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library altera_mf;
use altera_mf.all;

entity bram_destino_tb is
end entity bram_destino_tb;

architecture tb of bram_destino_tb is
    constant c_clk_period : time := 20 ns; -- Período do clock

    signal clk     : std_logic := '0';                                 -- Clock da BRAM de destino
    signal address : std_logic_vector(10 downto 0) := (others => '0'); -- Endereço da BRAM de destino
    signal data_in : std_logic_vector(7 downto 0) := (others => '0');  -- Dado a ser escrito na BRAM de destino
    signal wren    : std_logic := '0';                                 -- Write enable para a BRAM de destino
    signal data_out: std_logic_vector(7 downto 0);                     -- Dado lido da BRAM de destino

    type data_array is array (natural range <>) of integer; -- Array de dados para teste
    constant c_test_values : data_array := (
        16#01#, 16#23#, 16#45#, 16#67#,
        16#89#, 16#ab#, 16#cd#, 16#ef#
    ); -- Valores de teste

begin
    clk <= not clk after c_clk_period / 2;

    uut : entity work.BRAM_Destino
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

        -- Escreve um padrão de teste na BRAM de destino
        for idx in 0 to c_test_values'length - 1 loop
            address <= std_logic_vector(to_unsigned(idx, address'length));
            data_in <= std_logic_vector(to_unsigned(c_test_values(idx), data_in'length));
            wren    <= '1';
            wait for c_clk_period;
        end loop;
        wren <= '0';
        wait for c_clk_period;

        -- Lê a sequência gravada para conferência.
        -- A BRAM gerada possui endereço e saída registrados, impondo uma latência de
        -- dois ciclos entre a aplicação do endereço e a disponibilização do dado.
        -- Por isso aguardamos dois períodos de clock antes de validar cada leitura.
        for idx in 0 to c_test_values'length - 1 loop
            address <= std_logic_vector(to_unsigned(idx, address'length));
            wait for c_clk_period;
            wait for c_clk_period; -- Compensa a latência de leitura registrada
            assert unsigned(data_out) = to_unsigned(c_test_values(idx), data_out'length)
                report "BRAM_Destino: dado divergente no endereço " & integer'image(idx)
                    & ": esperado " & integer'image(c_test_values(idx))
                    & ", obtido " & integer'image(to_integer(unsigned(data_out)))
                severity error;
        end loop;

        assert false report "Testbench da BRAM_Destino finalizado com sucesso" severity note;
        wait;
    end process;

end architecture tb;

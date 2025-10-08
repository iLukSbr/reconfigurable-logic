library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library altera_mf;
use altera_mf.all;

entity fifo_tb is
end entity fifo_tb;

architecture tb of fifo_tb is
    constant c_clk_period : time := 20 ns; -- Período do clock

    signal clk          : std_logic := '0';                                -- Sinal de clock
    signal data_in      : std_logic_vector(7 downto 0) := (others => '0'); -- Dados de entrada
    signal rdreq        : std_logic := '0';                                -- Sinal de requisição de leitura
    signal wrreq        : std_logic := '0';                                -- Sinal de requisição de escrita
    signal almost_empty : std_logic;                                       -- Sinal de quase vazio
    signal almost_full  : std_logic;                                       -- Sinal de quase cheio
    signal empty        : std_logic;                                       -- Sinal de vazio
    signal full         : std_logic;                                       -- Sinal de cheio
    signal data_out     : std_logic_vector(7 downto 0);                    -- Dados de saída
    signal usedw        : std_logic_vector(9 downto 0);                    -- Contador de palavras usadas

    type int_array is array (natural range <>) of integer; -- Array de inteiros
    constant c_test_values : int_array := (
        16#00#, 16#11#, 16#22#, 16#33#, 16#44#,
        16#55#, 16#66#, 16#77#, 16#88#, 16#99#,
        16#aa#, 16#bb#, 16#cc#, 16#dd#, 16#ee#,
        16#ff#
    ); -- Valores de teste

    signal read_index      : integer range -1 to c_test_values'length := -1; -- Índice de leitura
    signal wr_active_count : integer := 0;                                   -- Contador de escrita ativa

begin
    clk <= not clk after c_clk_period / 2;

    uut : entity work.FIFO
        port map (
            clock         => clk,
            data          => data_in,
            rdreq         => rdreq,
            wrreq         => wrreq,
            almost_empty  => almost_empty,
            almost_full   => almost_full,
            empty         => empty,
            full          => full,
            q             => data_out,
            usedw         => usedw
        );

    stimulus : process
    begin
        wait for 5 * c_clk_period;

        -- Aplica um padrão de escrita na FIFO
        for idx in 0 to c_test_values'length - 1 loop
            data_in <= std_logic_vector(to_unsigned(c_test_values(idx), data_in'length));
            wrreq   <= '1';
            rdreq   <= '0';
            wait for c_clk_period;
            wrreq <= '0';
            wait for c_clk_period;
            wr_active_count <= wr_active_count + 1;
        end loop;

        wait for 5 * c_clk_period;

        -- Lê de volta cada valor e realiza a checagem
        for idx in 0 to c_test_values'length - 1 loop
            rdreq <= '1';
            wait for c_clk_period;
            rdreq <= '0';
            wait for c_clk_period; -- permite que a saída registrada seja atualizada

            read_index <= idx;
            assert unsigned(data_out) = to_unsigned(c_test_values(idx), data_out'length)
                report "FIFO: dado divergente no índice " & integer'image(idx) &
                       ": esperado " & integer'image(c_test_values(idx)) &
                       ", obtido " & integer'image(to_integer(unsigned(data_out)))
                severity error;
        end loop;

        wait for 5 * c_clk_period;

        assert empty = '1'
            report "FIFO deveria estar vazia após todas as leituras" severity error;

        assert false report "Testbench da FIFO finalizado com sucesso" severity note;
        wait;
    end process;

end architecture tb;

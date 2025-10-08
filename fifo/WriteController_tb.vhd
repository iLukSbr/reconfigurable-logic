library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WriteController_tb is
end entity WriteController_tb;

architecture tb of WriteController_tb is
    constant c_clk_period  : time := 20 ns;   -- Período do clock
    constant c_total_words : natural := 2048; -- Total de palavras a serem transferidas

    signal clk   : std_logic := '0'; -- Clock
    signal reset : std_logic := '1'; -- Reset

    signal bram_addr   : std_logic_vector(10 downto 0) := (others => '0'); -- Endereço da BRAM
    signal bram_wren   : std_logic := '0';                                 -- Write enable para a BRAM
    signal bram_data_w : std_logic_vector(7 downto 0) := (others => '0');  -- Dado a ser escrito na BRAM
    signal bram_data_r : std_logic_vector(7 downto 0) := (others => '0');  -- Dado lido da BRAM

    signal fifo_data   : std_logic_vector(7 downto 0) := (others => '0');      -- Dado a ser escrito na FIFO
    signal fifo_q      : std_logic_vector(7 downto 0) := (others => '0');      -- Dado lido da FIFO
    signal fifo_wrreq  : std_logic := '0';                                     -- Write request para a FIFO
    signal fifo_rdreq  : std_logic := '0';                                     -- Read request para a FIFO
    signal fifo_almost_full : std_logic := '0';                                -- FIFO quase cheia
    signal fifo_empty       : std_logic := '0';                                -- FIFO vazia
    signal fifo_almost_empty: std_logic := '0';                                -- FIFO quase vazia
    signal fifo_full        : std_logic := '0';                                -- FIFO cheia
    signal fifo_usedw       : std_logic_vector(9 downto 0) := (others => '0'); -- Palavras usadas na FIFO

    signal transfer_done : std_logic; -- Transferência concluída

    signal fifo_rdreq_d : std_logic := '0'; -- Read request para a FIFO (delayed)

begin
    clk <= not clk after c_clk_period / 2;

    src_bram : entity work.BRAM_Origem
        port map (
            address => bram_addr,
            clock   => clk,
            data    => bram_data_w,
            wren    => bram_wren,
            q       => bram_data_r
        );

    fifo_inst : entity work.FIFO
        port map (
            clock        => clk,
            data         => fifo_data,
            rdreq        => fifo_rdreq,
            wrreq        => fifo_wrreq,
            almost_empty => fifo_almost_empty,
            almost_full  => fifo_almost_full,
            empty        => fifo_empty,
            full         => fifo_full,
            q            => fifo_q,
            usedw        => fifo_usedw
        );

    uut : entity work.WriteController
        port map (
            clk              => clk,
            reset            => reset,
            bram_addr_out    => bram_addr,
            bram_wren_out    => bram_wren,
            bram_data_out    => bram_data_w,
            bram_data_in     => bram_data_r,
            fifo_data_out    => fifo_data,
            fifo_wrreq_out   => fifo_wrreq,
            fifo_almost_full => fifo_almost_full,
            fifo_usedw       => fifo_usedw,
            transfer_done    => transfer_done
        );

    stimulus : process
    begin
        reset <= '1';
        wait for 10 * c_clk_period;
        reset <= '0';

        wait until transfer_done = '1';
        wait for 10 * c_clk_period;
        assert false report "WriteController completed transfer" severity note;
        wait;
    end process;

    consumer : process(clk)
        variable divider : integer range 0 to 6 := 0;
    begin
        if rising_edge(clk) then
            if reset = '1' then
                fifo_rdreq <= '0';
                divider := 0;
            else
                if unsigned(fifo_usedw) = 0 then
                    fifo_rdreq <= '0';
                    divider := 0;
                else
                    if divider = 6 then
                        fifo_rdreq <= '1';
                        divider := 0;
                    else
                        fifo_rdreq <= '0';
                        divider := divider + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    checker : process(clk)
        variable expected_value : integer := 0;
    begin
        if rising_edge(clk) then
            fifo_rdreq_d <= fifo_rdreq;

            if reset = '1' then
                expected_value := 0;
            else
                if fifo_rdreq_d = '1' then
                    assert unsigned(fifo_q) = to_unsigned(expected_value mod 256, fifo_q'length)
                        report "WriteController FIFO data mismatch at index " & integer'image(expected_value)
                            & ": expected " & integer'image(expected_value mod 256)
                            & ", got " & integer'image(to_integer(unsigned(fifo_q)))
                        severity error;
                    expected_value := expected_value + 1;
                end if;

                if transfer_done = '1' then
                    assert expected_value = c_total_words
                        report "WriteController done but expected_value = " & integer'image(expected_value)
                        severity error;
                end if;
            end if;
        end if;
    end process;

end architecture tb;

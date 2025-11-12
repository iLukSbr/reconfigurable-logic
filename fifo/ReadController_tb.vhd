library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ReadController_tb is
end entity ReadController_tb;

architecture tb of ReadController_tb is
    constant c_clk_period : time := 20 ns;    -- Período do clock
    constant c_total_words : natural := 2048; -- Total de palavras a serem transferidas

    signal clk         : std_logic := '0'; -- Clock
    signal reset       : std_logic := '1'; -- Reset
	 
	 signal s_writer_done : std_logic := '0';

    signal bram_addr   : std_logic_vector(10 downto 0) := (others => '0'); -- Endereço da BRAM
    signal bram_wren   : std_logic := '0';                                 -- Write enable para a BRAM
    signal bram_data_w : std_logic_vector(7 downto 0) := (others => '0');  -- Dado a ser escrito na BRAM
    signal bram_data_r : std_logic_vector(7 downto 0) := (others => '0');  -- Dado lido da BRAM

    signal fifo_data_in      : std_logic_vector(7 downto 0) := (others => '0'); -- Dado a ser escrito na FIFO
    signal fifo_data_out     : std_logic_vector(7 downto 0) := (others => '0'); -- Dado lido da FIFO
    signal fifo_wrreq        : std_logic := '0';                                -- Write request para a FIFO
    signal fifo_rdreq        : std_logic := '0';                                -- Read request para a FIFO
    signal fifo_almost_empty : std_logic := '0';                                -- FIFO quase vazia
    signal fifo_almost_full  : std_logic := '0';                                -- FIFO quase cheia
    signal fifo_empty        : std_logic := '0';                                -- FIFO vazia
    signal fifo_full         : std_logic := '0';                                -- FIFO cheia
    signal fifo_usedw        : std_logic_vector(9 downto 0) := (others => '0'); -- Palavras usadas na FIFO

    signal transfer_done : std_logic := '0'; -- Transferência concluída

    signal fifo_wrreq_d  : std_logic := '0'; -- Write request para a FIFO (delayed)

begin
    clk <= not clk after c_clk_period / 2;

    dest_bram : entity work.BRAM_Destino
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
            data         => fifo_data_in,
            rdreq        => fifo_rdreq,
            wrreq        => fifo_wrreq,
            almost_empty => fifo_almost_empty,
            almost_full  => fifo_almost_full,
            empty        => fifo_empty,
            full         => fifo_full,
            q            => fifo_data_out,
            usedw        => fifo_usedw
        );

    uut : entity work.ReadController
        port map (
            clk             => clk,
            reset           => reset,
				writer_done_in  => s_writer_done,
            bram_addr_out   => bram_addr,
            bram_wren_out   => bram_wren,
            bram_data_out   => bram_data_w,
            fifo_data_in    => fifo_data_out,
            fifo_rdreq_out  => fifo_rdreq,
            fifo_empty_in   => fifo_empty,
            transfer_done   => transfer_done
        );

    stimulus : process
    begin
        reset <= '1';
        wait for 10 * c_clk_period;
        reset <= '0';

        wait until transfer_done = '1';
        wait for 10 * c_clk_period;
        assert false report "ReadController completed transfer" severity note;
        wait;
    end process;

	producer : process(clk)
		 variable write_index : integer := 0;
		 -- Variável para simular o ciclo de 2 clocks (leitura/escrita)
		 variable can_write   : boolean := true; 
	begin
		 if rising_edge(clk) then
			  if reset = '1' then
					fifo_wrreq    <= '0';
					write_index   := 0;
					s_writer_done <= '0';
					can_write     := true; -- Reseta o estado
			  else
					-- Lógica de escrita alternada
					if write_index < c_total_words and can_write then
						 if fifo_full = '0' then
							  fifo_data_in <= std_logic_vector(to_unsigned(write_index mod 256, fifo_data_in'length));
							  fifo_wrreq   <= '1';
							  write_index  := write_index + 1;
						 else
							  fifo_wrreq <= '0';
						 end if;
					else
						 fifo_wrreq <= '0';
					end if;

					-- Inverte a permissão de escrita a cada ciclo para criar o atraso
					can_write := not can_write;

					-- Sinaliza que terminou APENAS quando o contador atingir o limite
					if write_index = c_total_words then
						 s_writer_done <= '1';
					end if;
			  end if;
		 end if;
	end process;

    checker : process(clk)
        variable expected_value : integer := 0;
    begin
        if rising_edge(clk) then
            if reset = '1' then
                expected_value := 0;
            else
                if bram_wren = '1' then
                    assert unsigned(bram_data_w) = to_unsigned(expected_value mod 256, bram_data_w'length)
                        report "ReadController BRAM data mismatch at index " & integer'image(expected_value)
                            & ": expected " & integer'image(expected_value mod 256)
                            & ", got " & integer'image(to_integer(unsigned(bram_data_w)))
                        severity error;
                    expected_value := expected_value + 1;
                end if;

                if transfer_done = '1' then
                    assert expected_value = c_total_words
                        report "ReadController done but expected_value = " & integer'image(expected_value)
                        severity error;
                end if;
            end if;
        end if;
    end process;

end architecture tb;

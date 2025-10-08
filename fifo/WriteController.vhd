-- Controlador de Escrita (BRAM -> FIFO)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WriteController is
    port (
        -- Sinais de Controle Globais
        clk     : in  std_logic;
        reset   : in  std_logic;

        -- Interface com a BRAM de Origem
        bram_addr_out   : out std_logic_vector(10 downto 0); -- 2048 posições (2^11)
        bram_wren_out   : out std_logic;                     -- Write enable para o carregamento inicial
        bram_data_out   : out std_logic_vector(7 downto 0);  -- Dado para carregar na BRAM
        bram_data_in    : in  std_logic_vector(7 downto 0);  -- Dado lido da BRAM

        -- Interface com a FIFO
        fifo_data_out   : out std_logic_vector(7 downto 0);
        fifo_wrreq_out  : out std_logic;                     -- Write request para a FIFO
        fifo_almost_full: in  std_logic;                     -- Sinal de >= 75%
        fifo_usedw      : in  std_logic_vector(9 downto 0);  -- Contador de palavras na FIFO (CNT)

        -- Saída de Status
        transfer_done   : out std_logic
    );
end entity WriteController;

architecture rtl of WriteController is

    -- 1. Definição dos estados da máquina
    type T_STATE is (
        S_IDLE,         -- Estado inicial, esperando o reset
        S_LOAD_BRAM,    -- Carregando a BRAM com valores de 0 a 2047
        S_READ_BRAM,    -- Pede um dado para a BRAM (considerando a latência de 1 ciclo)
        S_WRITE_FIFO,   -- Espera o dado da BRAM e o escreve na FIFO
        S_WAIT_FIFO,    -- Pausa a escrita pois a FIFO está quase cheia
        S_DONE          -- Transferência concluída
    );

    -- 2. Sinais internos da FSM
    signal state        : T_STATE := S_IDLE;                              -- Estado inicial
    signal next_state   : T_STATE := S_IDLE;                              -- Próximo estado
    signal addr_counter : unsigned(10 downto 0) := (others => '0');       -- Contador de endereços da BRAM
    signal fifo_usedw_unsigned : unsigned(9 downto 0) := (others => '0'); -- Contador de palavras usadas na FIFO

begin
    -- Conversão do contador da FIFO para tipo unsigned para facilitar comparações
    fifo_usedw_unsigned <= unsigned(fifo_usedw);

    -- 3. Processo Síncrono: Atualiza o estado e os contadores na borda do clock
    process(clk, reset)
    begin
        if (reset = '1') then
            state <= S_IDLE;
            addr_counter <= (others => '0');
        elsif (rising_edge(clk)) then
            state <= next_state;

            -- Lógica de incremento do contador de endereços
            if (state = S_LOAD_BRAM and addr_counter < 2047) or (state = S_READ_BRAM) then
                addr_counter <= addr_counter + 1;
            elsif (state = S_LOAD_BRAM and addr_counter = 2047) then
                addr_counter <= (others => '0'); -- Reseta o contador para a leitura
            end if;
        end if;
    end process;

    -- 4. Processo Combinacional: Define as saídas e o próximo estado
    process(state, bram_data_in, fifo_almost_full, fifo_usedw_unsigned, addr_counter)
    begin
        -- Valores padrão para as saídas (evita latches)
        bram_addr_out   <= std_logic_vector(addr_counter);
        bram_wren_out   <= '0';
        bram_data_out   <= (others => '0');
        fifo_data_out   <= (others => '0');
        fifo_wrreq_out  <= '0';
        transfer_done   <= '0';
        next_state      <= state; -- Permanece no mesmo estado por padrão

        case state is
            when S_IDLE =>					 
                next_state <= S_LOAD_BRAM;

            when S_LOAD_BRAM =>
                bram_wren_out <= '1';
                bram_data_out <= std_logic_vector(resize(addr_counter, bram_data_out'length));

                if addr_counter = 2047 then
                    next_state <= S_READ_BRAM;
                end if;

            when S_READ_BRAM =>
                bram_addr_out <= std_logic_vector(addr_counter);
                next_state <= S_WRITE_FIFO;

            when S_WRITE_FIFO =>
                fifo_data_out <= bram_data_in;
                fifo_wrreq_out <= '1';

                if fifo_almost_full = '1' then
                    next_state <= S_WAIT_FIFO;
                elsif addr_counter = 0 then
                    next_state <= S_DONE;
                else
                    next_state <= S_READ_BRAM;
                end if;

            when S_WAIT_FIFO =>
                fifo_wrreq_out <= '0';

                if fifo_usedw_unsigned <= to_unsigned(512, fifo_usedw_unsigned'length) then
                    next_state <= S_READ_BRAM;
                end if;

            when S_DONE =>
                transfer_done <= '1';
                next_state <= S_DONE;
        end case;
    end process;

end architecture rtl;

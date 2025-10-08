-- Controlador de Leitura (FIFO -> BRAM 2)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ReadController is
    port (
        -- Sinais de Controle Globais
        clk   : in  std_logic; -- Clock
        reset : in  std_logic; -- Reset

        -- Interface com a BRAM de Destino
        bram_addr_out : out std_logic_vector(10 downto 0); -- 2048 posições (2^11)
        bram_wren_out : out std_logic;                     -- Write enable para o carregamento
        bram_data_out : out std_logic_vector(7 downto 0);  -- Dado para carregar na BRAM (da FIFO)

        -- Interface com a FIFO
        fifo_data_in   : in std_logic_vector(7 downto 0); -- Dado lido
        fifo_rdreq_out : out std_logic;                   -- Read request para a FIFO
        fifo_empty_in  : in  std_logic;                   -- FIFO vazia

        -- Saída de Status
        transfer_done : out std_logic -- Transferência concluída
    );
end entity ReadController;

architecture rtl of ReadController is

    -- 1. Definição dos estados da máquina
    type T_STATE is (
        S_IDLE,       -- Estado inicial, fica aqui enquanto a FIFO está vazia
        S_READ_FIFO,  -- Pede um dado para a FIFO (considerando a latência de 1 ciclo)
        S_WRITE_BRAM, -- Espera o dado da FIFO e o escreve na BRAM 2
        S_DONE        -- Transferência concluída
    );

    -- 2. Sinais internos da FSM
    signal state        : T_STATE := S_IDLE;                        -- Estado atual
    signal next_state   : T_STATE := S_IDLE;                        -- Próximo estado
    signal addr_counter : unsigned(10 downto 0) := (others => '0'); -- Contador de endereços

begin

    -- 3. Processo Síncrono: Atualiza o estado e os contadores na borda do clock
    process(clk, reset)
    begin
        if (reset = '1') then
            state <= S_IDLE;
            addr_counter <= (others => '0');
        elsif (rising_edge(clk)) then
            state <= next_state;

            -- Lógica de incremento do contador de endereços
            if (state = S_WRITE_BRAM and addr_counter < 2047) then
                addr_counter <= addr_counter + 1;
            elsif (state = S_WRITE_BRAM and addr_counter = 2047) then
                addr_counter <= (others => '0'); -- Reseta o contador para a escrita
            end if;
        end if;
    end process;

    -- 4. Processo Combinacional: Define as saídas e o próximo estado
    process(state, fifo_data_in, addr_counter, fifo_empty_in)
    begin
        -- Valores padrão para as saídas (evita latches)
        bram_addr_out <= std_logic_vector(addr_counter);
        bram_wren_out <= '0';
        bram_data_out <= (others => '0');
        fifo_rdreq_out<= '0';
        transfer_done <= '0';
        next_state    <= state; -- Permanece no mesmo estado por padrão

        case state is
            when S_IDLE =>
                -- Se a FIFO NÃO estiver vazia, comece a ler.
                if fifo_empty_in = '0' then
                    next_state <= S_READ_FIFO;
                end if;

            when S_READ_FIFO =>
                -- Peça um dado para a FIFO
                fifo_rdreq_out <= '1';
                -- E vá para o próximo estado para aguardar a chegada do dado
                next_state <= S_WRITE_BRAM;

            when S_WRITE_BRAM =>
                -- O dado chegou. Escreva-o na BRAM.
                bram_wren_out <= '1';
                bram_data_out <= fifo_data_in;

                -- Verifique se esta foi a última escrita.
                if addr_counter = 2047 then
                    next_state <= S_DONE;
                else
                    -- Se não foi a última, volte para ler o próximo dado.
                    next_state <= S_READ_FIFO;
                end if;

            when S_DONE =>
                transfer_done <= '1';
                next_state <= S_DONE; -- Fica travado aqui

            -- Garante que todos os casos sejam cobertos
            when others =>
                next_state <= S_IDLE;

        end case;
    end process;

end architecture rtl;

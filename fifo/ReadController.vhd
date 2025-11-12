-- Controlador de Leitura (FIFO -> BRAM 2)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ReadController is
    port (
        -- Sinais de Controle Globais
        clk   : in  std_logic; -- Clock
        reset : in  std_logic; -- Reset
		  
		  writer_done_in : in std_logic;
		  
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
    signal speed_divider : integer range 0 to 6 := 0;               -- Contador de 0 a 6 (7 ciclos)
    
    -- Sinal para controlar quando as ações podem ser executadas
    signal can_proceed  : std_logic := '0';

begin

    -- 3. Processo Síncrono: Atualiza o estado e os contadores na borda do clock
	process(clk, reset)
	begin
		 if (reset = '1') then
			  state <= S_IDLE;
			  addr_counter <= (others => '0');
			  speed_divider <= 0;
			  can_proceed <= '0';
		 elsif (rising_edge(clk)) then
			  state <= next_state;

			  -- A lógica de controle de velocidade agora afeta apenas as ações e
			  -- o incremento dos contadores, não a atualização de estado.
			  if speed_divider = 6 then
					speed_divider <= 0;
					can_proceed <= '1';  -- Sinaliza que pode prosseguir

					-- O contador de endereço só avança quando uma escrita é
					-- efetivamente realizada (ou seja, quando state ERA S_WRITE_BRAM).
					if (state = S_WRITE_BRAM) then
						 addr_counter <= addr_counter + 1;
					end if;
			  else
					speed_divider <= speed_divider + 1;
					can_proceed <= '0';  -- Não pode prosseguir nos outros ciclos
			  end if;
		 end if;
	end process;

    -- 4. Processo Combinacional: Define as saídas e o próximo estado
-- CÓDIGO A SER ALTERADO em ReadController.vhd (arquitetura)

-- 4. Processo Combinacional: Define as saídas e o próximo estado
		process(state, fifo_data_in, addr_counter, fifo_empty_in, can_proceed, writer_done_in)
		begin
			 -- Valores padrão para as saídas (evita latches)
			 bram_addr_out <= std_logic_vector(addr_counter);
			 bram_wren_out <= '0';
			 bram_data_out <= (others => '0');
			 fifo_rdreq_out<= '0';
			 transfer_done <= '0';
			 next_state    <= state;

			 -- Só executa ações quando can_proceed está ativo
			 if can_proceed = '1' then
				  case state is
						when S_IDLE =>
							 -- Se o escritor terminou E a FIFO está vazia, o trabalho acabou.
							 if writer_done_in = '1' and fifo_empty_in = '1' then
								  next_state <= S_DONE;
							 -- Se não, e se a FIFO tiver dados, continue lendo.
							 elsif fifo_empty_in = '0' then
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

							 -- Se a FIFO ainda tiver dados, continue no loop rápido (S_READ_FIFO).
							 -- Se a FIFO estiver vazia, saia do loop e vá para S_IDLE verificar o fim da operação.
							 if fifo_empty_in = '1' then
								next_state <= S_IDLE;
							 else
								next_state <= S_READ_FIFO;
							 end if;

						when S_DONE =>
							 transfer_done <= '1';
							 next_state <= S_DONE; -- Fica travado aqui

						-- Garante que todos os casos sejam cobertos
						when others =>
							 next_state <= S_IDLE;
				  end case;
			 end if;
		end process;

end architecture rtl;
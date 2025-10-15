library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! Topo responsável por interligar BRAM de origem, FIFO, controladores e BRAM de destino.
--  Os controladores trabalham de forma independente; o TOP apenas sincroniza os sinais.
entity FlowControlTop is
    port (
        clk          : in  std_logic;                     -- Clock global compartilhado entre todos os blocos
        reset        : in  std_logic;                     -- Reset síncrono utilizado pelos controladores
        done         : out std_logic;                     -- Indica término da transferência completa
        dados_entrada: out std_logic_vector(7 downto 0);  -- Dados que estão entrando na FIFO (origem)
        dados_saida  : out std_logic_vector(7 downto 0)   -- Dados que estão saindo da FIFO (destino)
    );
end entity FlowControlTop;

architecture rtl of FlowControlTop is

    -- Sinais para o atributo de síntese
    attribute syn_keep : boolean; 

    -- Sinais entre a BRAM de origem, o controlador de escrita e a FIFO
    signal wr_bram_addr : std_logic_vector(10 downto 0) := (others => '0'); -- Endereço da BRAM de origem
    signal wr_bram_wren : std_logic := '0'; -- Write enable para a BRAM de origem
    signal wr_bram_data : std_logic_vector(7 downto 0) := (others => '0'); -- Dado a ser escrito na BRAM de origem
    signal wr_bram_q    : std_logic_vector(7 downto 0) := (others => '0'); -- Dado lido da BRAM de origem

    -- Sinais entre a BRAM de destino, o controlador de leitura e a FIFO
    signal rd_bram_addr : std_logic_vector(10 downto 0) := (others => '0'); -- Endereço da BRAM de destino
    signal rd_bram_wren : std_logic := '0'; -- Write enable para a BRAM de destino
    signal rd_bram_data : std_logic_vector(7 downto 0) := (others => '0'); -- Dado a ser escrito na BRAM de destino
    signal rd_bram_q    : std_logic_vector(7 downto 0) := (others => '0'); -- Dado lido da BRAM de destino

    -- Barramento da FIFO usado para fluxo de dados e monitoramento de ocupação
    signal fifo_data_in      : std_logic_vector(7 downto 0) := (others => '0'); -- Dado a ser escrito na FIFO
    signal fifo_data_out     : std_logic_vector(7 downto 0) := (others => '0'); -- Dado lido da FIFO
    
    signal fifo_wrreq        : std_logic := '0'; -- Write request para a FIFO
    attribute syn_keep of fifo_wrreq : signal is true;
    
    signal fifo_rdreq        : std_logic := '0'; -- Read request para a FIFO
    attribute syn_keep of fifo_rdreq : signal is true;  
    
    signal fifo_almost_empty : std_logic := '0'; -- Sinal de quase vazio
    attribute syn_keep of fifo_almost_empty : signal is true; 
    
    signal fifo_almost_full  : std_logic := '0'; -- Sinal de quase cheio
    attribute syn_keep of fifo_almost_full : signal is true; 
    
    signal fifo_empty        : std_logic := '0'; -- Sinal de vazio
    attribute syn_keep of fifo_empty : signal is true; 
    
    signal fifo_full         : std_logic := '0'; -- Sinal de cheio
    attribute syn_keep of fifo_full : signal is true; 
    
    signal fifo_usedw        : std_logic_vector(9 downto 0) := (others => '0'); -- Contador de palavras usadas na FIFO
    attribute syn_keep of fifo_usedw : signal is true; 

    -- Flags de conclusão individuais dos controladores
    signal write_done : std_logic := '0'; -- Indica término da transferência da BRAM de origem para a FIFO
    attribute syn_keep of write_done : signal is true; 
    
    signal read_done  : std_logic := '0'; -- Indica término da transferência da FIFO para a BRAM de destino
    attribute syn_keep of read_done : signal is true; 

begin
    -- Instância da BRAM de origem: armazena dados gerados pelo WriteController
    src_bram : entity work.BRAM_Origem
        port map (
            address => wr_bram_addr,
            clock   => clk,
            data    => wr_bram_data,
            wren    => wr_bram_wren,
            q       => wr_bram_q
        );

    -- Instância da BRAM de destino: recebe dados transferidos pela FIFO
    dest_bram : entity work.BRAM_Destino
        port map (
            address => rd_bram_addr,
            clock   => clk,
            data    => rd_bram_data,
            wren    => rd_bram_wren,
            q       => rd_bram_q
        );

    -- FIFO intermediária gerenciada pelos controladores para desacoplar as taxas
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

    -- Controlador de escrita: carrega a BRAM de origem e envia dados para a FIFO
    write_ctrl : entity work.WriteController
        port map (
            clk              => clk,
            reset            => reset,
            bram_addr_out    => wr_bram_addr,
            bram_wren_out    => wr_bram_wren,
            bram_data_out    => wr_bram_data,
            bram_data_in     => wr_bram_q,
            fifo_data_out    => fifo_data_in,
            fifo_wrreq_out   => fifo_wrreq,
            fifo_almost_full => fifo_almost_full,
            fifo_usedw       => fifo_usedw,
            transfer_done    => write_done
        );

    -- Controlador de leitura: retira dados da FIFO e grava na BRAM de destino
    read_ctrl : entity work.ReadController
        port map (
            clk               => clk,
            reset             => reset,
            writer_done_in    => write_done,
            bram_addr_out     => rd_bram_addr,
            bram_wren_out     => rd_bram_wren,
            bram_data_out     => rd_bram_data,
            fifo_data_in      => fifo_data_out,
            fifo_rdreq_out    => fifo_rdreq,
            fifo_empty_in     => fifo_empty,
            transfer_done     => read_done
        );

    -- Exporta os dados internos para os pinos externos
    dados_entrada <= fifo_data_in;
    dados_saida   <= fifo_data_out;

    -- A transferência é considerada concluída quando ambos controladores sinalizam DONE
    done <= write_done and read_done;

end architecture rtl;
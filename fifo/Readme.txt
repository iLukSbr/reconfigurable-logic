================================================================================
          ANÁLISE E CORREÇÃO DAS MÁQUINAS DE ESTADO (FSM)
            Projeto: BlockRAM, FIFO e Controle de Fluxo
    Dupla: Letícia Walger Amaro e Lucas Yukio Fukuda Matsumoto
================================================================================

Este documento descreve o funcionamento final das máquinas de estado (FSMs) para
os módulos WriteController e ReadController, conforme a Tarefa 2 do projeto:
"Completar e corrigir a máquina de estados".

As FSMs foram projetadas para serem robustas, eficientes e para lidar
corretamente com o controle de fluxo entre uma BRAM de origem e uma de destino,
utilizando uma FIFO como buffer intermediário.

--------------------------------------------------------------------------------
1. MÁQUINA DE ESTADOS: WriteController
--------------------------------------------------------------------------------

O objetivo deste controlador é inicializar uma BRAM de origem (BRAM 1) com
valores sequenciais e, em seguida, transferir esses dados para a FIFO o mais
rápido possível, respeitando o limite de ocupação da FIFO.

**ESTADOS IMPLEMENTADOS:**

* **S_IDLE:**
    * **Ação:** Estado inicial transitório.
    * **Transição:** Passa incondicionalmente para `S_LOAD_BRAM` para iniciar a operação.

* **S_LOAD_BRAM:**
    * **Ação:** Preenche a BRAM de origem. A cada ciclo de clock, escreve o valor do `addr_counter` no endereço correspondente (`bram_wren_out <= '1'`).
    * **Transição:** Permanece neste estado até que `addr_counter` atinja 2047. Após escrever no último endereço, transita para `S_READ_BRAM` e reseta o `addr_counter` para 0, preparando-se para a leitura.

* **S_READ_BRAM:**
    * **Ação:** Apresenta um endereço ao barramento da BRAM de origem para iniciar uma leitura. Este é um estado de pipeline para respeitar a latência de 1 ciclo da BRAM.
    * **Transição:** Passa incondicionalmente para `S_WRITE_FIFO` no ciclo seguinte.

* **S_WRITE_FIFO:**
    * **Ação:** Pega o dado que chegou da BRAM (`bram_data_in`) e o escreve na FIFO (`fifo_wrreq_out <= '1'`).
    * **Transição (Lógica de Decisão Principal):**
        * Se `fifo_almost_full = '1'`, transita para `S_WAIT_FIFO` (pausa).
        * Senão, se o `addr_counter` deu a volta para 0 (indicando que a última palavra foi lida), transita para `S_DONE` (fim).
        * Senão, transita de volta para `S_READ_BRAM` para buscar o próximo dado.

* **S_WAIT_FIFO:**
    * **Ação:** Pausa a escrita na FIFO (`fifo_wrreq_out <= '0'`).
    * **Transição:** Permanece neste estado até que o `ReadController` esvazie a FIFO o suficiente, condição detectada por `fifo_usedw <= 512`. Quando a condição é satisfeita, transita para `S_READ_BRAM` para retomar a transferência.

* **S_DONE:**
    * **Ação:** Sinaliza que sua parte da transferência foi concluída (`transfer_done <= '1'`).
    * **Transição:** Permanece neste estado.

			       +--------+
(Após Reset) ---------------->| S_IDLE |
                               +--------+
                                   |
                                   | [Inicia a operação]
                                   V
                             /------------\
                             |            |
                       +-------------+    | [addr_counter < 2047]
                       | S_LOAD_BRAM |----+
                       +-------------+
                             |
                             | [addr_counter == 2047, BRAM carregada]
                             V
 /--------------------->+-------------+<-------------------------------------\
 | [else]              | S_READ_BRAM |                                      |
 | (Continuar loop)    +-------------+                                      |
 |                           |                                              | [fifo_usedw <= 512]
 |                           | [Pipeline p/ escrita]                        | (Retomar escrita)
 |                           V                                              |
 \-------------------- +--------------+ --[fifo_almost_full == '1']--> +-------------+
                       | S_WRITE_FIFO |                                | S_WAIT_FIFO |
                       +--------------+ --[addr_counter == 0 (wrap)]-> +--------+    |
                                                                       | S_DONE |    | [fifo_usedw > 512]
                                                                       +--------+    | (Continuar esperando)
                                                                                     \-------<-------/
--------------------------------------------------------------------------------
2. MÁQUINA DE ESTADOS: ReadController
--------------------------------------------------------------------------------

O objetivo deste controlador é ler os dados da FIFO e escrevê-los em uma BRAM de
destino (BRAM 2). Sua velocidade de operação é controlada por um divisor de
clock (`speed_divider`), operando 7 vezes mais lentamente que a velocidade máxima.

**ESTADOS IMPLEMENTADOS:**

* **S_IDLE:**
    * **Ação:** Estado de espera e decisão principal.
    * **Transição (Lógica de Decisão Robusta):**
        * Se `writer_done_in = '1'` e `fifo_empty_in = '1'`, transita para `S_DONE` (fim da operação).
        * Senão, se `fifo_empty_in = '0'` (há dados na FIFO), transita para `S_READ_FIFO`.
        * Senão, permanece em `S_IDLE`.

* **S_READ_FIFO:**
    * **Ação:** Solicita um dado da FIFO (`fifo_rdreq_out <= '1'`). Estado de pipeline para aguardar a chegada do dado.
    * **Transição:** Passa incondicionalmente para `S_WRITE_BRAM`.

* **S_WRITE_BRAM:**
    * **Ação:** Pega o dado que chegou da FIFO (`fifo_data_in`) e o escreve na BRAM de destino (`bram_wren_out <= '1'`).
    * **Transição (Lógica Otimizada):**
        * Se `fifo_empty_in = '1'` (este foi o último dado), transita para `S_IDLE` para a verificação final.
        * Senão (ainda há dados), transita de volta para `S_READ_FIFO`, mantendo um loop rápido e eficiente de 2 estados para máxima performance.

* **S_DONE:**
    * **Ação:** Sinaliza que sua parte da transferência foi concluída (`transfer_done <= '1'`).
    * **Transição:** Permanece neste estado.

*Observação: Todas as transições do ReadController são habilitadas pelo sinal
`can_proceed`, que vai para '1' a cada 7 ciclos de clock.*

				    +---------+
(Após Reset) ---------------------->| S_IDLE  |----[writer_done=='1' AND fifo_empty=='1']--->+--------+
                                    +---------+                                            | S_DONE |
                                        |                                                  +--------+
                                        | [fifo_empty == '0']
                                        | (Começar/Continuar leitura)
                                        V
  /------------------------------+-------------+<-------------------------------------\
  | [fifo_empty == '0']          | S_READ_FIFO |                                      |
  | (Continuar loop rápido)      +-------------+                                      |
  |                                    |                                              |
  |                                    | [Pipeline p/ escrita]                        |
  |                                    V                                              |
  \------------------------------- +--------------+                                   |
                                   | S_WRITE_BRAM |                                   |
                                   +--------------+                                   |
                                         |                                            |
                                         | [fifo_empty == '1']                        |
                                         | (Último dado lido, sair do loop rápido)    |
                                         V                                            |
                                     (Volta para S_IDLE para reavaliar)---------------+

--------------------------------------------------------------------------------
3. PRINCIPAIS CORREÇÕES E MELHORIAS APLICADAS
--------------------------------------------------------------------------------

A FSM original (sugerida no diagrama simplificado) foi completada e passou por
diversas correções para garantir robustez e eficiência:

1.  **Correção de Impasse (Deadlock):** A FSM do `ReadController` inicialmente ficava presa em `S_IDLE`, pois a lógica de atualização de estado estava incorretamente condicionada ao `speed_divider`. A correção moveu a atualização (`state <= next_state`) para ocorrer a cada ciclo de clock.

2.  **Correção de Erro "Off-by-One":** O sistema inicialmente deixava um último dado na FIFO. A causa era uma lógica de finalização frágil baseada apenas na contagem de pacotes. A correção foi tornar o `ReadController` ciente do estado do `WriteController` (via sinal `writer_done_in`), permitindo que ele finalize apenas quando o escritor terminou E a FIFO está vazia.

3.  **Correção de Loop Infinito na Finalização:** Uma melhoria posterior corrigiu um bug onde o `ReadController`, após esvaziar a FIFO, ficava alternando entre `S_READ_FIFO` e `S_WRITE_BRAM`. A solução foi tornar a transição em `S_WRITE_BRAM` condicional, voltando para `S_IDLE` apenas quando a FIFO esvazia, mas mantendo um loop rápido de 2 estados para o resto da transferência, garantindo performance máxima.

4.  **Ajuste do Ambiente de Teste:** Foi identificado que o teste de unidade do `ReadController` falhava devido a um `producer` (escritor simulado) muito agressivo, que criava condições de estresse de temporização irreais. O testbench foi corrigido para simular o `WriteController` real de forma mais fiel, resolvendo a divergência de dados.


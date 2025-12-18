# Controlador de semáforo com simulador de tráfego

- Universidade Tecnológica Federal do Paraná - UTFPR
- ELEW33-S71 Lógica Reconfigurável
- Prática 7 - Interfaceamento NIOS ETHERNET
- Projeto Nios II com servidor TCP/IP para processar strings via socket
- Prof. Luiz Fernando Copetti

Alunos: Lucas Yukio Fukuda Matsumoto e Letícia Walger Amaro

A pasta prints contém imagens e vídeos do funcionamento do projeto.
Vídeo do funcionamento da placa controlando o semáforo nos displays 7 segmentos e na página web: https://youtu.be/9gWcVJNrkoY

## Protocolo de comunicação do semáforo
- O cliente tem uma visualização (animação) de simulação de tráfego na página web. Ideia: https://github.com/djalilhebal/softvis-traffic-semaphores
- É possível configurar os tempos iniciais dos semáforos via web por campos de digitação (0 a 999 segundos) para cada cor e cada semáforo (0 ou 1).
- Há um seletor para escolher qual a cor inicial do semáforo 0 apenas.
- Há um quadradinho de marcar/desmarcar se quer ativar tempos dinâmicos.

- O cliente envia uma string no formato "RRRYYYGGGRRRYYYGGGI":
- A primeira parte RRRYYYGGG (9 chars) representa os tempos do semáforo 0, a segunda parte RRRYYYGGG (9 chars) representa os tempos do semáforo 1 e a última - parte I representa o estado inicial do semáforo 0.
- RRR tempo em segundos para o sinal vermelho;
- YYY tempo em segundos para o sinal amarelo;
- GGG tempo em segundos para o sinal verde.
- I estado inicial para o semáforo 0.
- O servidor NIOS II processa essa string e ajusta os tempos dos semáforos de acordo.
- O servidor responde com a string "OK" se os tempos forem configurados corretamente ou "ERROR" se houver algum problema na configuração.
- A mensagem é reenviada até receber "OK".
- Caso o tráfego esteja muito pesado em uma das vias, esse tempo é reajustado automaticamente, por pesos, se a opção dinâmica foi marcada.
- A conexão é mantida aberta para a placa enviar periodicamente o status de cada semáforo.
- Novos tempos só entram em vigor após o término do ciclo atual.

## Status
Mensagem de status enviada pela placa NIOS II é "CC":
- A primeira parte C (1 char) indica a cor do semáforo 0, e a segunda parte C (1 char) indica a cor do semáforo 1.
- Caso C seja R, o semáforo está vermelho; se Y, amarelo; se G, verde.

Web: 
na luz verde, os veículos se movimentam na simulação, 
na amarela terminam de ultrapassar o cruzamento se já estiverem atravessando ou param
e na luz vermelha, eles param.

## Displays 7 segmentos
- Barras horizontais indicam cada luz do semáforo (vermelho - superior, amarelo - do meio, verde - inferior).
- HEX7 = semáforo ID 0.
- HEX6 = semáforo ID 1.
- HEX(5, 4, 3) = contador do semáforo ID 0 (centena, dezena e unidade dos segundos restantes).
- HEX(2, 1, 0) = contador do semáforo ID 1 (centena, dezena e unidade dos segundos restantes).
- 3 displays da esquerda são a contagem regressiva do semáforo 0.
- 3 displays da direita são a contagem regressiva do semáforo 1.

## Arquitetura de Registradores

### Registradores de ESCRITA (para cada semáforo):

| Registrador | Offset | Descrição | Faixa |
|-------------|--------|-----------|-------|
| **REG0** | 0x00 | Tempo VERMELHO (segundos) | 0-999 |
| **REG1** | 0x04 | Tempo AMARELO (segundos) | 0-999 |
| **REG2** | 0x08 | Tempo VERDE (segundos) | 0-999 |
| **REG3** | 0x0C | Registro de CONTROLE | - |

#### REG3 - Registro de Controle:
- **bit 0**: START - Inicia operação do semáforo
- **bit 1**: STOP - Para operação do semáforo
- **bits [3:2]**: INITIAL_STATE - Estado inicial (00=IDLE, 01=RED, 10=YELLOW, 11=GREEN)
- **bit 4**: SEMAPHORE_ID - Qual semáforo (0 ou 1)

### Registradores de LEITURA (para cada semáforo):

| Registrador | Offset | Descrição |
|-------------|--------|-----------|
| **REG0** | 0x00 | STATUS - Estado atual |
| **REG1** | 0x04 | REMAINING_TIME - Tempo restante (segundos) |

#### REG0 - Registro de Status:
- **bits [1:0]**: STATE (00=IDLE/OFF, 01=RED, 10=YELLOW, 11=GREEN)
- **bit 2**: RUNNING - Semáforo está em operação

## Endereços Base

SEMAPHORE_0_BASE 0x1A82200
SEMAPHORE_1_BASE 0x1A82240

## Interrupção

Utiliza mailbox do Nios II e envia estados dos semáforos ao cliente que manteve a conexão aberta via socket.

COMO RODAR:

1 Utilize o Quartus II versão 13.0sp1
2 Descompacte .zip para obter a pasta interna DE2_NET. Este projeto deve estar na pasta da altera, por exemplo: C:\altera\13.0sp1\reconfigurable-logic\nios_ethernet\DE2_NET
3 Abra o DE2_NET.qpf
4 Vá na aba Files do Project Navigator e delete o arquivo system_0/synthesis/system_0.qip
4.1 Compile o projeto no Quartus.
5 Abre o Qsys em Tools->Qsys
6 Selecione o arquivo system_0.qsys e clique em Abrir
7 De OK ou Close no que aparecer
8 Va para aba Generation e clique em Generate
9 Feche o Qsys
10 No Project Navigator, aba Files, clique com o botão direito em Files->Add/Remove Files in Project
11 Clique no [...], entre em system_0/synthesis, mude o tipo de arquivo para todos, selecione o arquivo system_0.qip
12 Clique em Add-> Apply-> OK
13 Abra o Windows Defender, desativar Isolamento de núcleo e desativar permitir apenas drivers assinados
13.1 Vá no Gerenciador de Dispositivos do Windows
13.2 Encontre o dispositivo com um ícone amarelo (Altera USB-Blaster) (deve estar em Outros dispositivos ou Controladores USB (barramento serial universal))
13.3 Clique com o botão direito e selecione Atualizar driver
13.4 Selecione Procurar drivers no meu computador
13.5 Selecione Permitir que eu escolha em uma lista de drivers disponíveis no computador
13.8 Clique em Procurar... e vá até C:\altera\13.0sp1\quartus\drivers\usb-blaster
13.10 Clique em OK
13.12 Clique em Avançar
13.13 Clique em Fechar quando terminar a instalação
Abra o Programmer, aperte Auto Detect e aperte Start, caso o Progress esteja verde, continue caso contrário verifique conexão da JTAG
14 Deixe aberto o Programmer e a janela "OpenCore Plus Status" e inicie o Eclipse em Tools -> Nios II Software Build Tools for Eclipse
15 No Workspace selecione SeuCaminhoAtéaPasta\DE2_NET\software
16 Agora:
	16.1 Se os projetos simple_socket e simple_socket_bsp estão aparecendo e são expandíveis (pastinha cor amarela):
		16.1.1 Clique com o botão direito em cada projeto e clique em Clean Project
		16.1.2
			- Em simple_socket_server.h alterar o IPADDR para o IP que deseja atribuir a placa NIOS II (deve estar na mesma subrede do Gateway, exemplo 192.168.137.10)
			- Em simple_socket_server.h alterar o GWADDR para o IP do gateway da sua rede (normalmente o IP do roteador, usar ipconfig no Windows, exemplo 192.168.137.1)
			- Em simple_socket_server.h alterar o SSS_PORT para a porta que escolheu (exemplo 80)
			- Em system.h comentar #define DHCP_CLIENT para usar IP fixo
			- Desativar firewall do antivírus se tiver outro fora o Windows Defender instalado e permitir a porta escolhida no firewall do Windows Defender
		16.1.3 abra Nios II 13.0sp1 Command Shell e rode os comandos:
			cd SeuCaminhoAtéaPasta\DE2_NET\software\simple_socket_bsp
			make
			cd ../simple_socket
			make
			nios2-download -g simple_socket.elf && nios2-terminal
		16.1.4 Se der problemas no bsp:
			cd c:\altera\13.0sp1\reconfigurable-logic\nios_ethernet\DE2_NET\software\simple_socket_bsp
			nios2-bsp ucosii . ../../system_0.sopcinfo --set hal.make.bsp_cflags_defined_symbols -DTSE_MY_SYSTEM --cmd enable_sw_package altera_iniche
			nios2-bsp-generate-files --settings=settings.bsp --bsp-dir=.
			Repita o make do passo 16.1.3
		16.1.5 Se der algum erro na hora de rodar apenas, tente denovo, o Eclipse tem dessas
		16.1.6 Se rodar como deve, algo assim deve aparecer no Nios II Console:
			$ nios2-download -g simple_socket.elf && nios2-terminal
			Using cable "USB-Blaster [USB-0]", device 1, instance 0x00
			Pausing target processor: OK
			Initializing CPU cache (if present)
			OK
			Downloaded 299KB in 4.0s (74.7KB/s)
			Verified OK
			Starting processor at address 0x008001BC
			nios2-terminal: connected to hardware target using JTAG UART on cable
			nios2-terminal: "USB-Blaster [USB-0]", device 1, instance 0
			nios2-terminal: (Use the IDE stop button or Ctrl-C to terminate)


			NicheStack TCP/IP Stack initialized.
			InterNiche Portable TCP/IP, v3.1

			Copyright 1996-2008 by InterNiche Technologies. All rights reserved.
			Your Ethernet MAC address is 00:07:ed:ff:cd:15
			Static IP Address is 192.168.137.10
			prepped 1 interface, initializing...
			dm9ka_init
			Created "Inet main" task (Prio: 2)
			Created "clock tick" task (Prio: 3)
			NicheStack TCP/IP Stack main task started.
			mctest init called
			IP address of et1 : 192.168.137.10

			HTTP Server starting up
			Created "sss rx task" task (Prio: 8)
			Created "sss tx task" task (Prio: 9)
			[sss_rx_task] RX Task listening on port 80
			[sss_tx_task] TX Task started
		16.1.7 Se deu certo, precisa testar com um server agora. Primeiro pare o programa do Eclipse.
		16.1.8 Pegue o tcpserver.py (fazendo alterações de ip e porta do NIOS dentro, coloque o IP que definiu no IPADDR do simple_socket_server.h) fornecido 
		  e rode ele fazendo o comando python .\tcpserver.py na linha de comando no local que estiver o arquivo
		16.1.9 Rode novamente com Run As->Nios II Hardware
		16.1.10 Se o roteador não bloqueou nada, esta pronto!
		Basta abrir o site no navegador, por exemplo http://localhost:8080 e digitar a string, então clicar em Processar String
			No terminal que rodou tcpserver.py deve aparecer:
				PC HTTP Server for NIOS String Processor
				Server running on port 8080
				NIOS IP configured as: 192.168.137.10:80
				Open http://localhost:8080 in your browser
				Served index.html successfully
				Served NIOS IP: 192.168.137.10:80
			No NIOS II console, deve aparecer:
				[sss_handle_accept] accepted connection request from 192.168.137.1
				[sss_handle_receive] processing RX data
				[sss_handle_receive] receiving data on socket
				[sss_handle_receive] received 475 bytes
				[sss_handle_receive] complete HTTP request received
				[sss_exec_command] executing command on RX data
				[sss_exec_command] processing POST /process request
				[sss_exec_command] found body with length 3
				[sss_exec_command] processed data: bcd
				[sss_exec_command] sending response
				[sss_exec_command] response sent
			E no site aparecerá (pode apertar F12 para ver logs no console do navegador):
				Processed String: "string que vc enviou"
	16.2 Se os projetos simple_socket e simple_socket_bsp estão aparecendo e NÃO são expandíveis (pastinha cor azul):
		16.2.1 Delete ambos com botão direito -> Delete (sem deletar do computador)
		16.2.2 Botão direito no Project Explorer->Import...->Nios II Software Build Tools Project->
			   Import Custom Makefile for Nios II Software Build Tools Project-> Next->Browse...->
			   Vá para a pasta do projeto DE2_NET/software/simple_socket_bsp-> OK/Abrir
			   Project name: simple_socket_bsp
			   Faça a mesma coisa para o simple_socket (deixando o Project name SEM o _bsp)
		16.2.3 Retome a partir de 16.1.1

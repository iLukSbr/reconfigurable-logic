# -*- coding: utf-8 -*-

"""
Servidor Proxy (Ponte) WebSocket para Socket TCP

Esta aplicacao atende a 2 propositos:
1.  Cria um servidor WebSocket (para o qual a pagina HTML/JS pode se conectar).
2.  Abre uma conexao Socket TCP "crua" para a placa NIOS II.
3.  Faz a ponte de mensagens entre os dois.

Requisitos:
    pip install websockets

Como usar:
1.  Rode este script no seu PC: `python websocket_proxy.py`
2.  Abra o arquivo `client.html` no seu navegador.
"""

import asyncio
import websockets
import socket
import json
import threading

# Porta em que este servidor proxy ira rodar
PROXY_PORT = 8081
CLIENTS = {} # Dicionario para guardar conexoes (ws -> (reader, writer))

async def nios_listener(ws, reader, writer):
    """
    Escuta por dados vindos da placa NIOS (Socket TCP)
    e os encaminha para o cliente Web (WebSocket).
    """
    try:
        while True:
            # Espera por dados da placa NIOS
            data = await reader.read(1024) # Max 100 chars + margem
            if not data:
                print("Conexao TCP com NIOS fechada.")
                await ws.send(json.dumps({
                    "type": "error",
                    "message": "Conexao com a placa NIOS foi fechada."
                }))
                break
                
            message = data.decode('utf-8', 'ignore')
            print(f"NIOS -> Proxy: {message}")
            
            # Encaminha para o cliente Web
            await ws.send(json.dumps({
                "type": "data",
                "message": message
            }))
            
    except Exception as e:
        print(f"Erro no listener do NIOS: {e}")
        try:
            await ws.send(json.dumps({
                "type": "error",
                "message": f"Erro na comunicacao com NIOS: {e}"
            }))
        except:
            pass # Cliente web ja pode ter desconectado
    finally:
        writer.close()
        await writer.wait_closed()
        if ws in CLIENTS:
            del CLIENTS[ws]

async def handler(ws, path):
    """
    Gerencia conexoes WebSocket vindas do navegador.
    """
    print(f"Cliente Web conectado: {ws.remote_address}")
    
    try:
        # 1. Espera pela primeira mensagem (de conexao)
        message = await ws.recv()
        data = json.loads(message)
        
        if data.get("type") == "connect":
            board_ip = data.get("ip")
            board_port = data.get("port")
            
            print(f"Cliente Web solicitou conexao com: {board_ip}:{board_port}")
            
            try:
                # 2. Tenta conectar ao NIOS II (Socket TCP)
                reader, writer = await asyncio.open_connection(board_ip, board_port)
                
                # Guarda a conexao TCP
                CLIENTS[ws] = (reader, writer)
                
                # Confirma conexao para o cliente Web
                await ws.send(json.dumps({
                    "type": "status",
                    "success": True,
                    "message": f"Conectado a {board_ip}:{board_port}"
                }))
                
                # Inicia a tarefa de escuta do NIOS
                asyncio.create_task(nios_listener(ws, reader, writer))
                
                # 3. Loop principal: escuta mensagens do cliente Web
                async for message in ws:
                    try:
                        data = json.loads(message)
                        if data.get("type") == "data":
                            # Mensagem da pagina web para a placa
                            msg_to_nios = data.get("message", "")
                            print(f"Web -> Proxy: {msg_to_nios}")
                            
                            # Encaminha para o NIOS (Socket TCP)
                            writer.write(msg_to_nios.encode('utf-8'))
                            await writer.drain()
                    except json.JSONDecodeError:
                        print("Erro: Recebida mensagem nao-JSON")
                    except Exception as e:
                        print(f"Erro ao processar mensagem do cliente web: {e}")
                        break
                        
            except Exception as e:
                print(f"Falha ao conectar ao NIOS II: {e}")
                await ws.send(json.dumps({
                    "type": "status",
                    "success": False,
                    "message": str(e)
                }))

    except websockets.exceptions.ConnectionClosed:
        print(f"Cliente Web desconectado: {ws.remote_address}")
    except Exception as e:
        print(f"Erro inesperado no handler: {e}")
    finally:
        # Limpa a conexao TCP se existir
        if ws in CLIENTS:
            reader, writer = CLIENTS[ws]
            writer.close()
            await writer.wait_closed()
            del CLIENTS[ws]
            print("Conexao TCP com NIOS fechada.")

async def main():
    print(f"Servidor Proxy WebSocket rodando em ws://localhost:{PROXY_PORT}")
    print("Aguardando conexoes do client.html...")
    async with websockets.serve(handler, "localhost", PROXY_PORT):
        await asyncio.Future()  # Roda indefinidamente

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\nServidor proxy encerrado.")

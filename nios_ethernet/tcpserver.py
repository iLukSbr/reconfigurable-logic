import socket
import json
from http.server import BaseHTTPRequestHandler, HTTPServer
import threading
import argparse

# Configuration
HTTP_PORT = 8080
NIOS_IP = "192.168.137.66"  # Static NIOS IP in same subnet as PC
NIOS_PORT = 80            # Default NIOS webserver port

# Parse command line arguments
parser = argparse.ArgumentParser(description='PC HTTP Server for NIOS String Processor')
parser.add_argument('--nios-port', type=int, default=NIOS_PORT, help='NIOS webserver port (default: 80)')
args = parser.parse_args()
NIOS_PORT = args.nios_port

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        try:
            if self.path == '/':
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                try:
                    with open('index.html', 'rb') as f:
                        self.wfile.write(f.read())
                    print("Served index.html successfully")
                except FileNotFoundError:
                    error_msg = b'<html><body><h1>index.html not found</h1></body></html>'
                    self.wfile.write(error_msg)
                    print("index.html not found")
            elif self.path == '/get_nios_ip':
                self.send_response(200)
                self.send_header('Content-type', 'application/json')
                self.end_headers()
                response = {'ip': NIOS_IP, 'port': NIOS_PORT}
                self.wfile.write(json.dumps(response).encode())
                print(f"Served NIOS IP: {NIOS_IP}:{NIOS_PORT}")
            else:
                self.send_response(404)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b'<html><body><h1>404 Not Found</h1></body></html>')
                print(f"404 for path: {self.path}")
        except Exception as e:
            print(f"Error in do_GET: {e}")
            self.send_response(500)
            self.end_headers()

    def log_message(self, format, *args):
        # Suppress default logging
        pass

if __name__ == '__main__':
    print("PC HTTP Server for NIOS String Processor")
    print(f"Server running on port {HTTP_PORT}")
    print(f"NIOS IP configured as: {NIOS_IP}:{NIOS_PORT}")
    print("Open http://localhost:8080 in your browser")

    server_address = ('', HTTP_PORT)
    httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nHTTP Server stopped")
        httpd.shutdown()

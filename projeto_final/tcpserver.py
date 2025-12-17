import socket
import json
from http.server import BaseHTTPRequestHandler, HTTPServer
import threading
import argparse
import os
import mimetypes

# Configuration
HTTP_PORT = 8080
NIOS_IP = "192.168.137.10"  # Static NIOS IP in same subnet as PC
NIOS_PORT = 80            # Default NIOS webserver port

# Parse command line arguments
parser = argparse.ArgumentParser(description='PC HTTP Server for NIOS String Processor')
parser.add_argument('--nios-port', type=int, default=NIOS_PORT, help='NIOS webserver port (default: 80)')
args = parser.parse_args()
NIOS_PORT = args.nios_port

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        try:
            print(f"→ Received GET request for path: {self.path}")
            if self.path == '/':
                self.send_response(200)
                self.send_header('Content-type', 'text/html; charset=utf-8')
                self.send_header('Cache-Control', 'no-cache')
                self.end_headers()
                try:
                    with open('index.html', 'rb') as f:
                        content = f.read()
                        self.wfile.write(content)
                    print("✓ Served index.html successfully")
                except FileNotFoundError:
                    error_msg = b'<html><body><h1>index.html not found</h1><p>Place index.html in the same directory as tcpserver.py</p></body></html>'
                    self.wfile.write(error_msg)
                    print("✗ index.html not found in current directory")
            elif self.path == '/get_nios_ip':
                self.send_response(200)
                self.send_header('Content-type', 'application/json')
                self.send_header('Access-Control-Allow-Origin', '*')
                self.send_header('Cache-Control', 'no-cache')
                self.end_headers()
                response = {'ip': NIOS_IP, 'port': NIOS_PORT}
                self.wfile.write(json.dumps(response).encode('utf-8'))
                print(f"✓ Served NIOS IP config: {NIOS_IP}:{NIOS_PORT}")
            elif self.path == '/favicon.ico':
                file_path = os.path.join('images', 'favicon.ico')
                if os.path.exists(file_path):
                    self.send_response(200)
                    self.send_header('Content-type', 'image/x-icon')
                    self.send_header('Cache-Control', 'public, max-age=3600')
                    self.end_headers()
                    with open(file_path, 'rb') as f:
                        self.wfile.write(f.read())
                    print("✓ Served favicon.ico")
                else:
                    self.send_response(404)
                    self.send_header('Content-type', 'text/html')
                    self.end_headers()
                    self.wfile.write(b'<html><body><h1>404 Not Found</h1></body></html>')
                    print("✗ favicon.ico not found in images/")
            else:
                # Serve static files (images, css, js, etc.)
                file_path = self.path.lstrip('/')
                if os.path.exists(file_path) and os.path.isfile(file_path):
                    # Determine content type
                    content_type, _ = mimetypes.guess_type(file_path)
                    if content_type is None:
                        content_type = 'application/octet-stream'
                    
                    self.send_response(200)
                    self.send_header('Content-type', content_type)
                    self.send_header('Cache-Control', 'public, max-age=3600')
                    self.end_headers()
                    
                    with open(file_path, 'rb') as f:
                        self.wfile.write(f.read())
                    print(f"✓ Served {file_path}")
                else:
                    self.send_response(404)
                    self.send_header('Content-type', 'text/html')
                    self.end_headers()
                    self.wfile.write(b'<html><body><h1>404 Not Found</h1></body></html>')
                    print(f"✗ 404 for path: {self.path} (file not found: {file_path})")
        except BrokenPipeError:
            print("✗ Client disconnected before response completed")
        except Exception as e:
            print(f"✗ Error in do_GET: {e}")
            try:
                self.send_response(500)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(f'<html><body><h1>500 Server Error</h1><p>{e}</p></body></html>'.encode())
            except:
                pass

    def log_message(self, format, *args):
        # Custom logging with timestamp
        print(f"[{self.log_date_time_string()}] {format % args}")

if __name__ == '__main__':
    print("="*60)
    print("PC HTTP Server for NIOS Semaphore Control")
    print("="*60)
    print(f"✓ Server running on http://localhost:{HTTP_PORT}")
    print(f"✓ NIOS IP configured as: {NIOS_IP}:{NIOS_PORT}")
    print(f"✓ Open http://localhost:{HTTP_PORT} in your browser")
    print("="*60)
    print("Waiting for connections...")
    print()

    server_address = ('', HTTP_PORT)
    httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
    httpd.timeout = 1  # 1 second timeout to allow keyboard interrupt
    
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n" + "="*60)
        print("✓ HTTP Server stopped by user")
        print("="*60)
        httpd.shutdown()

import socket
import json
from http.server import BaseHTTPRequestHandler, HTTPServer
import threading
import argparse
import os
import mimetypes

# Get the directory where this script is located
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

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
            # Parse path to handle query strings
            path_without_query = self.path.split('?')[0]
            
            if path_without_query == '/':
                self.send_response(200)
                self.send_header('Content-type', 'text/html; charset=utf-8')
                self.send_header('Cache-Control', 'no-cache')
                self.end_headers()
                try:
                    index_path = os.path.join(SCRIPT_DIR, 'index.html')
                    with open(index_path, 'rb') as f:
                        content = f.read()
                        self.wfile.write(content)
                    print("✓ Served index.html successfully")
                except FileNotFoundError:
                    error_msg = b'<html><body><h1>index.html not found</h1><p>Place index.html in the same directory as tcpserver.py</p></body></html>'
                    self.wfile.write(error_msg)
                    print(f"✗ index.html not found in script directory: {SCRIPT_DIR}")
            elif path_without_query == '/get_nios_ip':
                self.send_response(200)
                self.send_header('Content-type', 'application/json')
                self.send_header('Access-Control-Allow-Origin', '*')
                self.send_header('Cache-Control', 'no-cache')
                self.end_headers()
                
                # Test NIOS connectivity
                nios_available = self.test_nios_connection()
                
                response = {
                    'ip': NIOS_IP, 
                    'port': NIOS_PORT,
                    'available': nios_available,
                    'useSimulator': not nios_available
                }
                self.wfile.write(json.dumps(response).encode('utf-8'))
                
                if nios_available:
                    print(f"✓ Served NIOS IP config: {NIOS_IP}:{NIOS_PORT} (NIOS available)")
                else:
                    print(f"⚠ Served NIOS IP config: {NIOS_IP}:{NIOS_PORT} (NIOS unavailable - simulator enabled)")
            elif path_without_query == '/favicon.ico':
                file_path = os.path.join(SCRIPT_DIR, 'images', 'favicon.ico')
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
                    print(f"✗ favicon.ico not found in {os.path.join(SCRIPT_DIR, 'images/')}")
            else:
                # Serve static files (images, css, js, etc.)
                relative_path = path_without_query.lstrip('/')
                file_path = os.path.join(SCRIPT_DIR, relative_path)
                # Security check: ensure the requested file is within SCRIPT_DIR
                file_path = os.path.abspath(file_path)
                if not file_path.startswith(os.path.abspath(SCRIPT_DIR)):
                    self.send_response(403)
                    self.send_header('Content-type', 'text/html')
                    self.end_headers()
                    self.wfile.write(b'<html><body><h1>403 Forbidden</h1></body></html>')
                    print(f"✗ 403 Forbidden: Path traversal attempt detected for {self.path}")
                elif os.path.exists(file_path) and os.path.isfile(file_path):
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
                    print(f"✓ Served {relative_path}")
                else:
                    self.send_response(404)
                    self.send_header('Content-type', 'text/html')
                    self.end_headers()
                    self.wfile.write(b'<html><body><h1>404 Not Found</h1></body></html>')
                    print(f"✗ 404 for path: {self.path} (file not found: {relative_path})")
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

    def test_nios_connection(self):
        """Test if NIOS is reachable by attempting a connection"""
        try:
            # Try to connect to NIOS with a short timeout
            test_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            test_socket.settimeout(2)  # 2 second timeout
            result = test_socket.connect_ex((NIOS_IP, NIOS_PORT))
            test_socket.close()
            return result == 0  # Return True if connection successful
        except Exception as e:
            print(f"⚠ NIOS connection test failed: {e}")
            return False
    
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

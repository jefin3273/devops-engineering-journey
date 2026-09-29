from http.server import BaseHTTPRequestHandler, HTTPServer


def get_response(path):
    if path == "/health":
        return 200, "application/json", '{"status":"healthy"}'

    if path == "/":
        return 200, "text/plain", "DevOps CI/CD Demo Application"

    return 404, "text/plain", "Not Found"


class Handler(BaseHTTPRequestHandler):

    def do_GET(self):
        status, content_type, body = get_response(self.path)

        self.send_response(status)
        self.send_header("Content-Type", content_type)
        self.end_headers()
        self.wfile.write(body.encode())

    def log_message(self, format, *args):
        print(format % args)


def run():
    server = HTTPServer(("0.0.0.0", 8000), Handler)
    print("Server running on port 8000")
    server.serve_forever()


if __name__ == "__main__":
    run()

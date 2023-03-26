from flask import Flask, request
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

app = Flask(__name__)

# Configure rate limiting with a default rate of 10 requests per minute
limiter = Limiter(app, key_func=get_remote_address, default_limits=["10 per minute"])

# Define a route that is rate limited
@app.route('/api')
@limiter.limit("5/minute")
def api():
    return "Hello, World!"

if __name__ == '__main__':
    app.run()

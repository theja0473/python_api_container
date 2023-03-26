from flask import Flask, request
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
from flask import jsonify

app = Flask(__name__)

limiter = Limiter(key_func=get_remote_address)

@app.route('/api')
@limiter.limit("5/minute")
def api():
    return "Hello, World!"

@app.route("/get_my_ip", methods=["GET"])
def get_my_ip():
    return jsonify({'ip': request.remote_addr}), 200

if __name__ == '__main__':
    app.run()

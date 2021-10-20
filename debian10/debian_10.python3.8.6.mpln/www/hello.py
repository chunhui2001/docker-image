from flask import Flask, make_response, request

import logging

logger = logging.getLogger(__name__)

logging.getLogger("pano.matcher").setLevel(logging.INFO)
log_level = logging.ERROR


app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello World'

@app.route('/info')
def info():
    response = make_response('this is info page', 200)
    response.mimetype = "text/plain"
    return response

if __name__ == '__main__':
    app.debug = True # 设置调试模式，生产模式的时候要关掉debug
    app.run()

from flask import Flask, make_response

import logging
import coloredlogs

logger = logging.getLogger(__name__)

logging.getLogger("pano.matcher").setLevel(logging.INFO)
log_level = logging.INFO

coloredlogs.install(
    level=log_level,
    fmt="%(asctime)s %(name)s %(message)s",
    datefmt="%H:%M:%S",
    field_styles={"asctime": {"color": "white", "faint": True}},
)

app = Flask(__name__)

@app.route('/')
def index():
    response = make_response('Hello World', 200)
    response.mimetype = "text/plain"
    logger.info('hello.....')
    return response

@app.route('/info')
def info():
    response = make_response('this is info page', 200)
    response.mimetype = "text/plain"
    return response

if __name__ == "__main__":
    app.debug = True
    app.run()
else:
    app.debug = False
    application = app
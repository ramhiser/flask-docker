from flask import Flask
from foo.bar import hello_world
app = Flask(__name__)


@app.route('/')
def my_route():
    return hello_world()

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

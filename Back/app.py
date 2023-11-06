from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    return '<h1>Hello from Flask & Docker</h2>'

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 6000))
    app.run(debug=True, host='127.0.0.1', port=port)
import os
import flask
import pyrebase
from dotenv import load_dotenv
from fireabse_authentification import FirebaseAuthentification
from token_service import TokenService
from flask_cors import CORS

if os.path.exists('.env.local'):
    load_dotenv('.env.local')
else:
    load_dotenv()

app = flask.Flask(__name__)

def set_up_pyrebase():
    config = {
        "apiKey": os.getenv('API_KEY'),
        "authDomain": os.getenv('AUTH_DOMAIN'),
        "projectId": os.getenv('PROJECT_ID'),
        "storageBucket": os.getenv('STORAGE_BUCKET'),
        "messagingSenderId": os.getenv('MESSAGING_SENDER_ID'),
        "databaseURL": os.getenv('DATABASE_URL'),
        "appId": os.getenv('APP_ID')
    }

    return pyrebase.initialize_app(config)

firebase = set_up_pyrebase()

@app.route('/')
def home():
    return '<h2>Hello from Flask & Docker</h2>'

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))

    CORS(app, resources={r"/login": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/register": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/logout": {"origins": os.getenv('URL_FRONT')}})

    FirebaseAuthentification(app, firebase=firebase)
    TokenService(app=app)
    app.run(debug=True, host='0.0.0.0', port=port)
import os
import flask
from controllers.dbController import  createTablesDB, indexMoviesDB
import pyrebase
from dotenv import load_dotenv
from fireabse_authentification import FirebaseAuthentification
from token_service import TokenService
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
import pandas as pd
from flask_sqlalchemy import SQLAlchemy


if os.path.exists('.env.local'):
    load_dotenv('.env.local')
else:
    load_dotenv()

app = flask.Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:password@database:3306/movie_recommendation'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


# Initialize the database connection
db = SQLAlchemy(app)

# Define movie table model
class movieTable(db.Model):
    __tablename__ = 'movie'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(255))
    def create_from_csv(csv_file):
        # Read the CSV file into a DataFrame
        df = pd.read_csv(csv_file)
        # Iterate through each row in the DataFrame and insert into the table
        for _, row in df.iterrows():
            movie = movieTable(id=row[0], title=row[1])
            db.session.add(movie )
        # Commit the changes to the database
        db.session.commit()

# Define movieRating table model
class movieRating(db.Model):
    __tablename__ = 'movie_rating'
    id = db.Column(db.Integer, primary_key=True)
    rating = db.Column(db.Integer)
    user_id = db.Column(db.Integer)
    movie_id = db.Column(db.Integer)

# Define movieRecommended table model
class movieRecommended(db.Model):
    __tablename__ = 'movie_recommended'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer)
    movie_id = db.Column(db.Integer)

# Define user table model
class user(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(255))
    email = db.Column(db.String(255))



# Setup pyrebase
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


# @app.route('/create-user')
# def createUser():
#     createUserDB(db,user,username,email):
#     return '<h2>User created succeffully</h2>'


#  Create tables 
@app.route('/create-tables')
def createTables():
    createTablesDB(db,movieTable,movieRating,movieRecommended,user)
    return '<h2>Tables created succeffully</h2>'

# Index movies using CSV movies file
@app.route('/index-movies')
def indexMovies():
    indexMoviesDB(movieTable)
    return '<h2>Movie Table indexed succeffully</h2>'


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    # print("os.getenv('URL_FRONT') ====>>>>  ",os.getenv('URL_FRONT'))
    CORS(app, resources={r"/login": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/register": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/logout": {"origins": os.getenv('URL_FRONT')}})
    FirebaseAuthentification(app, firebase=firebase, db=db, userTable=user)
    TokenService(app=app)
    app.run(debug=True, host='0.0.0.0', port=port) 
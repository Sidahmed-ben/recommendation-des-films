import os
import flask
from sqlalchemy import func
from controllers.dbController import  createTablesDB, indexMoviesDB
import pyrebase
from dotenv import load_dotenv
from fireabse_authentification import FirebaseAuthentification
from token_service import TokenService
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
import pandas as pd
from flask_sqlalchemy import SQLAlchemy
import re
import copy


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


@app.route('/get-movie-to-recommend', methods=['GET'])
def get_movies_to_recommend():
    # Get 6 random: rows from the database
    random_rows = movieTable.query.order_by(func.random()).limit(6).all()
    # Use a regular expression to find the year within parentheses
    movie_rec: list = []

    # Convert the results to a dictionary
    for row in random_rows :
        result = {}
        result['id'] = row.id 
        result['title'] =  row.title  
        match = re.search(r'\((\d{4})\)', result['title'])

        # Check if a match is found
        if match:
            year = match.group(1)
            result['year'] = year
            result['title'] = re.sub(r'\(\d{4}\)', '', result['title']).strip()
        else:
            result['year'] = 0
        movie_rec.append(result)
    return flask.jsonify(movie_rec)


#  Create tables 
@app.route('/create-tables')
def create_tables():
    createTablesDB(db,movieTable,movieRating,movieRecommended,user)
    return '<h2>Tables created successfully</h2>'

# Index movies using CSV movies file
@app.route('/index-movies')
def index_movies():
    indexMoviesDB(movieTable)
    return '<h2>Movie Table indexed successfully</h2>'


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    CORS(app, resources={r"/login": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/register": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/logout": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/get-movie-to-recommend": {"origins": os.getenv('URL_FRONT')}})

    FirebaseAuthentification(app, firebase=firebase, db=db, userTable=user)
    TokenService(app=app)
    app.run(debug=True, host='0.0.0.0', port=port) 
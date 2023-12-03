import re
import os
import random
import flask
from sqlalchemy import func
import tensorflow as tf
from controllers.learning import recommander_function
from controllers.dbController import  addUserRatingDB, addUserRecommendedDB, concatenateUserRatings, createTablesDB, getUserByEmail, getUserRatingsDB, getUserRecommendedMoviesDB, indexMoviesDB
import pyrebase
from dotenv import load_dotenv
from fireabse_authentification import FirebaseAuthentification
from token_service import TokenService
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask import request
import pandas as pd
from flask_sqlalchemy import SQLAlchemy
import pickle as pkl

from sqlalchemy.orm import aliased


if os.path.exists('.env.local'):
    load_dotenv('.env.local')
else:
    load_dotenv()

app = flask.Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:password@database:3306/movie_recommendation'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize the database connection
db = SQLAlchemy(app)

invalid_token_response = {"error": "Invalid token"}

# Define tokenservice object 
token_service = None  

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


def save_model(model_path):
    # Charger le modèle à partir du fichier
    loaded_model = pkl.load(open(model_path, 'rb'))
    # Downloading our best model that was picked up by Model-Checkpoint
    # best_model = tf.keras.models.load_model(model_path)
    movies = pd.read_csv("./movies_dataset/movies.csv")
    ratings = pd.read_csv("./movies_dataset/ratings.csv")
    # Extract the movieIds from the movies DataFrame
    valid_movie_ids = movies['movieId'].tolist() 
    # Filter the ratings DataFrame based on valid movieIds
    filtered_ratings = ratings[ratings['movieId'].isin(valid_movie_ids)]
    return loaded_model,movies,filtered_ratings

# Download Model
knnModel,movies,ratings = save_model("./RecommandationAlgo/NearestNeighborsModel")
    
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

@app.route('/get-user-ratings', methods=['POST'])
def get_user_ratings():
    body = request.get_json()
    token = body["token"]
    resp = token_service.verify(token)
    if("decode" in resp and "email" in resp["decode"]):
        email = resp["decode"]["email"]
        user_data = getUserByEmail(user,email)
        ratings_list = getUserRatingsDB(db,movieTable,movieRating,user_data.id)
        return flask.jsonify(ratings_list)

    else:
        return flask.jsonify(invalid_token_response)

@app.route('/get-recommended-by-user', methods=['POST'])
def get_recommanded_by_user():
    body = request.get_json()
    token = body["token"]

    resp = token_service.verify(token)
    if("decode" in resp and "email" in resp["decode"]):
        email = resp["decode"]["email"]
        user_data = getUserByEmail(user,email)
        ratings_list = getUserRecommendedMoviesDB(db,movieTable,movieRecommended,user_data.id)
        return flask.jsonify(ratings_list)
    else:
        return flask.jsonify(invalid_token_response)

@app.route('/get-movies-to-recommend', methods=['POST'])
def get_movies_to_recommend():
    body = request.get_json()
    token = body["token"]

    resp = token_service.verify(token)

    if("decode" in resp and "email" in resp["decode"]):
        email = resp["decode"]["email"]
        user_data = getUserByEmail(user, email)

        # Create an alias for the movieRating table to avoid conflicts
        movie_rating_alias = aliased(movieRating)
        # Query for 50 random rows with selected columns, including movies the user has not rated
        random_rows = db.session.query(movieTable.id, movieTable.title).\
        outerjoin(movie_rating_alias, (movieTable.id == movie_rating_alias.movie_id) & (movie_rating_alias.user_id == user_data.id)).\
        filter(movie_rating_alias.id == None).\
        order_by(func.random()).\
        limit(6).all()
        # Use a regular expression to find the year within parentheses
        movie_rec: list = []
        body = request.get_json()
        # Convert the results to a dictionary

        for row in random_rows :
            result = {}
            result["id"] = row.id 
            result['title'] =  row.title  
            match = re.search(r'\((\d{4})\)', result['title'])
            # Check if a match is found
            if match:
                year = match.group(1)
                result["year"] = year
                result["title"] = re.sub(r'\(\d{4}\)', '', result["title"]).strip()
            else:
                result["year"] = 0
            movie_rec.append(result)

        return flask.jsonify(movie_rec)
    else:
        return flask.jsonify(invalid_token_response)


@app.route('/get-recommanded-movies', methods=['POST'])
def get_recommanded_movies():
    body = request.get_json()
    token = body["token"]
    movies_ratings = body["moviesRatings"]

    resp = token_service.verify(token)
    if("decode" in resp and "email" in resp["decode"]):
        email = resp["decode"]["email"]
        user_data = getUserByEmail(user,email)
        for movie_item in movies_ratings:
            addUserRatingDB(db,movieRating,user_data.id,movie_item["movieId"],movie_item["rating"])
        new_ratings = concatenateUserRatings(db,movieRating,user_data.id,movies_ratings)
        specific_movies_rows = recommander_function(50, knnModel,movies,ratings, userRatings=new_ratings)
        df_list = specific_movies_rows.to_dict(orient='records')
        recommended_list = []
         # Convert the results to a dictionary
        for row in df_list :
            result = {}
            result["id"] = row['movieId']
            result['title'] =  row['title']
            match = re.search(r'\((\d{4})\)', result['title'])
            # Check if a match is found
            if match:
                year = match.group(1)
                result["year"] = year
                result["title"] = re.sub(r'\(\d{4}\)', '', result["title"]).strip()
                # return int(year)
            else:
                result["year"] = 0
            recommended_list.append(result)
            # save user rec movies 
        random.shuffle(recommended_list)
        recommended_list = recommended_list[:10]
        for row in recommended_list :
            addUserRecommendedDB(db,movieRecommended,user_data.id,row['id'])
        resp = token_service.verify(token)
        return flask.jsonify(recommended_list)
    else:
        return flask.jsonify(invalid_token_response)


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
    CORS(app, resources={r"/get-movies-to-recommend": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/get-user-ratings": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/get-recommanded-movies": {"origins": os.getenv('URL_FRONT')}})
    CORS(app, resources={r"/get-recommended-by-user": {"origins": os.getenv('URL_FRONT')}})

    FirebaseAuthentification(app, firebase=firebase, db=db, userTable=user)
    token_service = TokenService(app=app)
    app.run(debug=True, host='0.0.0.0', port=port) 
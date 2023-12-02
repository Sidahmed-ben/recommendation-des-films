import re


def indexMoviesDB(movieTable):
    movieTable.create_from_csv('./movies_dataset/movies.csv')


def createTablesDB(db,movieTable,movieRating,movieRecommended,user):
    db.create_all()
    db.session.query(movieTable).delete()
    db.session.commit()
    db.session.query(movieRating).delete()
    db.session.commit()
    db.session.query(movieRecommended).delete()
    db.session.commit()
    db.session.query(user).delete()
    db.session.commit()

def createUserDB(db,user,username,email):
    # createUserDb(user)
    newUser = user(username=username,email=email)
    db.session.add(newUser)
    db.session.commit()



def getMoviesIdDB(movieTable):# Use the query method to retrieve the movie with the specified ID
    # Requête pour récupérer tous les IDs des films
    all_movie_ids = [movie.id for movie in movieTable.query.all()]
    return all_movie_ids

def getUserByEmail(userTable,email):# Use the query method to retrieve the movie with the specified ID
    # Requête pour récupérer tous les IDs des films
    user = userTable.query.filter_by(email=email).first()
    return user

def addUserRatingDB(db,movieRating,user_id_value,movie_id_value,rating_value):
    # Check if the record already exists
    existing_rating = movieRating.query.filter_by(user_id=user_id_value, movie_id=movie_id_value).first()

    if existing_rating:
        # If the record exists, update the existing row
        existing_rating.rating = rating_value
    else:
    # If the record doesn't exist, create a new row
        new_rating = movieRating(rating=rating_value, user_id=user_id_value, movie_id=movie_id_value)
        db.session.add(new_rating)
    # Commit the changes to the database
    db.session.commit()

def getUserRatingsDB(db,movieTable,movieRatingTable,user_id_value):
     # Query ratings for a specific user_id
    user_ratings_with_titles = db.session.query(movieRatingTable.rating, movieTable.title).\
    join(movieTable, movieRatingTable.movie_id == movieTable.id).\
    filter(movieRatingTable.user_id == user_id_value).all()
    ratings_list = []
    for rating, title in user_ratings_with_titles:
        rating_item = {}
        rating_item["title"] = title
        rating_item["rating"] = rating
        match = re.search(r'\((\d{4})\)', rating_item['title'])
        # Check if a match is found
        if match:
            year = match.group(1)
            rating_item["year"] = year
            rating_item["title"] = re.sub(r'\(\d{4}\)', '', rating_item["title"]).strip()
            # return int(year)
        else:
            rating_item["year"] = 0
        ratings_list.append(rating_item)
    return ratings_list



def concatenateUserRatings(db,movieRating,user_id,new_ratings):
    # Requête pour obtenir les notes des films d'un utilisateur spécifique
     # Requête pour obtenir les notes des films d'un utilisateur spécifique
    user_ratings = db.session.query(movieRating.movie_id, movieRating.rating).\
        filter(movieRating.user_id == user_id).all()
    movies_ratings_list = [{"movieId": movie_id, "rating": rating} for movie_id, rating in user_ratings]
    for movie_info in new_ratings:
        movieId = movie_info["movieId"]
        rating = movie_info["rating"]
        is_movie_id_included = any(entry["movieId"] == movieId for entry in movies_ratings_list)
        if(not is_movie_id_included):
            movies_ratings_list.append({"movieId": movieId, "rating": rating})
    return movies_ratings_list


def addUserRecommendedDB(db,movieRecommanded,user_id_value,movie_id_value):
        # Check if the record already exists
    existing_rating = movieRecommanded.query.filter_by(user_id=user_id_value, movie_id=movie_id_value).first()
    if existing_rating:
        return
    else:
        # Create a new movieRating instance
        new_rec = movieRecommanded(user_id=user_id_value, movie_id=movie_id_value)
        # Add the new instance to the session
        db.session.add(new_rec)
        # Commit the changes to the database
        db.session.commit()



def getUserRecommendedMoviesDB(db,movieTable,movieRecommanded,user_id_value):
    recommended_movies = db.session.query(movieTable.title).\
    join(movieRecommanded, movieTable.id == movieRecommanded.movie_id).\
    filter(movieRecommanded.user_id == user_id_value).all()
    ratings_list = []
    for (title,) in recommended_movies:
        rating_item = {}
        rating_item["title"] = title
        match = re.search(r'\((\d{4})\)', rating_item['title'])
        # Check if a match is found
        if match:
            year = match.group(1)
            rating_item["year"] = year
            rating_item["title"] = re.sub(r'\(\d{4}\)', '', rating_item["title"]).strip()
            # return int(year)
        else:
            rating_item["year"] = 0
        ratings_list.append(rating_item)
    return ratings_list

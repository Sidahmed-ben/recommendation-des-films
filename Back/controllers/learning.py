import random
import pandas as pd
from scipy.sparse import csr_matrix
from controllers.dbController import getMoviesIdDB

def recommander_function(n,model,movies,ratings,userRatings):
    
    movies_users = ratings.pivot_table(index='userId',columns="movieId", values="rating", aggfunc='mean').fillna(0)

    # # compressed_movies_users = csr_matrix(movies_users)
    # print("##################")
    # print("##################")
    # # print("Modeel officiel shape =>> ",compressed_movies_users.shape)
    # print("##################")
    # print("##################")
    
    model_input =  get_model_input(movies_users,userRatings)
    distance, indices  = model.kneighbors(model_input, n_neighbors=n)

    # print(distance)
    # print(indices)
    indices = indices[0]
    best_movies_ids = []
    for i in indices :
        similar_users = movies_users.iloc[i]
        top_movies = similar_users[(similar_users == 5)]
        # top_movies = similar_users[(similar_users == 5) | (similar_users == 4)]
        best_movies_ids += top_movies.index.tolist()
    best_movies_ids = list(set(best_movies_ids))
    # print(best_movies_ids)
    specific_movies_rows = movies[movies['movieId'].isin(best_movies_ids)]
    # print(specific_movies_rows)

    return specific_movies_rows 
    # print(movies.loc[best_movies_ids])


def get_model_input(movies_users,userRatings):
    movie_ids_list = movies_users.columns.tolist()
        
    # Votre liste d'objets représentant les évaluations des utilisateurs
    user_ratings_list = [
        {
            'userId': '999',
            'moviesRatings': userRatings
        },
    ]

    # Créer une DataFrame initiale avec tous les userId et movieId prédéfinis
    user_ratings_df = pd.DataFrame([(user, movie) for user in ['999'] for movie in movie_ids_list], columns=['userId', 'movieId'])

    # Fusionner avec la liste des notations pour remplir les notations existantes
    for user_rating in user_ratings_list:
        user_id = user_rating['userId']
        movies_ratings = user_rating['moviesRatings']

        for movie_rating in movies_ratings:
            movie_id = movie_rating['movieId']
            rating = movie_rating['rating']

            # Mettre à jour la valeur de notation dans la DataFrame
            user_ratings_df.loc[(user_ratings_df['userId'] == user_id) & (user_ratings_df['movieId'] == movie_id), 'rating'] = rating

    # Remplir les valeurs manquantes avec 0
    user_ratings_df['rating'].fillna(0, inplace=True)

    # print(user_ratings_df)

    # Utiliser pivot_table pour recréer la structure d'origine
    movies_users_recreated = user_ratings_df.pivot_table(index='userId', columns='movieId', values='rating', aggfunc='mean').fillna(0)

    # Convertir en une matrice creuse csr_matrix
    compressed_movies_users_recreated = csr_matrix(movies_users_recreated)
    # print("##################")
    # print("##################")
    # print("Mon  model shape =>> ",compressed_movies_users_recreated.shape)
    # print("##################")
    # print("##################")

    return compressed_movies_users_recreated[0]
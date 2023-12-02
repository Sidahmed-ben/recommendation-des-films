import pandas as pd
from scipy.sparse import csr_matrix



# def get_model_input():
#     # Liste prédéfinie de movieId
#     moviesIdList = [10, 19, 25, 30, 42]  # Remplacez ceci par votre propre liste

#     # Votre liste d'objets représentant les évaluations des utilisateurs
#     user_ratings_list = [
#         {
#             'userId': '999',
#             'moviesRatings': [
#                 {'movieId': 42, 'rating': 1},
#                 {'movieId': 19, 'rating': 5},
#                 # ... d'autres évaluations
#             ]
#         },
#         # ... d'autres utilisateurs
#     ]

#     # Créer une DataFrame initiale avec tous les userId et movieId prédéfinis
#     user_ratings_df = pd.DataFrame([(user, movie) for user in ['999'] for movie in moviesIdList], columns=['userId', 'movieId'])

#     # Fusionner avec la liste des notations pour remplir les notations existantes
#     for user_rating in user_ratings_list:
#         user_id = user_rating['userId']
#         movies_ratings = user_rating['moviesRatings']

#         for movie_rating in movies_ratings:
#             movie_id = movie_rating['movieId']
#             rating = movie_rating['rating']

#             # Mettre à jour la valeur de notation dans la DataFrame
#             user_ratings_df.loc[(user_ratings_df['userId'] == user_id) & (user_ratings_df['movieId'] == movie_id), 'rating'] = rating

#     # Remplir les valeurs manquantes avec 0
#     user_ratings_df['rating'].fillna(0, inplace=True)

#     # print(user_ratings_df)

#     # Utiliser pivot_table pour recréer la structure d'origine
#     movies_users_recreated = user_ratings_df.pivot_table(index='userId', columns='movieId', values='rating', aggfunc='mean').fillna(0)

#     # Convertir en une matrice creuse csr_matrix
#     compressed_movies_users_recreated = csr_matrix(movies_users_recreated)
#     return compressed_movies_users_recreated[0]


# get_model_input()

import re  # Make sure this line is present


movies = pd.read_csv("./movies_dataset/movies.csv")


# Regular expression to extract the year from the title
def extract_year(title):
    match = re.search(r'\((\d{4})\)', title)
    if match:
        try:
            year = int(match.group(1))
            return year
        except ValueError:
            return None
    else:
        return None

# Apply the function to create a new 'year' column
movies['year'] = movies['title'].apply(extract_year)

# Filter movies with a year greater than 2010 or movies without a year
filtered_movies = movies[(movies['year'].isna()) | (movies['year'] > 2014)]

# Display the filtered DataFrame
print(filtered_movies)


# Save the DataFrame to a CSV file
filtered_movies.to_csv('output.csv', index=False)
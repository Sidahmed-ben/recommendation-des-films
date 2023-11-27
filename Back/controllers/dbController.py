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


def getMoviesToRecommendDB(db,user,username,email):
    # createUserDb(user)
    newUser = user(username=username,email=email)
    db.session.add(newUser)
    db.session.commit()
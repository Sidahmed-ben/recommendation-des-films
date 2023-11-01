import { React, useContext, useEffect } from 'react'
import Button from '@mui/material/Button'
import MovieContext from '../../MovieData'

function GenresMovies () {
    const {
        getGenresMovies, genres, setSelectedGenre, selectedGenre, getMoviesByGenres, getMovies, setMovies,
        setPage, searchName, searchMovieByName
    } = useContext(MovieContext)

    useEffect(() => {
        getGenresMovies()
    }, [getGenresMovies])

    useEffect(() => {
        if (selectedGenre !== 0) {
            getMoviesByGenres(0)
        } else {
            setPage(1)
            setMovies([])

            if (searchName) {
                searchMovieByName(searchName)
            } else {
                getMovies()
            }
        }
    }, [selectedGenre])

    const handleSelectGenre = (genreId) => {
        selectedGenre === genreId ? setSelectedGenre(0) : setSelectedGenre(genreId)
    }

    return (
        <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center', padding: '0.5rem' }}>
            {genres.map((genre) => (
                <Button
                    key={genre.id}
                    style={{ margin: '0.5rem', fontSize: '15px', borderRadius: '1.5rem' }}
                    onClick={() => handleSelectGenre(genre.id)}
                    variant={selectedGenre === genre.id ? 'contained' : 'outlined'}
                    color="primary"
                    size="medium"
                >
                    {genre.name}
                </Button>
            ))}
        </div>
    )
}

export default GenresMovies

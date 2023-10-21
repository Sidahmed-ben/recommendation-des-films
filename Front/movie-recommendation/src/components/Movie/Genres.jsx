import { useContext, useEffect } from 'react';
import Button from '@mui/material/Button';
import MovieContext from '../../MovieData';

function GenresMovies() {

    const { getGenresMovies, genres, setSelectedGenre, selectedGenre, getMoviesByGenres } = useContext(MovieContext)

    useEffect(() => {
        getGenresMovies()
    }, [getGenresMovies])


    // useEffect(() => {
    //     getMoviesByGenres()
    // }, [getMoviesByGenres, selectedGenre])

    return (
        <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center', padding: '0.5rem' }}>
          {genres.map((genre) => (
            <Button
                key={genre.id}
                style={{ margin: '0.5rem', fontSize: '15px', borderRadius: '1.5rem' }}
                onClick={() => setSelectedGenre(genre.id)}
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
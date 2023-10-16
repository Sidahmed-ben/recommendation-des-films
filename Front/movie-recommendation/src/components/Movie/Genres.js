import { useContext, useEffect } from 'react';
import Button from '@mui/material/Button';
import MovieContext from '../../MovieData';

function GenresMovies() {

    const { fetchGenre, genres, setActiveGenre, activeGenre } = useContext(MovieContext)

    useEffect(() => {
        fetchGenre()
    }, [])

    return (
        <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center', padding: '0.5rem' }}>
          {genres.map((genre) => (
            <Button
                key={genre.id}
                // onClick={() => setActiveGenre(genre.id)}
                variant={activeGenre === genre.id ? 'contained' : 'outlined'}
                color="primary"
                size="medium"
                style={{ margin: '0.5rem', fontSize: '15px', borderRadius: '1.5rem' }}
            >
                {genre.name}
            </Button>
          ))}
        </div>
    )
}

export default GenresMovies
import { useEffect } from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import { Typography } from '@mui/material';

function MovieCard({movie}) {

    useEffect(() => {}, [movie.id])

    return (
        <Card sx={{ maxWidth: 300, marginRight: 2 }}>
            <CardMedia
                experimentalFeatures={{lazyLoading: true}}
                sx={{ height: 300, width: 250 }}
                image={"https://image.tmdb.org/t/p/w500" + movie.poster_path}
                title={movie.title}
            />
            <CardContent>
                <Typography variant='h5' noWrap>{movie.title ?? movie.name}</Typography>
                <Typography variant='h5'>{Math.round(movie.vote_average)}</Typography>
            </CardContent>
      </Card>
    )
}

export default MovieCard
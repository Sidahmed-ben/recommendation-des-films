import React, { useContext, useEffect } from 'react'
import GenresMovies from './Genres'
import MovieContext from '../../MovieData'
import { CircularProgress, Typography } from '@mui/material'
import MovieCard from './MovieCard'
import InfiniteScroll from 'react-infinite-scroll-component'


function Movies() {

    const { movies, loader, page, setPage, totalPage, getMovies, getMoviesByGenres, setSelectedGenres } = useContext(MovieContext)
    const containerStyle = {
        width: '100%',
        display: 'flex',
        flexWrap: 'wrap',
        justifyContent: 'center',
    }

    useEffect(() => {
        setPage(1)
    }, [])

    useEffect(() => {
        if (page > 0) {
            getMovies()
            // getMoviesByGenres()
        }
    }, [page])

    return (
       <div>
            <Typography align='center'>
                <h1>Films</h1>
            </Typography>
            {
                !loader ?
                <>
                    <GenresMovies></GenresMovies>
                    <InfiniteScroll
                        style={containerStyle}
                        dataLength={movies.length}
                        next={() => setPage(page + 1)}
                        hasMore={page < totalPage}
                        loader={<CircularProgress color="inherit" />}
                        scrollThreshold={0.9}
                    >
                        {movies.map((movie) => (
                            <MovieCard key={movie.id} movie={movie} />
                        ))}
                    </InfiniteScroll>
                </>
                : <CircularProgress color="inherit" />
            }
                
       </div>
    )
}

export default Movies
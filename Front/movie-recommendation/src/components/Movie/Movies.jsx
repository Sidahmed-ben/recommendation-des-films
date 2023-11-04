import React, { useContext, useEffect } from 'react'
import GenresMovies from './Genres'
import MovieContext from '../../MovieData'
import { CircularProgress, Typography } from '@mui/material'
import MovieCard from './MovieCard'
import InfiniteScroll from 'react-infinite-scroll-component'

function Movies () {
    const {
        movies, loader, page, setPage, totalPages, getMovies, selectedGenre, setSelectedGenre, getMoviesByGenres
    } = useContext(MovieContext)

    const containerStyle = {
        width: '100%',
        display: 'flex',
        flexWrap: 'wrap',
        justifyContent: 'center'
    }

    useEffect(() => {
        setPage(1)
        setSelectedGenre(0)
    }, [])

    useEffect(() => {
        if (page > 0) {
            selectedGenre === 0 ? getMovies() : getMoviesByGenres(selectedGenre)
        }
    }, [page])

    return (
        <div>
            <Typography align='center' variant='h3'>Films</Typography>
            {
                !loader
                    ? <>
                        <GenresMovies></GenresMovies>
                        <InfiniteScroll
                            style={containerStyle}
                            dataLength={movies.length}
                            next={() => {
                                setPage(page + 1)
                            }}
                            hasMore={page < totalPages}
                            loader={<CircularProgress color="inherit" />}
                            scrollThreshold={0.9}
                        >
                            {movies.map((movie, index) => (
                                <MovieCard key={index} movie={movie} />
                            ))}
                        </InfiniteScroll>
                    </>
                    : <CircularProgress color="inherit" />
            }
        </div>
    )
}

export default Movies

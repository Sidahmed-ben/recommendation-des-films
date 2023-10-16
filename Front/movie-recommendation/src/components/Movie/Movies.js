import React, { useContext, useEffect } from 'react';
import GenresMovies from './Genres';
import MovieContext from '../../MovieData';
import { Divider, Typography } from '@mui/material';
import MovieCard from './MovieCard';
import InfiniteScroll from 'react-infinite-scroll-component';



function Movies() {

    const { movies, loader, page, setPage, totalPage, setMovies, fetchMovie } = useContext(MovieContext);
    const containerStyle = {
        width: '100%',
        display: 'flex',
        flexWrap: 'wrap',
        justifyContent: 'center',
    };
    
    const loaderStyle = {
        display: 'flex',
        justifyContent: 'center',
        margin: '10px',
    };

    useEffect(() => {
        // setPage(1)
        fetchMovie()
    }, []);

    useEffect(() => {
        setMovies([])
        // setPage(0)
    }, []);

    return (
       <div>
            <Typography align='center'>
                <h1>Films</h1>
            </Typography>
                <GenresMovies></GenresMovies>
                <InfiniteScroll
                    style={containerStyle}
                    dataLength={movies.length}
                    // next={() => setPage(page + 1)}
                    hasMore={page < totalPage}
                    loader={<span style={loaderStyle} className="loader"></span>}
                    scrollThreshold={0.9}
                >
                    {movies.map((movie) => (
                        <MovieCard key={movie.id} movie={movie} />
                    ))}
                </InfiniteScroll>
       </div>
    )
}

export default Movies
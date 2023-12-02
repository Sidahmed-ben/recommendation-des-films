import env from 'react-dotenv'
import { useNavigate } from 'react-router-dom'
import React, { useEffect, useState } from 'react'
import { redirectToLogin } from '../services/routageService'
import { Box, CircularProgress, Container, Typography } from '@mui/material'
import MoviesPagination from '../components/Movie/MoviePagination'

export default function RatingMoviesPage () {
    const navigate = useNavigate()
    const [movies, setMovies] = useState([])
    const [loader, setLoader] = useState(false)
    const apiKey = env.API_KEY

    const getMovies = async () => {
        const moviesRatedByUser = [
            {
                name_movie: 'The Fast and the Furious',
                year_movie: '2001',
                vote_user: 1
            },
            {
                name_movie: 'Spiderman',
                year_movie: '2004',
                vote_user: 2
            },
            {
                name_movie: 'Spiderman',
                year_movie: '2008',
                vote_user: 3
            },
            {
                name_movie: 'Spiderman',
                year_movie: '2022',
                vote_user: 4
            },
            {
                name_movie: 'Uncharted',
                year_movie: '2022',
                vote_user: 5
            },
            {
                name_movie: 'Taxi 5',
                year_movie: '2018',
                vote_user: 5
            }
        ]

        const moviesToShow = []
        for (const movie of moviesRatedByUser) {
            const data = await fetch(
                `https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&query=${movie.name_movie}&year=${movie.year_movie}`
            )
            const movieData = await data.json()

            const results = movieData.results[0]
            results.voteUser = movie.vote_user
            moviesToShow.push(results)
        }
        setMovies(moviesToShow)
        setLoader(false)
    }

    useEffect(() => {
        redirectToLogin(navigate)
        getMovies()
    }, [])

    return (
        <Container sx={{
            alignItems: 'center'
        }}>
            <Typography variant='h5' margin={10} sx={{ textAlign: 'center' }}>Les films déjà votés</Typography>
            {
                !loader && movies.length > 1
                    ? (
                        <MoviesPagination moviesToDisplay={movies} />
                    )
                    : <Box
                        sx={{
                            display: 'flex',
                            justifyContent: 'center',
                            marginTop: 2
                        }}
                    >
                        <CircularProgress color="inherit" sx={{ alignContent: 'center' }} />
                    </Box>
            }
        </Container>
    )
}

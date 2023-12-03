import env from 'react-dotenv'
import Cookies from 'js-cookie'
import { useNavigate } from 'react-router-dom'
import React, { useEffect, useState } from 'react'
import { fetchData } from '../services/apiService'
import { getUrl } from '../services/urlGeneratorService'
import { redirectToLogin } from '../services/routageService'
import { Box, CircularProgress, Container, Typography } from '@mui/material'
import MoviesPagination from '../components/Movie/MoviePagination'

export default function RatingMoviesPage () {
    const navigate = useNavigate()
    const [movies, setMovies] = useState([])
    const [loader, setLoader] = useState(false)
    const apiKey = env.API_KEY
    const idToken = Cookies.get('idToken')

    const getMovies = async () => {
        const url = getUrl('/get-user-ratings')
        const body = {
            token: idToken
        }

        const moviesRatedByUser = await fetchData(url, JSON.stringify(body), 'POST')

        const moviesToShow = []
        for (const movie of moviesRatedByUser) {
            const data = await fetch(
                `https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&query=${movie.title}&year=${movie.year}`
            )
            const movieData = await data.json()

            const results = movieData.results[0]
            results.voteUser = movie.rating
            moviesToShow.push(results)
        }
        setMovies(moviesToShow)
        setLoader(false)
    }

    useEffect(() => {
        redirectToLogin(navigate)
        if (idToken) {
            getMovies()
        }
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

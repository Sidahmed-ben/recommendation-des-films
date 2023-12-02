import env from 'react-dotenv'
import { useNavigate } from 'react-router-dom'
import React, { useEffect, useState } from 'react'
import { redirectToLogin } from '../services/routageService'
import { Container, Typography } from '@mui/material'
import MoviesPagination from '../components/Movie/MoviePagination'
import { LoaderComponent } from '../components/Loader'

export default function RecommendedMoviesByUserPage () {
    const navigate = useNavigate()
    const [moviesRecommended, setMoviesRecommended] = useState([])
    const [loader, setLoader] = useState(false)
    const apiKey = env.API_KEY

    const getMoviesRecommended = async () => {
        const movies = [
            {
                name_movie: 'The Fast and the Furious',
                year_movie: '2001'
            },
            {
                name_movie: 'Spiderman',
                year_movie: '2004'
            },
            {
                name_movie: 'Spiderman',
                year_movie: '2008'
            },
            {
                name_movie: 'Spiderman',
                year_movie: '2022'
            },
            {
                name_movie: 'Uncharted',
                year_movie: '2022'
            },
            {
                name_movie: 'Taxi 5',
                year_movie: '2018'
            },
            {
                name_movie: 'Uncharted',
                year_movie: '2022'
            },
            {
                name_movie: 'Taxi 5',
                year_movie: '2018'
            }
        ]

        const moviesToShow = []
        for (const movie of movies) {
            const data = await fetch(
                `https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&query=${movie.name_movie}&year=${movie.year_movie}`
            )
            const movieData = await data.json()

            moviesToShow.push(movieData.results[0])
        }
        setMoviesRecommended(moviesToShow)
        setLoader(false)
    }

    useEffect(() => {
        redirectToLogin(navigate)
        getMoviesRecommended()
    }, [])

    return (
        <Container sx={{
            alignItems: 'center'
        }}>
            <Typography variant='h5' margin={10} sx={{ textAlign: 'center' }}>Recommandation Films</Typography>
            {
                !loader && moviesRecommended.length > 1
                    ? (
                        <MoviesPagination moviesToDisplay={moviesRecommended} />
                    )
                    : <LoaderComponent />
            }
        </Container>
    )
}

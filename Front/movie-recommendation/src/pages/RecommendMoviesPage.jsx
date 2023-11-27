import env from 'react-dotenv'
import Cookies from 'js-cookie'
import { useNavigate } from 'react-router-dom'
import React, { useEffect, useState } from 'react'
import { redirectToLogin } from '../services/routageService'
import MovieCard from '../components/Movie/MovieCard'
import { Box, Button, Container, Slider, Typography } from '@mui/material'
import { getUrl } from '../services/urlGeneratorService'
import { LoaderComponent } from '../components/Loader'

export default function RecommendMoviesPage () {
    const navigate = useNavigate()
    const [moviesToRecommend, setMoviesToRecommend] = useState([])
    const [loader, setLoader] = useState(false)
    const [sliderValues, setSliderValues] = useState(moviesToRecommend.map(() => 0))
    const apiKey = env.API_KEY

    const handleChange = (index) => (event, newValue) => {
        const updatedValues = [...sliderValues]
        updatedValues[index] = newValue
        setSliderValues(updatedValues)
    }

    const getMoviesToRecommend = async () => {
        const url = getUrl('/get-movie-to-recommend')
        const data = await fetch(url)
        const movies = await data.json()

        const moviesToShow = []
        for (const movie of movies) {
            const data = await fetch(
                `https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&query=${movie.title}&year=${movie.year}`
            )
            const movieData = await data.json()

            const results = movieData.results[0]
            results.idMovieBdd = movie.id
            moviesToShow.push(results)
        }
        setMoviesToRecommend(moviesToShow)
        setLoader(false)
    }

    useEffect(() => {
        redirectToLogin(navigate)
        getMoviesToRecommend()
    }, [])

    const containerStyle = {
        width: '100%',
        display: 'flex',
        flexWrap: 'wrap',
        justifyContent: 'center'
    }

    const sendRatingMovie = () => {
        const movies = []
        for (const movie of Object.keys(moviesToRecommend)) {
            const moviesToSend = {
                id: moviesToRecommend[movie].idMovieBdd,
                rateMovie: sliderValues[movie],
                idToken: Cookies.get('idToken')
            }
            movies.push(moviesToSend)
        }

        console.log(movies)
    }

    return (
        <Container sx={{
            alignItems: 'center'
        }}>
            <Typography variant='h5' margin={10} sx={{ textAlign: 'center' }}>Recommandation Films</Typography>
            {
                !loader
                    ? (
                        <Box sx={{
                            display: 'flex',
                            alignItems: 'center',
                            flexWrap: 'wrap',
                            justifyContent: 'center'
                        }}>
                            {moviesToRecommend.map((movie, index) => (
                                <Box key={index} sx={{
                                    containerStyle
                                }}>
                                    <MovieCard movie={movie} />
                                    <Box sx={{ width: 300, marginY: 2, marginX: 1 }}>
                                        <Typography variant='p' alignItems='center' textAlign='center'>Notez le film</Typography>
                                        <Slider
                                            getAriaLabel={() => `Vote du film ${index + 1}`}
                                            value={sliderValues[index]}
                                            onChange={handleChange(index)}
                                            valueLabelDisplay="auto"
                                            min={0}
                                            max={5}
                                            marks
                                            sx={{ width: '90%' }}
                                        />
                                    </Box>
                                </Box>
                            ))}
                            <Box sx={{ width: '100%', display: 'flex', justifyContent: 'center', margin: 2 }}>
                                <Button onClick={sendRatingMovie} variant="contained">Recommandation des films</Button>
                            </Box>
                        </Box>
                    )
                    : <LoaderComponent />
            }
        </Container>
    )
}

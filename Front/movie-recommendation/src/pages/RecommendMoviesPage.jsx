import env from 'react-dotenv'
import { useNavigate } from 'react-router-dom'
import React, { useEffect, useState } from 'react'
import { redirectToLogin } from '../services/routageService'
import MovieCard from '../components/Movie/MovieCard'
import { Box, Button, CircularProgress, Container, Slider, Typography } from '@mui/material'

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
                name_movie: 'Uncharted',
                year_movie: '2022'
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
                name_movie: moviesToRecommend[movie].title,
                year_movie: moviesToRecommend[movie].release_date,
                rateMovie: sliderValues[movie]
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
                                    <Box sx={{ width: 300, marginY: 2 }}>
                                        <Typography variant='p' alignItems='center' textAlign='center'>Notez le film</Typography>
                                        <Slider
                                            getAriaLabel={() => `Vote du film ${index + 1}`}
                                            value={sliderValues[index]}
                                            onChange={handleChange(index)}
                                            valueLabelDisplay="auto"
                                            min={0}
                                            max={5}
                                            marks
                                        />
                                    </Box>
                                </Box>
                            ))}
                            <Box sx={{ width: '100%', display: 'flex', justifyContent: 'center', margin: 2 }}>
                                <Button onClick={sendRatingMovie} variant="contained">Recommandation des films</Button>
                            </Box>
                        </Box>
                    )
                    : <CircularProgress color="inherit" />
            }
        </Container>
    )
}

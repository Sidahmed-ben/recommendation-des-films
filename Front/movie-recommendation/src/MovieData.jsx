import { React, createContext, useState, useEffect, useMemo } from 'react'
import env from 'react-dotenv'
import PropTypes from 'prop-types'
const MovieContext = createContext()

export function MovieProvider ({ children }) {
    const [page, setPage] = useState(1)
    const [totalPages, setTotalPages] = useState(null)
    const [selectedGenre, setSelectedGenre] = useState(0)
    const [searchName, setSearchName] = useState(null)
    const [loader, setLoader] = useState(true)
    const [genres, setGenres] = useState([])
    const [movies, setMovies] = useState([])
    const apiKey = env.API_KEY

    const handleResponse = (response) => {
        setLoader(false)
        setTotalPages(response.total_pages)
    }

    const filteredMovies = (movies) => {
        const moviesFiltered = movies.filter((movie) =>
            movie.genre_ids ? movie.genre_ids.includes(selectedGenre) : true
        )
        setMovies(moviesFiltered)
    }

    useEffect(() => {
        if (page < 1) {
            setPage(1)
        }
    }, [page])

    const contextValue = useMemo(() => {
        const getGenresMovies = async () => {
            const data = await fetch(
                `https://api.themoviedb.org/3/genre/movie/list?api_key=${apiKey}&language=FR`
            )
            const gen = await data.json()
            setGenres(gen.genres)
        }

        const searchMovieByName = async () => {
            const data = await fetch(`https://api.themoviedb.org/3/search/multi?api_key=${apiKey}&` +
                `query=${searchName}&include_adult=false&language=fr-FR&page=${page}`
            )
            const response = await data.json()

            handleResponse(response)
            setMovies(response.results)
            if (selectedGenre !== 0) {
                filteredMovies(response.results)
            }
        }

        const getMovies = async () => {
            const data = await fetch(
                `https://api.themoviedb.org/3/trending/all/day?api_key=${apiKey}&language=fr&page=${page}&include_adult=false`
            )
            const response = await data.json()
            handleResponse(response)
            setMovies((prevMovies) => [...(prevMovies || []), ...response.results])
        }

        const getMoviesByGenres = async (prevSelectedGenre) => {
            const data = await fetch(`https://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&` +
                `with_genres=${selectedGenre}&language=fr-FR&page=${page}`
            )
            const response = await data.json()
            handleResponse(response)

            if (prevSelectedGenre === 0) {
                setMovies(response.results)
            } else {
                setMovies((prevMovies) => [...(prevMovies || []), ...response.results])
            }

            if (searchName && selectedGenre !== 0) {
                filteredMovies(movies)
            }
        }

        return {
            getGenresMovies,
            genres,
            setGenres,
            getMovies,
            movies,
            setMovies,
            page,
            totalPages,
            setTotalPages,
            setPage,
            loader,
            setSearchName,
            setSelectedGenre,
            selectedGenre,
            getMoviesByGenres,
            searchMovieByName,
            searchName
        }
    }, [genres, movies, page, totalPages, loader, selectedGenre, apiKey, searchName])

    return (
        <MovieContext.Provider value={contextValue}>
            {children}
        </MovieContext.Provider>
    )
}

MovieProvider.propTypes = {
    children: PropTypes.node
}
export default MovieContext

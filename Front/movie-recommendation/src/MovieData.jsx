import { createContext, useState, useEffect, useMemo, useCallback } from "react";
import env from 'react-dotenv';
const MovieContext = createContext();

export function MovieProvider({ children }) {
    const [page, setPage] = useState(1)
    const [totalPage, setTotalPage] = useState(null)
    const [selectedGenre, setSelectedGenre] = useState(28)
    const [searchName, setSearchName] = useState('')
    const [loader, setLoader] = useState(true)
    const [genres, setGenres] = useState([])
    const [movies, setMovies] = useState([])
    const apiKey = env.API_KEY

    useEffect(() => {
        if (page < 1) {
            setPage(1)
        }
    }, [page])

    useEffect(() => {
        searchName.trim() === '' ? setPage(1) : searchMovieByName(searchName)
    }, [searchName, page])

    const searchMovieByName = useCallback(async () => {

        const data = await fetch(`https://api.themoviedb.org/3/search/multi?api_key=${apiKey}&` + 
            `query=${searchName}&include_adult=false&language=fr-FR&page=${page}`
        )
        const response = await data.json()

        setMovies(response.results)
        setLoader(false);
        setTotalPage(response['total_pages']);

    }, [apiKey, page, searchName]);

   

    const contextValue = useMemo(() => {
        // const apiKey = env.API_KEY

        const getGenresMovies = async () => {
            const data = await fetch(
              `https://api.themoviedb.org/3/genre/movie/list?api_key=${apiKey}&language=FR`
            );
            const gen = await data.json();
            setGenres(gen.genres);
        }

        const getMovies = async () => {
            const data = await fetch(
                `https://api.themoviedb.org/3/trending/all/day?api_key=${apiKey}&language=fr&page=${page}`
            );
            const response = await data.json();
            setLoader(false);
            setTotalPage(response['total_pages']);
            setMovies((prevMovies) => [...(prevMovies || []), ...response.results]);
        }

        const getMoviesByGenres = async () => {
            const data = await fetch(`https://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&` + 
                `with_genres=${selectedGenre}&language=fr-FR&page=${page}`
            )
            const response = await data.json()
            setLoader(false);
            setTotalPage(response['total_pages']);
            // console.log(response.results);
            setMovies((prevMovies) => [...(prevMovies || []), ...response.results]);
        }

        return {
            getGenresMovies,
            genres,
            setGenres,
            getMovies,
            movies,
            setMovies,
            page,
            totalPage,
            setTotalPage,
            setPage,
            loader,
            setSearchName,
            setSelectedGenre,
            selectedGenre,
            getMoviesByGenres
        };
      }, [genres, movies, page, totalPage, loader, selectedGenre, apiKey])

    return (
        <MovieContext.Provider value={contextValue}>
            {children}
        </MovieContext.Provider>
    )
}

export default MovieContext
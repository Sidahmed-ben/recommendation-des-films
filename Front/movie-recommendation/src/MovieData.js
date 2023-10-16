import { createContext, useState, useEffect } from "react";
import env from 'react-dotenv';
const MovieContext = createContext();

export function MovieProvider({ children }) {

    const [page, setPage] = useState(1);
    const [totalPage, setTotalPage] = useState(null)
    const [activegenre, setActiveGenre] = useState(28);
    const [genres, setGenres] = useState([])
    const [movies, setMovies] = useState([])

    useEffect(() => {
        if (page < 1) {
          setPage(1)
        }
    }, [page])
    
    const apiKey = env.API_KEY
    const fetchGenre = async () => {
        const data = await fetch(
          `https://api.themoviedb.org/3/genre/movie/list?api_key=${apiKey}&language=FR`
        );
        const gen = await data.json();
        setGenres(gen.genres);
    }

    const fetchMovie = async () => {
        const data = await fetch(
            `https://api.themoviedb.org/3/trending/all/day?api_key=${apiKey}&language=fr&page=${page}`
        );
        const response= await data.json();
        setMovies(response.results);
    }

    return (
        <MovieContext.Provider
            value={{
                fetchGenre,
                genres,
                setGenres,
                fetchMovie,
                movies,
                setMovies,
                page,
                totalPage,
                setTotalPage
            }}
        >
            {children}
        </MovieContext.Provider>
  );

}

export default MovieContext
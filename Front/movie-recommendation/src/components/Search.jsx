import Box from '@mui/material/Box'
import MovieContext from '../MovieData'
import { React, useContext, useEffect } from 'react'
import TextField from '@mui/material/TextField'
import Container from '@mui/material/Container'

function SearchBar () {
    const { setSearchName, searchName, searchMovieByName, setPage, setMovies, getMovies, page, selectedGenre, getMoviesByGenres } = useContext(MovieContext)

    const handleSearchName = (e) => {
        setSearchName(e.target.value)
    }

    const removeSearch = () => {
        setMovies([])
        setPage(1)
        if (selectedGenre !== 0) {
            getMoviesByGenres(selectedGenre)
        } else {
            getMovies()
        }
    }

    useEffect(() => {
        if (searchName !== null && searchName.trim() === '') {
            removeSearch()
        } else if (page > 1 && searchName) {
            setPage(1)
        } else if (searchName) {
            searchMovieByName(searchName)
        }
    }, [searchName])

    return (
        <Container style={{ padding: '50px' }}>
            <Box>
                <TextField sx={{ alignItems: 'center' }}
                    onChange={e => handleSearchName(e)}
                    style={{ backgroundColor: 'white', padding: '1rem', borderRadius: '1.5rem' }}
                    type="search"
                    name="searchMovie"
                    id="searchMovie"
                    placeholder="Rechercher un film"
                    variant="outlined"
                    fullWidth
                />
            </Box>
        </Container>
    )
}

export default SearchBar

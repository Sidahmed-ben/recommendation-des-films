import Box from '@mui/material/Box'
import MovieContext from '../MovieData'
import { React, useContext } from 'react'
import TextField from '@mui/material/TextField'
import Container from '@mui/material/Container'

function SearchBar() {

    const { setSearchName } = useContext(MovieContext)

    const handleSearchName = (e) => {
        setSearchName(e.target.value)
    }

    return (
        <Container style={{ padding: '50px'}}>
            <Box>
                <TextField sx={{ alignItems: 'center'}}
                    onChange={e => handleSearchName(e)}
                    style={{ backgroundColor: 'white', padding: '1rem', borderRadius: '1.5rem'}}
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
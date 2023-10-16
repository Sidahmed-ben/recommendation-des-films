import React from 'react';
import TextField from '@mui/material/TextField';
import Container from '@mui/material/Container';
import Box from '@mui/material/Box';

function SearchBar() {

    return (
        <Container style={{ padding: '50px'}}>
            <Box>
                <TextField sx={{ alignItems: 'center'}}
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
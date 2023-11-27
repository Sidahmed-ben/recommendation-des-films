import React from 'react'
import { Box, CircularProgress } from '@mui/material'

export function LoaderComponent () {
    return (
        <Box
            sx={{
                display: 'flex',
                justifyContent: 'center',
                marginTop: 2
            }}
        >
            <CircularProgress color="inherit" sx={{ alignContent: 'center' }} />
        </Box>
    )
}

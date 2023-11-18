import React, { useState } from 'react'
import Login from '../components/Login'
import Registration from '../components/Registration'
import { Container, Typography } from '@mui/material'
import Cookies from 'js-cookie'

export default function RecommendMoviesPage () {
    const [showLogin, setShowLogin] = useState(true)
    const toggleForm = () => setShowLogin(!showLogin)

    const userNotLoggedComponent = showLogin ? <Login onToggleForm={toggleForm} /> : <Registration onToggleForm={toggleForm} />
    return (
        <Container sx={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center'
        }}>
            {!Cookies.get('idToken')
                ? (userNotLoggedComponent)
                : (<Typography variant='h5' margin={15}>Recommandation Films</Typography>)
            }
        </Container>
    )
}

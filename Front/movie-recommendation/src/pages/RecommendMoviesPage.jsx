import React, { useState } from 'react'
import Login from '../components/Login'
import Registration from '../components/Registration'
import { Container } from '@mui/material'

export default function RecommendMoviesPage () {
    const [showLogin, setShowLogin] = useState(true)

    const toggleForm = () => setShowLogin(!showLogin)

    return (
        <Container sx={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center'
        }}>
            {showLogin
                ? <Login onToggleForm={toggleForm} />
                : <Registration onToggleForm={toggleForm} />
            }
        </Container>
    )
}

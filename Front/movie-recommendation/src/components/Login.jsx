import React from 'react'
import Button from '@mui/material/Button'
import CssBaseline from '@mui/material/CssBaseline'
import TextField from '@mui/material/TextField'
import Link from '@mui/material/Link'
import Grid from '@mui/material/Grid'
import Box from '@mui/material/Box'
import Typography from '@mui/material/Typography'
import Container from '@mui/material/Container'
import Copyright from './Copyright'
import PropTypes from 'prop-types'
import { useForm } from 'react-hook-form'
import env from 'react-dotenv'
import Cookies from 'js-cookie'

export default function Login (props) {
    const { register, handleSubmit, formState: { errors } } = useForm()
    const onSubmit = async (formData) => {
        const url = new URL('/login', env.URL_API)
        const data = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        const dataUser = await data.json()

        if (dataUser.success) {
            const dateExpiration = new Date(dataUser.user.expiresIn)
            Cookies.set('idToken', dataUser.user.idToken, { expires: dateExpiration })
        } else {
            alert('Vos identifiants sont incorrect')
        }
    }

    return (
        <Container component="main" maxWidth="xs">
            <CssBaseline />
            <Box
                sx={{
                    marginTop: 15,
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center'
                }}
            >
                <Typography component="h1" variant="h5">Connexion</Typography>
                <Box component="form" onSubmit={handleSubmit(onSubmit)} noValidate sx={{ mt: 1 }}>
                    <TextField
                        margin="normal"
                        required
                        fullWidth
                        id="email"
                        label="Adresse mail"
                        name="email"
                        autoComplete="email"
                        autoFocus
                        {...register('email', { required: true, pattern: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i })}
                        error={Boolean(errors.email)}
                        helperText={errors.email?.message}
                    />
                    <TextField
                        margin="normal"
                        required
                        fullWidth
                        name="password"
                        label="Mot de passe"
                        type="password"
                        id="password"
                        autoComplete="current-password"
                        {...register('password', { required: true })}
                        error={Boolean(errors.password)}
                        helperText={errors.password?.message}
                    />
                    <Button
                        type="submit"
                        fullWidth
                        variant="contained"
                        sx={{ mt: 3, mb: 2 }}
                    >
                    Se connecter
                    </Button>
                    <Grid container>
                        <Grid item>
                            <Link href="#" variant="body2" onClick={props.onToggleForm}>
                                {'Vous n\'avez pas de compte?'}
                            </Link>
                        </Grid>
                    </Grid>
                </Box>
            </Box>
            <Copyright sx={{ mt: 8, mb: 4 }} />
        </Container>
    )
}

Login.propTypes = {
    onToggleForm: PropTypes.func.isRequired
}

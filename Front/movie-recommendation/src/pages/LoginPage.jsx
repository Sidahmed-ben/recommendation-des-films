import React, { useEffect } from 'react'
import Button from '@mui/material/Button'
import CssBaseline from '@mui/material/CssBaseline'
import TextField from '@mui/material/TextField'
import Link from '@mui/material/Link'
import Grid from '@mui/material/Grid'
import Box from '@mui/material/Box'
import Typography from '@mui/material/Typography'
import Container from '@mui/material/Container'
import Copyright from '../components/Copyright'
import { useForm } from 'react-hook-form'
import Cookies from 'js-cookie'
import { useNavigate } from 'react-router-dom'
import { isLogged } from '../services/routageService'
import { getUrl } from '../services/urlGeneratorService'
import { fetchData } from '../services/apiService'

export default function LoginPage () {
    const navigate = useNavigate()
    const { register, handleSubmit, formState: { errors } } = useForm()
    const onSubmit = async (formData) => {
        const url = getUrl('/login')
        const getData = async () => {
            const dataUser = await fetchData(url, JSON.stringify(formData), 'POST')

            if (dataUser.success) {
                const expiresInInSeconds = dataUser.user.expiresIn
                const dateExpiration = new Date()
                dateExpiration.setTime(dateExpiration.getTime() + expiresInInSeconds * 1000)

                Cookies.set('idToken', dataUser.user.idToken, { expires: dateExpiration })
                navigate('/recommandation', { replace: true })
            } else {
                alert('Vos identifiants sont incorrect')
            }
        }
        getData()
    }

    useEffect(() => {
        if (isLogged()) {
            navigate(-1)
        }
    })

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
                            <Link href="/registration" variant="body2" to="/registration">
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

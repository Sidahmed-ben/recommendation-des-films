import * as React from 'react'
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

export default function Registration (props) {
    const { register, handleSubmit, formState: { errors } } = useForm()
    const onSubmit = (data) => {
        console.log(data)
        // console.log(new FormData(data))
    }

    return (
        <Container component="main" maxWidth="xs">
            <CssBaseline />
            <Box
                sx={{
                    marginTop: 15,
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                    marginLeft: '5%'
                }}
            >
                <Typography component="h1" variant="h5">{'S\'enregistrer'}</Typography>
                <Box component="form" noValidate onSubmit={handleSubmit(onSubmit)} sx={{ mt: 3 }}>
                    <Grid container spacing={2}>
                        <Grid item xs={12} sm={6}>
                            <TextField
                                autoComplete="given-name"
                                name="firstName"
                                required
                                fullWidth
                                id="firstName"
                                label="Prénom"
                                autoFocus
                                {...register('firstName', { required: true })}
                                error={Boolean(errors.firstName)}
                                helperText={errors.firstName?.message}
                            />
                        </Grid>
                        <Grid item xs={12} sm={6}>
                            <TextField
                                required
                                fullWidth
                                id="lastName"
                                label="Nom de famille"
                                name="lastName"
                                autoComplete="family-name"
                                {...register('lastName', { required: true })}
                                error={Boolean(errors.lastName)}
                                helperText={errors.lastName?.message}
                            />
                        </Grid>
                        <Grid item xs={12}>
                            <TextField
                                required
                                fullWidth
                                id="email"
                                label="Adresse mail"
                                name="email"
                                autoComplete="email"
                                {...register('email', { required: true, pattern: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i })}
                                error={Boolean(errors.email)}
                                helperText={errors.email?.message}
                            />
                        </Grid>
                        <Grid item xs={12}>
                            <TextField
                                required
                                fullWidth
                                name="password"
                                label="Mot de passe"
                                type="password"
                                id="password"
                                autoComplete="new-password"
                                {...register('password', { required: true })}
                                error={Boolean(errors.password)}
                                helperText={errors.password?.message}
                            />
                        </Grid>
                    </Grid>
                    <Button
                        type="submit"
                        fullWidth
                        variant="contained"
                        sx={{ mt: 3, mb: 2 }}
                    >
                        {'S\'enregistrer'}
                    </Button>
                    <Grid container justifyContent="flex-end">
                        <Grid item>
                            <Link href="#" variant="body2" onClick={props.onToggleForm}>
                                Vous avez déjà un compte ? Connecte-vous
                            </Link>
                        </Grid>
                    </Grid>
                </Box>
            </Box>
            <Copyright sx={{ mt: 5 }} />
        </Container>
    )
}

Registration.propTypes = {
    onToggleForm: PropTypes.func.isRequired
}

import * as React from 'react'
import ResponsiveDrawer from './components/Drawer'
import Grid from '@mui/material/Grid'
import Home from './pages/HomePage'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import RecommendMoviesPage from './pages/RecommendMoviesPage'
import LoginPage from './pages/LoginPage'
import RegistrationPage from './pages/RegistrationPage'
import RatingMoviesPage from './pages/RatingMoviePage'
import RecommendedMoviesByUserPage from './pages/RecommendedMoviesByUserPage'

function HomePage () {
    let isPhone = false
    if (
        navigator.userAgent.match(/Android/i) ||
        navigator.userAgent.match(/iPhone/i)
    ) {
        isPhone = true
    }

    return (
        <BrowserRouter>
            <div className='App'>
                {!isPhone
                    ? <Grid container spacing={0}>
                        <Grid item xs={2}>
                            <ResponsiveDrawer></ResponsiveDrawer>
                        </Grid>
                        <Grid item xs={9}>
                            <Routes>
                                <Route path='/' index element={<Home/>} />
                                <Route path='/login' element={<LoginPage />} />
                                <Route path='/recommandation' element={<RecommendMoviesPage />} />
                                <Route path='/registration' element={<RegistrationPage />} />
                                <Route path='/movie-rated' element={<RatingMoviesPage />} />
                                <Route path='/movie-recommended' element={<RecommendedMoviesByUserPage />} />
                            </Routes>
                        </Grid>
                    </Grid>
                    : <><ResponsiveDrawer></ResponsiveDrawer><Routes>
                        <Route path='/' index element={<Home/>} />
                        <Route path='/login' element={<LoginPage />} />
                        <Route path='/recommandation' element={<RecommendMoviesPage />} />
                        <Route path='/registration' element={<RegistrationPage />} />
                        <Route path='/movie-rated' element={<RatingMoviesPage />} />
                        <Route path='/movie-recommended' element={<RecommendedMoviesByUserPage />} />
                    </Routes></>
                }
            </div>
        </BrowserRouter>
    )
}
export default HomePage

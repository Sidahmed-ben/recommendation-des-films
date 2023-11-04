import React from 'react'
import { MovieProvider } from '../MovieData'
import SearchBar from '../components/Search'
import Movies from '../components/Movie/Movies'

function Home () {
    return (
        <MovieProvider>
            <SearchBar />
            <Movies />
        </MovieProvider>
    )
}

export default Home

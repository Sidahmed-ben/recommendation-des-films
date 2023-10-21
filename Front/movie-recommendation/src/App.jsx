import * as React from 'react';
import ResponsiveDrawer from './components/Drawer';
import SearchBar from './components/Search';
import Grid from '@mui/material/Grid';
import Movies from './components/Movie/Movies';
import { MovieProvider } from './MovieData';

function HomePage() {
  return (
    <div className="App">
      <Grid container spacing={0}>
        <Grid item xs={2}>
          <ResponsiveDrawer></ResponsiveDrawer>
        </Grid>
        <Grid item xs={9}>
          <MovieProvider>
            <SearchBar></SearchBar>
            <Movies></Movies>
          </MovieProvider>
        </Grid>
      </Grid>
    </div>
  )
}
export default HomePage;

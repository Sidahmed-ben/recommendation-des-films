import env from "react-dotenv";
import Cookies from "js-cookie";
import { useNavigate } from "react-router-dom";
import { fetchData } from "../services/apiService";
import React, { useEffect, useState } from "react";
import { Container, Typography } from "@mui/material";
import { LoaderComponent } from "../components/Loader";
import { getUrl } from "../services/urlGeneratorService";
import { redirectToLogin } from "../services/routageService";
import MoviesPagination from "../components/Movie/MoviePagination";

export default function RecommendedMoviesByUserPage() {
  const navigate = useNavigate();
  const [moviesRecommended, setMoviesRecommended] = useState([]);
  const [loader, setLoader] = useState(false);
  const apiKey = env.API_KEY;
  const idToken = Cookies.get("idToken");

  const getMoviesRecommended = async () => {
    const url = getUrl("/get-recommended-by-user");
    const body = {
      token: idToken,
    };
    const movies = await fetchData(url, JSON.stringify(body), "POST");

    const moviesToShow = [];
    for (const movie of movies) {
      const data = await fetch(
        `https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&query=${movie.title}&year=${movie.year}`
      );
      const movieData = await data.json();

      moviesToShow.push(movieData.results[0]);
    }
    setMoviesRecommended(moviesToShow);
    setLoader(false);
  };

  useEffect(() => {
    redirectToLogin(navigate);
    if (idToken) {
      getMoviesRecommended();
    }
  }, []);

  return (
    <Container
      sx={{
        alignItems: "center",
      }}
    >
      <Typography variant="h5" margin={10} sx={{ textAlign: "center" }}>
        Les films déjà recommandés
      </Typography>
      {!loader && moviesRecommended.length > 1 ? (
        <MoviesPagination moviesToDisplay={moviesRecommended} />
      ) : (
        <LoaderComponent />
      )}
    </Container>
  );
}

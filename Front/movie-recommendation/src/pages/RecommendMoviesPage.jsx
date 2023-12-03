import env from "react-dotenv";
import Cookies from "js-cookie";
import { useNavigate } from "react-router-dom";
import React, { useEffect, useState } from "react";
import { redirectToLogin } from "../services/routageService";
import MovieCard from "../components/Movie/MovieCard";
import { Box, Button, Container, Slider, Typography } from "@mui/material";
import { getUrl } from "../services/urlGeneratorService";
import { LoaderComponent } from "../components/Loader";
import { fetchData } from "../services/apiService";
import ModalMoviesRecommended from "../components/Movie/ModalMoviesRecommended";

export default function RecommendMoviesPage() {
  const navigate = useNavigate();
  const [moviesToRecommend, setMoviesToRecommend] = useState([]);
  const [moviesRecommended, setMoviesRecommended] = useState([]);
  const [loader, setLoader] = useState(false);
  const [sliderValues, setSliderValues] = useState(
    moviesToRecommend.map(() => 0)
  );
  const apiKey = env.API_KEY;
  const idToken = Cookies.get("idToken");

  const handleChange = (index) => (event, newValue) => {
    const updatedValues = [...sliderValues];
    updatedValues[index] = newValue;
    setSliderValues(updatedValues);
  };

  const getMoviesToRecommend = async () => {
    const url = getUrl("/get-movies-to-recommend");
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

      const results = movieData.results[0];
      if (results !== undefined) {
        results.idMovieBdd = movie.id;
        moviesToShow.push(results);
      } else {
        location.reload();
      }
    }
    setMoviesToRecommend(moviesToShow);
    setLoader(false);
  };

  useEffect(() => {
    redirectToLogin(navigate);
    if (idToken) {
      getMoviesToRecommend();
    }
  }, []);

  const containerStyle = {
    width: "100%",
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "center",
  };

  const showMoviesRecommended = async (moviesRated) => {
    const url = getUrl("/get-recommanded-movies");
    const body = {
      token: idToken,
      moviesRatings: moviesRated,
    };
    const movies = await fetchData(url, JSON.stringify(body), "POST");

    const moviesToShow = [];
    for (const movie of movies) {
      const data = await fetch(
        `https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&query=${movie.title}&year=${movie.year}`
      );
      const movieData = await data.json();

      const results = movieData.results[0];
      moviesToShow.push(results);
    }

    setMoviesRecommended(moviesToShow);
  };

  const sendRatingMovie = async () => {
    const movies = [];
    for (const movie of Object.keys(moviesToRecommend)) {
      const moviesToSend = {
        movieId: moviesToRecommend[movie].idMovieBdd,
        rating: sliderValues[movie],
      };
      movies.push(moviesToSend);
    }
    setLoader(true);
    showMoviesRecommended(movies)
      .then(() => {
        setLoader(false);
        console.log(" Movies recommanded successffully updated !");
      })
      .catch((err) => {
        console.log(" Error when getting recommanded movies ! ", err);
        setLoader(false);
      });
  };

  return (
    <Container
      sx={{
        alignItems: "center",
      }}
    >
      <Typography variant="h5" margin={10} sx={{ textAlign: "center" }}>
        Recommandation Films
      </Typography>
      {!loader && moviesToRecommend.length > 1 ? (
        <>
          <Box
            sx={{
              display: "flex",
              alignItems: "center",
              flexWrap: "wrap",
              justifyContent: "center",
            }}
          >
            {moviesToRecommend.map((movie, index) => (
              <Box
                key={index}
                sx={{
                  containerStyle,
                }}
              >
                <MovieCard movie={movie} />
                <Box sx={{ width: 300, marginY: 2, marginX: 1 }}>
                  <Typography
                    variant="p"
                    alignItems="center"
                    textAlign="center"
                  >
                    Notez le film
                  </Typography>
                  <Slider
                    getAriaLabel={() => `Vote du film ${index + 1}`}
                    value={sliderValues[index]}
                    onChange={handleChange(index)}
                    valueLabelDisplay="auto"
                    min={0}
                    max={5}
                    marks
                    sx={{ width: "90%" }}
                  />
                </Box>
              </Box>
            ))}
            <Box
              sx={{
                width: "100%",
                display: "flex",
                justifyContent: "center",
                margin: 2,
              }}
            >
              <Button onClick={sendRatingMovie} variant="contained">
                Recommandation des films
              </Button>
            </Box>
          </Box>
          {moviesRecommended.length > 1 && (
            <ModalMoviesRecommended
              isOpen={true}
              moviesRecommended={moviesRecommended}
            />
          )}
        </>
      ) : (
        <LoaderComponent />
      )}
    </Container>
  );
}

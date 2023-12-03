import React, { useState } from "react";
import { Box, Pagination } from "@mui/material";
import MovieCard from "./MovieCard";
import PropTypes from "prop-types";

export default function MoviesPagination({ moviesToDisplay }) {
  const itemsPerPage = 6;
  const [currentPage, setCurrentPage] = useState(1);

  const indexOfLastMovie = currentPage * itemsPerPage;
  const indexOfFirstMovie = indexOfLastMovie - itemsPerPage;
  const currentMovies = moviesToDisplay.slice(
    indexOfFirstMovie,
    indexOfLastMovie
  );

  const changePage = (event, value) => {
    setCurrentPage(value);
  };

  const containerStyle = {
    width: "100%",
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "center",
  };

  return (
    <Box
      sx={{
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
      }}
    >
      <Box
        sx={{
          display: "flex",
          alignItems: "center",
          flexWrap: "wrap",
          justifyContent: "center",
        }}
      >
        {currentMovies.map((movie, index) => {
          if (movie) {
            return (
              <Box key={index} sx={{ containerStyle }}>
                <MovieCard movie={movie} />
              </Box>
            );
          }
          return null;
        })}
      </Box>
      <Box
        sx={{
          display: "flex",
          justifyContent: "flex-end",
          marginTop: 2,
        }}
      >
        <Pagination
          count={Math.ceil(moviesToDisplay.length / itemsPerPage)}
          variant="outlined"
          page={currentPage}
          onChange={changePage}
        />
      </Box>
    </Box>
  );
}

MoviesPagination.propTypes = {
  moviesToDisplay: PropTypes.array.isRequired,
};

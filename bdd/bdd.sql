CREATE TABLE `user` (
  `id` integer PRIMARY KEY,
  `username` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `movie_recommended` (
  `id` integer PRIMARY KEY,
  `user_id` integer,
  `movie_id` integer
);

CREATE TABLE `movie` (
  `id` integer PRIMARY KEY,
  `title` varchar(255)
);

CREATE TABLE `movie_rating` (
  `id` integer PRIMARY KEY,
  `rating` integer,
  `user_id` integer,
  `movie_id` integer
);

ALTER TABLE `movie_rating` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `movie_recommended` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `movie_recommended` ADD FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

ALTER TABLE `movie_rating` ADD FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

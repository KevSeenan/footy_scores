DROP TABLE fixtures;
DROP TABLE matches;
DROP TABLE teams;
DROP TABLE leagues;


CREATE TABLE leagues (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  league_id INT REFERENCES leagues(id)
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  score VARCHAR(255)
);

CREATE TABLE fixtures (
  id SERIAL PRIMARY KEY,
  league_id INT REFERENCES leagues(id),
  home_team VARCHAR(255),
  away_team VARCHAR(255),
  match_id INT
);

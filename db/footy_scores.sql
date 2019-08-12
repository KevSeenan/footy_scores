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
  name VARCHAR(255),
  league_id INT REFERENCES leagues(id),
  team_id INT REFERENCES teams(id),
  match_id INT
);

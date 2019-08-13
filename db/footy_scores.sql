DROP TABLE matches;
DROP TABLE fixtures;
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

CREATE TABLE fixtures (
  id SERIAL PRIMARY KEY,
  league_name VARCHAR(255),
  home_team VARCHAR(255),
  away_team VARCHAR(255)
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  team1_id INT REFERENCES teams(id),
  team2_id INT REFERENCES teams(id),
  fixture_id INT REFERENCES fixtures(id),
  games_played INT,
  score VARCHAR(255),
  games_won INT,
  games_lost INT,
  goals_for INT,
  goals_against INT,
  points INT
);

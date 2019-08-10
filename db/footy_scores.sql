DROP TABLE teams;
DROP TABLE leagues;


CREATE TABLE leagues (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  team_name VARCHAR(255)
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  league_id INT REFERENCES leagues(id)
);

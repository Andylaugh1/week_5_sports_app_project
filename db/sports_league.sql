DROP TABLE games;
DROP TABLE players;
DROP TABLE teams;

CREATE table teams (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE table players (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  position VARCHAR(255),
  team_id INT4 REFERENCES teams(id)
);

CREATE table games (
  id SERIAL4 PRIMARY KEY,
  home_team_id INT4 REFERENCES teams(id) ON DELETE CASCADE,
  away_team_id INT4 REFERENCES teams(id) ON DELETE CASCADE,
  home_team_score INT2,
  away_team_score INT2
);

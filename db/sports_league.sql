DROP TABLE games;
DROP TABLE teams;

CREATE table teams (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE table games (
  id SERIAL4 PRIMARY KEY,
  home_team_id INT4 REFERENCES teams(id),
  away_team_id INT4 REFERENCES teams(id),
  home_team_score INT2,
  away_team_score INT2
);

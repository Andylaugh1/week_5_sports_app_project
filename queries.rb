"SELECT teams.name FROM teams INNER JOIN
        games ON games.home_team_id =
        teams.id

"SELECT teams.name FROM teams LEFT JOIN games ON games.home_team_id = teams.id;"

SELECT COUNT(*) FROM games WHERE (home_team_id = 1 AND home_team_score > away_team_score) OR (away_team_id = 1 AND away_team_score > home_team_score);

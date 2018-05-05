"SELECT teams.name FROM teams INNER JOIN
        games ON games.home_team_id =
        teams.id

"SELECT teams.name FROM teams LEFT JOIN games ON games.home_team_id = teams.id;"

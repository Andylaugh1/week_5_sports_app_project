Pseudocode for method which sorts league by points difference and then by goal-difference

Getting the total points for a team:
total_points = 0
def add total points for team
  for game in games_won_by_team, add 3 points (points for win),
    and add all the points together and add to total_points
  for game in games_drawn_by_team add 1 point (points for draw),
    and add all the points together and add to total_points
  end

  return total_points

Getting the total goals for team:
work out total goals scored while home team
work out the total goals scored while away team
  add these two values together and place in a variable(1)
work out the total goals conceded while home team
work out the total goals conceded while away team
  add these two values together and place in a variable(2)
Subtract variable 2 from variable 1 and return the result as total_goal_difference


  Sort_by method which sorts league table by points and goal difference:
  having obtained methods to work out total points and total goal difference for each team,
  we need a method to sort the league table first by points(highest to lowest), then by goal difference.

  First find Teams.all
  assign Team.all to a variable 'teams'
  For each team in teams, sort_by total points first, and by goal difference second.
  return teams, reversed so that the team with most points/highest goal difference is first

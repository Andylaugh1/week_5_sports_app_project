require('pry')
require_relative('../models/game.rb')
require_relative('../models/team.rb')

Team.delete_all
Game.delete_all

team1 = Team.new ({
  "name" => "Gryffindor"
  })
team1.save

team2 = Team.new ({
  "name" => "Slytherin"
  })
team2.save

team3 = Team.new ({
  "name" => "Hufflepuff"
  })
team3.save

team4 = Team.new ({
  "name" => "Ravenclaw"
  })
team4.save

game1 = Game.new({
   "home_team_id" => team1.id,
   "away_team_id" => team2.id,
   "home_team_score" => 260,
   "away_team_score" => 50
  })
game1.save

game2 = Game.new({
   "home_team_id" => team3.id,
   "away_team_id" => team4.id,
   "home_team_score" => 80,
   "away_team_score" => 300
  })
game2.save

game3 = Game.new({
   "home_team_id" => team1.id,
   "away_team_id" => team3.id,
   "home_team_score" => 350,
   "away_team_score" => 150
  })
game3.save

game4 = Game.new({
   "home_team_id" => team2.id,
   "away_team_id" => team4.id,
   "home_team_score" => 170,
   "away_team_score" => 120
  })
game4.save

binding.pry
nil

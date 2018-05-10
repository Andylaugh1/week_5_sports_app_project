require('pry')
require_relative('../models/game.rb')
require_relative('../models/team.rb')
require_relative('../models/player.rb')

Game.delete_all
Player.delete_all
Team.delete_all

team1 = Team.new ({
  "name" => "Gryffindor",
  "transfer_funds" => 200000
  })
team1.save

team2 = Team.new ({
  "name" => "Slytherin",
  "transfer_funds" => 400000
  })
team2.save

team3 = Team.new ({
  "name" => "Hufflepuff",
  "transfer_funds" => 150000
  })
team3.save

team4 = Team.new ({
  "name" => "Ravenclaw",
  "transfer_funds" => 250000
  })
team4.save

team5 = Team.new ({
  "name" => "Chudley Cannons",
  "transfer_funds" => 500000
  })
team5.save

team6 = Team.new ({
  "name" => "Dechmont Dynamos",
  "transfer_funds" => 40000
  })
team6.save

team7 = Team.new ({
  "name" => "Murieston United",
  "transfer_funds" => 6000
  })
team7.save

team8 = Team.new ({
  "name" => "Real Sosobad",
  "transfer_funds" => 60000
  })
team8.save


# GAMES CREATED BELOW
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

player1 = Player.new ({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "position" => "Seeker",
  "team_id" => team1.id,
  "transfer_value" => 100000
  })
player1.save

player2 = Player.new ({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "position" => "Seeker",
  "team_id" => team2.id,
  "transfer_value" => 70000
  })
player2.save

player3 = Player.new ({
  "first_name" => "Andy",
  "last_name" => "Laughlin",
  "position" => "Beater",
  "team_id" => team1.id,
  "transfer_value" => 8500
  })
player3.save

player4 = Player.new ({
  "first_name" => "Alicia",
  "last_name" => "Gonzalez",
  "position" => "Goalkeeper",
  "team_id" => team4.id,
  "transfer_value" => 50000
  })
player4.save

player5 = Player.new ({
  "first_name" => "Kirsty",
  "last_name" => "Laughlin",
  "position" => "Chaser",
  "team_id" => team3.id,
  "transfer_value" => 40000
  })
player5.save

player6 = Player.new ({
  "first_name" => "Joe",
  "last_name" => "Stafford",
  "position" => "Beater",
  "team_id" => team2.id,
  "transfer_value" => 9000
  })
player6.save

player7 = Player.new ({
  "first_name" => "Richard",
  "last_name" => "Ramson",
  "position" => "Chaser",
  "team_id" => team3.id,
  "transfer_value" => 10000
  })
player7.save

player8 = Player.new ({
  "first_name" => "Duncan",
  "last_name" => "Marjoribanks",
  "position" => "Chaser",
  "team_id" => team4.id,
  "transfer_value" => 10000
  })
player8.save

player9 = Player.new ({
  "first_name" => "Cristiano",
  "last_name" => "Ronaldo",
  "position" => "Seeker",
  "team_id" => team3.id,
  "transfer_value" => 120000
  })
player9.save

player10 = Player.new ({
  "first_name" => "Steven",
  "last_name" => "Gerrard",
  "position" => "Goalkeeper",
  "team_id" => team2.id,
  "transfer_value" => 1000
  })
player10.save

binding.pry
nil

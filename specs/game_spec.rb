require('minitest/autorun')
require('minitest/rg')
require_relative('../models/game.rb')
require_relative('../models/team.rb')

class TestGame < MiniTest::Test

  def setup

   @team1 = Team.new({
     "name" => "Gryffindor"
     })
   @team2 = Team.new({
     "name" => "Slytherin"
     })

    options = {
      'id' => 1,
      'home_team_id' => 1,
      'away_team_id' => 2,
      'home_team_score' => 2,
      'away_team_score' => 1 }

   @game1 = Game.new(options)

 end

 def test_get_id()
   assert_equal(1, @game1.id)
 end

 def test_get_home_team_score()
   assert_equal(2, @game1.home_team_score)
 end

 def test_display_who_won_game()
   result = @game1.display_who_won
   assert_equal("Gryffindor won", @game1.display_who_won)
 end
end

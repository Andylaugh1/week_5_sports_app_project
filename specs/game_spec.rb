require('minitest/autorun')
require('minitest/rg')
require_relative('../models/game.rb')

class TestGame < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'home_team_id' => 2,
      'away_team_id' => 3,
      'home_team_score' => 2,
      'away_team_score' => 1 }

   @game = Game.new(options)

 end

 def test_get_id()
   assert_equal(1, @game.id)
 end

 def test_get_home_team_score()
   assert_equal(2, @game.home_team_score)
 end
end

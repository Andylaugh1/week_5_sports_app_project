require('minitest/autorun')
require('minitest/rg')
require_relative('../models/player.rb')
require_relative('../models/team.rb')

class TestPlayer < MiniTest::Test

  def setup()

    @team1 = Team.new({
      "name" => "Gryffindor"
      })

    options = {
      "id" => 1,
      "first_name" => "Harry",
      "last_name" => "Potter",
      "position" => "Seeker",
      "team_id" => 1
    }

    @player1 = Player.new(options)

  end

  def test_player_id()
    assert_equal(1, @player1.id)
  end

  def test_player_first_name()
    assert_equal("Harry", @player1.first_name)
  end

  def test_player_last_name()
    assert_equal("Potter", @player1.last_name)
  end

  def test_player_position()
    assert_equal("Seeker", @player1.position)
  end

  def test_player_team_id()
    assert_equal(1, @player1.team_id )
  end

  def test_player_full_name()
    assert_equal("Harry Potter", @player1.player_full_name)
  end

  # def test_get_player_team_name()
  #   assert_equal("Gryffindor", @player1.get_player_team_name)
  # end

end

require('minitest/autorun')
require('minitest/rg')
require_relative('../models/team.rb')

class TestTeam < MiniTest::Test

  def setup()
    options = {
      'id' => 1,
      'name' => "Celtic" }

    @team = Team.new(options)
  end

  def test_get_id()
    assert_equal(1, @team.id)
  end

  def test_get_name()
    assert_equal("Celtic", @team.name)
  end

end

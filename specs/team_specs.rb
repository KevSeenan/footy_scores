require('minitest/autorun')
require('minitest/rg')
require_relative('../models/team.rb')

class TeamTest < MiniTest::Test

  def setup()
    @team = Team.new("KS All Stars")
  end

  def test_can_create_a_team()
    assert_equal(Team, @team.class())
  end

end

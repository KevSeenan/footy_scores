require('minitest/autorun')
require('minitest/rg')
require_relative('../models/league.rb')

class LeagueTest < MiniTest::Test

  def setup()
    @league = League.new('Test Prem League')
  end

  def test_can_create_a_league
    assert_equal(League, @league.class())
  end

end

require('pry-byebug')
require_relative('../models/team.rb')
require_relative('../models/league.rb')

league1 = League.new(
  {
    'name' => 'Clarence Duckworth Invitational'
  }
)

league1.save()

league1.name => 'CD Premier League'
league1.update()

team1 = Team.new(
  {
    'name' => 'KS All Stars',
    'league_id' => league1.id
  }
)

team1.save()

team2 = Team.new(
  {
    'name' => 'Dakala City',
    'league_id' => league1.id
  }
)
team2.save()

binding.pry

nil

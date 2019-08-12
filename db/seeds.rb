require('pry-byebug')
require_relative('../models/match.rb')
require_relative('../models/fixture.rb')
require_relative('../models/team.rb')
require_relative('../models/league.rb')

Team.delete_all()
League.delete_all()


league1 = League.new(
  {
    'name' => 'Clarence Duckworth Invitational',
    # 'teams' => ['FC TDD']
  }
)
league1.save()

# league1.delete()

# league1.name = 'CRUD Prem League'
# league1.update()

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

# team1.name = 'FC Rubber Ducks'
# team1.update()

match1 = Match.new (
  {
    'name' => 'Match Day 1',
    'score' => '2-0'
  }
)
match1.save()

match2 = Match.new (
  {
    'name' => 'Match Day 2',
    'score' => '1-3'
  }
)


binding.pry

nil

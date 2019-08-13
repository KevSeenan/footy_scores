require('pry-byebug')
require_relative('../models/match.rb')
require_relative('../models/fixture.rb')
require_relative('../models/team.rb')
require_relative('../models/league.rb')

Match.delete_all()
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
match2.save()

fixture1 = Fixture.new (
  {
    'league_id' => league1.id,
    'league_name' => league1.name,
    'match_id'=> match1.id,
    'match_name' => match1.name,
    'home_team' => team1.name,
    'away_team' => team2.name
  }
)
fixture1.save()

fixture2 = Fixture.new (
  {
    'league_id' => league1.id,
    'league_name' => league1.name,
    'match_id'=> match2.id,
    'match_name' => match2.name,
    'home_team' => team2.name,
    'away_team' => team1.name
  }
)
fixture2.save()


binding.pry

nil

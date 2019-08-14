require('pry-byebug')
require_relative('../models/match.rb')
require_relative('../models/fixture.rb')
require_relative('../models/team.rb')
require_relative('../models/league.rb')

Fixture.delete_all()
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

fixture1 = Fixture.new (
  {
    'league_id' => league1.id,
    'league_name' => league1.name,
    'home_team' => team1.name,
    'away_team' => team2.name
  }
)
fixture1.save()

fixture2 = Fixture.new (
  {
    'league_id' => league1.id,
    'league_name' => league1.name,
    'home_team' => team2.name,
    'away_team' => team1.name,
  }
)
fixture2.save()

match1 = Match.new (
  {
    'name' => 'Match Day 1',
    'team1_id' => team1.id,
    'team2_id' => team2.id,
    'fixture_id' => fixture1.id,
    'games_played' => '1',
    'score' => '2-0',
    'games_won' => '1',
    'games_lost' => '0',
    'goals_for' => '2',
    'goals_against' => '0',
    'points' => '3'
  }
)
match1.save()

match2 = Match.new (
  {
    'name' => 'Match Day 2',
    'team1_id' => team1.id,
    'team2_id' => team2.id,
    'fixture_id' => fixture2.id,
    'games_played' => '0',
    'score' => '',
    'games_won' => '0',
    'games_lost' => '0',
    'goals_for' => '0',
    'goals_against' => '0',
    'points' => '0'
  }
)
match2.save()



binding.pry

nil

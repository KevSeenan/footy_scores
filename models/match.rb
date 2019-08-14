require_relative('../db/sql_runner.rb')
require_relative('./team.rb')
require_relative('./fixture.rb')

class Match

  attr_reader :id
  attr_accessor :name, :team1_id, :team2_id, :fixture_id, :games_played, :score, :games_won,
                :games_lost, :goals_for, :goals_against, :points

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @team1_id = options['team1_id'].to_i()
    @team2_id = options['team2_id'].to_i()
    @fixture_id = options['fixture_id'].to_i()
    @games_played = options['games_played']
    @score = options['score']
    @games_won = options['games_won']
    @games_lost = options['games_lost']
    @goals_for = options['goals_for']
    @goals_against = options['goals_against']
    @points = options['points']
  end

#CREATE
  def save()
    sql = "INSERT INTO matches (name, team1_id, team2_id, fixture_id, games_played, score,
            games_won, games_lost, goals_for, goals_against, points)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING id"
    values = [@name, @team1_id, @team2_id, @fixture_id, @games_played, @score, @games_won, @games_lost, @goals_for, @goals_against, @points]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i()
  end

#DELETE
  def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end

#READ
  def self.all()
    sql = "SELECT * FROM matches"
    matches = SqlRunner.run(sql)
    result = matches.map{|match| Match.new(match)}
    return result
  end

  def team()
    team = Team.find(@id)
    return team
  end

  def teams()
    sql = "SELECT * FROM teams WHERE team_id = $1"
    values = [@id]
    teams = SqlRunner.run(sql, values)
    return teams.map{|team| Team.new(team)}
  end

  def fixtures()
    sql = "SELECT * FROM fixtures where id = $1"
    values = [@id]
    fixtures = SqlRunner.run(sql, values)
    return fixtures.map{|fixture| Fixture.new(fixture)}
  end

end

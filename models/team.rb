require_relative('../db/sql_runner.rb')
require_relative('./league.rb')
require_relative('./match.rb')

class Team

  attr_reader :id
  attr_accessor :name, :league_id, :team_points

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @league_id = options['league_id'].to_i()
    @match_id = options['match_id'].to_i()
  end

#CREATE
  def save()
    sql = "INSERT INTO teams (name, league_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @league_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i()
  end

#DELETE
  # def Team.delete_all()
  #   sql = "DELETE FROM teams"
  #   SqlRunner.run(sql)
  # end

#READ
  def self.all()
    sql = "SELECT * FROM teams"
    teams = SqlRunner.run(sql)
    result = teams.map{|team| Team.new(team)}
    return result
  end

#READ
  def self.find(id)
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    team = self.new(result.first)
    return team
  end

# Lists teams by league_id
  def self.find_league(league_id)
    sql = "SELECT * FROM teams WHERE league_id = $1"
    values = [league_id]
    teams = SqlRunner.run(sql, values)
    result = teams.map{|team| Team.new(team)}
    return result
  end

  def league()
    league = League.find(@league_id)
    return league
  end

#UPDATE
  def update()
    sql = "UPDATE teams SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

#DELETE
  def delete()
    sql = "DELETE FROM teams WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(team_data)
    return team_data.map {|team| Team.new(team)}
  end

  def matches()
    sql = "SELECT * FROM matches where id = $1"
    values = [@id]
    matches = SqlRunner.run(sql, values)
    return matches.map{|match| Match.new(match)}
  end

end

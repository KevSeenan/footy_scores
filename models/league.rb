require_relative('../db/sql_runner.rb')
require_relative('./team.rb')

class League

  attr_reader :id
  attr_accessor :name, :teams

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @teams = options['teams']
  end

#CREATE
  def save()
    sql = "INSERT INTO leagues (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i()
  end

# DELETE
  def League.delete_all()
    sql = "DELETE FROM leagues"
    SqlRunner.run(sql)
  end

#READ
  def self.all()
    sql = "SELECT * FROM leagues"
    leagues = SqlRunner.run(sql)
    result = leagues.map{|league| League.new(league)}
    return result
  end

#READ
  def self.find(id)
    sql = "SELECT * FROM leagues WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    league = self.new(result.first)
    return league
  end

  def team()
    team = Team.find(@id)
    return team
  end

#UPDATE
  def update()
    sql = "UPDATE leagues SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

#DELETE
  def delete()
    sql = "DELETE FROM leagues WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(league_data)
    return league_data.map { |league| League.new(league) }
  end

# List all teams in a league
  def teams()
    sql = "SELECT * FROM teams WHERE league_id = $1"
    values = [@id]
    teams = SqlRunner.run(sql, values)
    return teams.map{|team| Team.new(team)}
  end


end

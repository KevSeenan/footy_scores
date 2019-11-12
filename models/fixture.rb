require_relative('../db/sql_runner.rb')
require_relative("../models/league.rb")
require_relative("../models/team.rb")
require_relative("../models/match.rb")


class Fixture

  attr_reader :id
  attr_accessor :league_name, :home_team, :away_team

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @league_name = options['league_name']
    @home_team = options['home_team']
    @away_team = options['away_team']
  end

#CREATE
  def save()
    sql = "INSERT INTO fixtures (league_name, home_team, away_team)
            VALUES ($1, $2, $3) RETURNING id"
    values = [@league_name, @home_team, @away_team]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i()
  end

  def matches()
    sql = "SELECT * FROM matches WHERE fixture_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|match| Match.new(match)}
  end

#DELETE
  # def Fixture.delete_all()
  #   sql = "DELETE FROM fixtures"
  #   SqlRunner.run(sql)
  # end

#READ
  def self.all()
    sql = "SELECT * FROM fixtures"
    fixtures = SqlRunner.run(sql)
    result = fixtures.map{|fixture| Fixture.new(fixture)}
    return result
  end

#READ
    def self.find(id)
      sql = "SELECT * FROM fixtures WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values)
      fixture = self.new(result.first)
      return fixture
    end

end

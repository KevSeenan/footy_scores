require_relative('../db/sql_runner.rb')
require_relative("../models/league.rb")
require_relative("../models/team.rb")
require_relative("../models/match.rb")


class Fixture

  attr_reader :id
  attr_accessor :league_id, :league_name, :home_team, :away_team, :match_id, :match_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @league_id = options['league_id'].to_i()
    @league_name = options['league_name']
    @home_team = options['home_team']
    @away_team = options['away_team']
    @match_id = options['match_id'].to_i()
    @match_name = options['match_name']
  end

#CREATE
  def save()
    sql = "INSERT INTO fixtures (league_id, league_name, home_team, away_team, match_id, match_name)
            VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@league_id, @league_name, @home_team, @away_team, @match_id, @match_name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i()
  end

  def matches()
    sql = "SELECT matches.* FROM matches INNER JOIN fixtures ON matches.id = fixtures.match_id WHERE matches.id = $1;"
    values = [@match_id]
    results = SqlRunner.run(sql, values)
    return results.map {|match| Match.new(match)}
  end

#DELETE
  def Fixture.delete_all()
    sql = "DELETE FROM fixtures"
    SqlRunner.run(sql)
  end

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

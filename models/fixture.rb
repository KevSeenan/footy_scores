require_relative('../db/sql_runner.rb')
require_relative("../models/team.rb")
require_relative("../models/league.rb")


class Fixture

  attr_reader :id
  attr_accessor :name, :team_id, :league_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @team_id = options['team_id'].to_i()
    @league_id = options['league_id'].to_i()
    @match_id = options['match_id'].to_i()
  end

#CREATE
  def save()
    sql = "INSERT INTO fixtures (name, team_id, league_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @team_id, @league_id]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i()
  end

end

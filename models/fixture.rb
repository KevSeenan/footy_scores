require_relative('../db/sql_runner.rb')
require_relative("../models/league.rb")
require_relative("../models/team.rb")
require_relative("../models/match.rb")


class Fixture

  attr_reader :id
  attr_accessor :league_id, :home_team, :away_team, :match_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @league_id = options['league_id'].to_i()
    @home_team = options['home_team']
    @away_team = options['away_team']
    @match_id = options['match_id'].to_i()
  end

#CREATE
  def save()
    sql = "INSERT INTO fixtures (league_id, home_team, away_team, match_id) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@league_id, @home_team, @away_team, @match_id]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i()
  end

end

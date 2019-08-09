require_relative('../db/sql_runner.rb')

class Team

  attr_reader :id, :name
  attr_accessor :league_id

  def initialize(options)
    @id = options[id].to_i if options['id']
    @name = options['name']
    @league_id = options['league_id'].to_i()
  end

  def save()
    sql = "INSERT INTO teams (name, league_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @league_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end

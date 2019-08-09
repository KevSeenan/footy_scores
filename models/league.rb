require_relative('../db/sql_runner.rb')

class League

  attr_reader :id
  attr_accessor :name, :teams

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @teams = []
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
    league_details = SqlRunner.run(sql)
    leagues = map_items(league_details)
    return leagues
  end

#READ
  def self.find(id)
    sql = "SELECT * FROM leagues WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    league = League.new(result)
    return league
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

end

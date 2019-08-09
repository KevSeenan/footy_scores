
require_relative('../db/sql_runner')

class League

  attr_reader :id, :name
  attr_accessor :teams

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @teams = []
  end

  def save()
    sql = "INSERT INTO leagues (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i()
  end

  def self.find(id)
    sql = "SELECT * FROM leagues WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    league = League.new(result)
    return league
  end

end

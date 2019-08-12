require_relative('../db/sql_runner.rb')
require_relative('./team.rb')

class Match

  attr_reader :id
  attr_accessor :name, :score

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @score = options['score']
  end

#CREATE
  def save()
    sql = "INSERT INTO matches (name, score) VALUES ($1, $2) RETURNING id"
    values = [@name, @score]
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

end

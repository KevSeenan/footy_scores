require_relative("../models/team.rb")
require_relative("../models/league.rb")


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

end

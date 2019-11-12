require_relative('../db/sql_runner.rb')

# This class has been created to remove the delete_all() functions from each model
# so that duplication of code can be reduced. Below are some examples of how I
# would try to takle reducing duplication

# My first thought would be to have each model listed as below with the delete_all()
# function called each time. This however duplicates what is in the seed file that populates the tables
# with information. Each model would still need the delete_all() functions so this is likely not the way to do it

# Fixture.delete_all()
# Match.delete_all()
# Team.delete_all()
# League.delete_all()

# My second thought would be to create a Delete class that would take in a function
# that can be run to remove all of the information from each table

class Delete

  def Delete.delete_all()
    sql = "DELETE FROM #{'matches' + 'fixtures' + 'teams' + 'leagues'}"
    SqlRunner.run(sql)
  end

  # Another thought was to use TRUNCATE. This can be used to remove all data from a large
  # table but could also be used in this case to remove the duplicate code

  # def Delete.delete_all()
  #   sql = "TRUNCATE TABLE matches, fixtures, teams, leagues"
  #   SqlRunner.run(sql)
  # end

end

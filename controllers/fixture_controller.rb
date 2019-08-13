require_relative('../models/fixture.rb')
require_relative("../models/league.rb")
require_relative("../models/team.rb")
require_relative("../models/match.rb")

#INDEX
get "/fixtures" do
  @fixtures = Fixture.all()
  erb(:"fixtures/index")
end

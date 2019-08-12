require_relative("../models/match.rb")
require_relative("../models/team.rb")

#INDEX
get "/matches" do
  @matches = Match.all()
  erb(:"matches/index")
end

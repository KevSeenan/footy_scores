require_relative("../models/league.rb")
require_relative("../models/team.rb")

#INDEX
get "/leagues" do
  @leagues = League.all()
  erb(:"leagues/index")
end

# NEW
get "/leagues/new" do
  @leagues = League.all()
  erb(:"leagues/new")
end

# CREATE
post "/leagues" do
  league_hash = params
  league = League.new(league_hash)
  league.save()
  redirect "/leagues"
end

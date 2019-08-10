require_relative("../models/team.rb")
require_relative("../models/league.rb")

#INDEX
get "/teams" do
  @teams = Team.all()
  erb(:"teams/index")
end

# NEW
get "/teams/new" do
  @teams = Team.all()
  erb(:"teams/new")
end

# CREATE
post "/teams" do
  team_hash = params
  team = Team.new(team_hash)
  team.save()
  redirect "/teams"
end

#DELETE
post "/teams/:id/delete" do
  id = params[:id].to_i()
  team = Team.find(id)
  team.delete()
  redirect "/teams"
end

#SHOW
get "/teams/:id" do
  id = params[:id].to_i()
  @team = Team.find(id)
  erb(:"teams/show")
end

require_relative("../models/team.rb")

#INDEX
get "/teams" do
  @teams = Team.all()
  erb(:"teams/index")
end

#SHOW
get "/teams/:id" do
  id = params[:id].to_i()
  @team = Team.find(id)
  erb(:"teams/show")
end

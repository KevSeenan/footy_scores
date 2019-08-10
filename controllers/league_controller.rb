require_relative("../models/league.rb")

#INDEX
get "/leagues" do
  @leagues = League.all()
  erb(:"leagues/index")
end

#SHOW
get "/leagues/:id" do
  id = params[:id].to_i()
  @league = League.find(id)
  erb(:"leagues/show")
end

require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
also_reload("./models/*")

require_relative("./controllers/league_controller.rb")
require_relative("./controllers/team_controller.rb")

get "/" do
  erb(:home)
end

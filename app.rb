require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/team_controller.rb')
require_relative('controllers/game_controller.rb')

get '/' do
  erb( :index )
end

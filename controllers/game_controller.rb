require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/game.rb')
require_relative('../models/team.rb')

get '/games' do
  @games = Game.all()
  erb( :"game/index" )
end

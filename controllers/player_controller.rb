require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/player.rb')
require_relative('../models/team.rb')

# READ ALL PLAYERS
get '/players' do
  @players = Player.all
  erb( :"player/index")
end

# CREATE NEW PLAYER
get '/players/new' do
  @teams = Team.all
  erb(:"player/new")
end

post '/players' do
  player = Player.new(params)
  player.save()
  redirect to("/players")
end

# SHOW INDIVIDUAL PLAYER
get '/players/:id' do
  @player = Player.find(params[:id])
  erb(:"player/show")
end

# UPDATE Game
get '/players/:id/edit' do
  @teams = Team.all
  @players = Player.all
  @players = Player.find(params[:id])
  erb(:"player/edit")
end

post '/players/:id/edit' do
  @player = Player.new(params)
  @player.update()
  redirect to("/players")
end


# DELETE PLAYER
post '/players/:id/delete' do
  player = Player.find(params[:id])
  player.delete
  redirect to ('/players')
end

require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/game.rb')
require_relative('../models/team.rb')


# READ ALL GAMES
get '/games' do
  @games = Game.all()
  erb( :"game/index" )
end

# CREATE GAME
get '/games/new' do
  @teams = Team.all()
  erb( :"game/new")
end

post '/games' do
  game = Game.new(params)
  game.save()
  redirect to("/games")
end

# SHOW INDIVIDUAL GAME

get '/games/:id' do
  @game = Game.find(params[:id])
  erb(:"game/show")
end

# UPDATE Game
get '/games/:id/edit' do
  @teams = Team.all
  @game = Game.find(params[:id])
  erb(:"game/edit")
end

post '/games/:id/edit' do
  @game = Game.new(params)
  @game.update()
  redirect to("/games")
end

# DELETE GAME
post '/games/:id/delete' do
  game = Game.find(params[:id])
  game.delete
  redirect to ("/games")
end

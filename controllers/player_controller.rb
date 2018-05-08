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

# SHOW INDIVIDUAL PLAYER

# DELETE PLAYER

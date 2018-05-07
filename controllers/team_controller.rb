require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team.rb')
require_relative('../models/game.rb')

# READ ALL TEAMS
get '/teams' do
  @teams = Team.all()
  erb( :"team/index" )
end

# CREATE TEAM
get '/teams/new' do
  erb(:"team/new")
end

post '/teams' do
  @team = Team.new(params)
  @team.save()
  erb(:"team/team_added")
end

# SHOW TEAM
get '/teams/:id' do
  @team = Team.find(params[:id])
  @games = @team.show_team_games
  erb(:"team/show")
end

# SHOW GAMES FOR TEAM
# get '/teams/:id/games' do
#   team = Team.find(params[:id])
#   @games = team.show_team_games
#   erb(:"team/show_games")
# end


# DELETE TEAM
post '/teams/:id/delete' do
  team = Team.find(params[:id])
  team.delete
  redirect to 'teams'
end

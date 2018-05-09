require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team.rb')
require_relative('../models/game.rb')

# READ ALL TEAMS
get '/teams' do
  @teams = Team.sort_by_points()
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

# EDIT TEAM

get '/teams/:id/edit' do
  @team = Team.find(params[:id])
  erb(:"team/edit")
end

post '/teams/:id/edit' do
  @team = Team.new(params)
  @team.update()
  redirect to("/teams")
end

# DELETE TEAM
post '/teams/:id/delete' do
  team = Team.find(params[:id])
  team.delete
  redirect to 'teams'
end

# VIEW TEAM PLAYERS
get '/teams/:id/players' do
  @team = Team.find(params[:id])
  @players = @team.show_players
  erb(:"team/players")
end

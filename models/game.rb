require_relative('../db/sql_runner')

class Game

  attr_reader :id
  attr_accessor :home_team_id, :away_team_id, :home_team_score, :away_team_score

  def initialize(options)
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
  end

  def save()
    sql = "INSERT INTO games (home_team_id, away_team_id,
        home_team_score, away_team_score) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@home_team_id, @away_team_id, @home_team_score, @away_team_score]
    game_data = SqlRunner.run(sql, values)
    @id = game_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM games WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM games WHERE id = $1"
    values = [id]
    game_data = SqlRunner.run(sql, values)
    return Game.new(game_data.first)
  end

  def self.all()
    sql = "SELECT * FROM games"
    game_data = SqlRunner.run(sql)
    return game_data.map { |game| Game.new(game) }
  end

  def self.delete_all()
    sql = "DELETE FROM games"
    SqlRunner.run(sql)
  end
end

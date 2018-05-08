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

  def update()
    sql = "UPDATE games SET (home_team_id, away_team_id, home_team_score, away_team_score) =
          ($1, $2, $3, $4) WHERE id = $5"
    values = [@home_team_id, @away_team_id, @home_team_score, @away_team_score, @id]
    SqlRunner.run(sql, values)
  end

  def get_home_team_name
    sql = "SELECT teams.name FROM teams LEFT JOIN games ON games.home_team_id = teams.id WHERE games.id = $1"
    values = [@id]
    team_data = SqlRunner.run(sql, values)
    result = Team.new(team_data.first)
    return result.name
  end

  def get_away_team_name
    sql = "SELECT teams.name FROM teams LEFT JOIN games ON games.away_team_id = teams.id WHERE games.id = $1"
    values = [@id]
    team_data = SqlRunner.run(sql, values)
    result = Team.new(team_data.first)
    return result.name
  end

  def display_who_won
    name1 = get_home_team_name
    name2 = get_away_team_name
    if @home_team_score > @away_team_score
      return "#{name1} won"
    elsif @away_team_score > @home_team_score
      return "#{name2} won"
    else
      return "The game was a draw"
    end
  end

  # def get_team_victories
  #   sql = "SELECT COUNT(*) FROM games WHERE (home_team_id = $1 AND home_team_score > away_team_score) OR away_team_id = $1 AND away_team_score > home_team_score)"
  #   values = [@id]
  #   team_data = SqlRunner.run(sql, values)
  #   return result
  # end

  def home_team()
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Team.new(results.first)
  end

  def away_team()
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Team.new(results[1])
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

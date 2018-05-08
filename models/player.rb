require_relative('../db/sql_runner')

class Player

  attr_reader :id
  attr_accessor :first_name, :last_name, :position, :team_id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @position = options['position']
    @team_id = options['team_id'].to_i
  end

  def save()
    sql = "INSERT INTO players (first_name, last_name,
        position, team_id) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @position, @team_id]
    player_data = SqlRunner.run(sql, values)
    @id = player_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM players WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE players SET (first_name, last_name, position, team_id) =
          ($1, $2, $3, $4) WHERE id = $5"
    values = [@hfirst_name, @last_name, @position, @team_id, @id]
    SqlRunner.run(sql, values)
  end

  def player_full_name()
    return "#{first_name}" + " #{last_name}"
  end

  def get_player_team_name()
    teams = Team.all
    for team in teams
      if team.id == @team_id
        return team.name
      end
    end
  end

  # CLASS METHODS BELOW

  def self.find(id)
    sql = "SELECT * FROM players WHERE id = $1"
    values = [id]
    player_data = SqlRunner.run(sql, values)
    return Player.new(player_data.first)
  end

  def self.all()
    sql = "SELECT * FROM players"
    player_data = SqlRunner.run(sql)
    return player_data.map { |player| Player.new (player) }
  end

  def self.delete_all()
    sql = "DELETE FROM players"
    SqlRunner.run(sql)
  end

end

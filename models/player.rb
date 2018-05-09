require_relative('../db/sql_runner')

class Player

  attr_reader :id
  attr_accessor :first_name, :last_name, :position, :team_id, :transfer_value

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @position = options['position']
    @team_id = options['team_id'].to_i
    @transfer_value = options['transfer_value'].to_i
  end

  def save()
    sql = "INSERT INTO players (first_name, last_name,
        position, team_id, transfer_value) VALUES ($1, $2, $3, $4, $5) RETURNING *"
    values = [@first_name, @last_name, @position, @team_id, @transfer_value]
    player_data = SqlRunner.run(sql, values)
    @id = player_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM players WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE players SET (first_name, last_name, position, team_id, transfer_value) =
          ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@first_name, @last_name, @position, @team_id, @transfer_value,  @id]
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

  def get_team_funds()
    teams = Team.all
    for team in teams
      if team.id == @team_id
        return team.transfer_funds
      end
    end
  end

  def get_player_team()
    teams = Team.all
    for team in teams
      if team.id == @team_id
        return team
      end
    end
  end

  def transfer_player(new_team_id)
    old_team = self.get_player_team
    new_team = Team.find(new_team_id)
    self.team_id = new_team_id
    old_team.transfer_funds += self.transfer_value
    old_team.update()
    new_team.transfer_funds -= self.transfer_value
    new_team.update
    self.update
    return self
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

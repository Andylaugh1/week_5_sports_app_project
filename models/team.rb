require_relative('../db/sql_runner.rb')

class Team

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ($1) RETURNING *"
    values = [@name]
    team_data = SqlRunner.run(sql, values)
    @id = team_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM teams WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [id]
    team_data = SqlRunner.run(sql, values)
    result = Team.new (team_data.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM teams"
    team_data = SqlRunner.run(sql)
    result = team_data.map { |team| Team.new (team) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end
end

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

  

end

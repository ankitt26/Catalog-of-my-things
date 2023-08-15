require_relative 'item'
require 'date'

class Game < Item
  attr_accessor

  def initialize(multiplayer, last_played)
    super('2000-04-01')
    @multiplayer = multiplayer
    @last_played = last_played
  end

  def can_be_archived?
    current_date = Date.today.year
    last_played = Date.parse(@last_played).year
    game_archivable = current_date - last_played > 2
    super && game_archivable
  end
end

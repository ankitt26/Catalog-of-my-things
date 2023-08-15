require_relative 'item'
require 'date'

class Game < Item
  attr_accessor

  def initialize(multiplayer, last_played)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played = @last_played = Date.parse(last_played)
    @publish_date = publish_date
  end

  def can_be_archived?
    current_year = Date.today.year
    last_played_year = @last_played.year
    game_archivable = current_year - last_played_year > 2
    super && game_archivable
  end
end

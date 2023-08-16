require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    @publish_date = publish_date
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    last_played_year = @last_played_at.year
    game_archivable = current_year - last_played_year > 2
    super && game_archivable
  end
end

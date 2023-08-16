require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    @publish_date = publish_date
  end

  def to_hash
    {
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played' => @last_played_at
    }
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    last_played_year = @last_played_at.year
    game_archivable = current_year - last_played_year > 2
    super && game_archivable
  end
end

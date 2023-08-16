require_relative 'item'

class MusicAlbum < Item
  attr_reader :publish_date, :on_spotify

  def initialize(publish_date, on_spotify: true)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def to_hash
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify,
      'archived' => @archived
    }
  end

  private

  def can_be_archived?
    super() && @on_spotify
  end
end

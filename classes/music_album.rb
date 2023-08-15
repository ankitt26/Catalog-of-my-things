require_relative '../item'

class MusicAlbum < Item
  attr_reader :publish_date, :on_spotify

  def initialize(publish_date, on_spotify: true)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super() && @on_spotify
  end
end

wiz = MusicAlbum.new('2021-8-8')
puts wiz.can_be_archived?
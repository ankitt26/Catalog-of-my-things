require 'date'

class Item
  attr_accessor :publish_date, :genre, :author, :source, :label
  attr_reader :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    current_date = Date.today.year
    publish_date = Date.parse(@publish_date).year
    current_date - publish_date > 10
  end

  def move_to_archive
    @archived = can_be_archived? ? true : @archived
  end
end

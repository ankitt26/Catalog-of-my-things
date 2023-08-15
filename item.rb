require 'date'

class Item
  attr_accessor :publish_date, :genre, :author, :source, :label
  attr_reader :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    current_date = Date.today.year
    publish_date = Date.parse(@publish_date).year
    current_date - publish_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end

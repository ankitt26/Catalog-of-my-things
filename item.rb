require 'date'

class Item
  attr_accessor :publish_date, :genre, :author, :source, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    current_date = Date.today.year
    publish_date = Date.parse('2009-8-8').year
    current_date - publish_date > 10
  end
end

item1 = Item.new('2001-8-8')
puts item1.can_be_archived?



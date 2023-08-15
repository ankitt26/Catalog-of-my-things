class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title.to_s
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end

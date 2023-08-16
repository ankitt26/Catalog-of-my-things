class Genre
  attr_reader :name, :items

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_hash
    {
      'name' => @name,
      'items' => @items.map(&:to_hash)
    }
  end

  def summary
    {
      'name' => @name
    }
  end
end

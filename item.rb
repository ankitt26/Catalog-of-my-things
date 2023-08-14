class Item
  attr_accessor :publish_date
  attr_reader :genre, :author, :source, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end
end

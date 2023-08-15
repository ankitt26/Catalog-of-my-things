require_relative '../classes/label'

describe Label do
  before(:each) do
    @label = Label.new('qualified', 'green')
  end

  describe '#initialize' do
    it 'check for instance ' do
      expect(@label).to be_an_instance_of(Label)
    end

    it 'return title qualified' do
      expect(@label.title).to eq('qualified')
    end

    it 'return color green' do
      expect(@label.color).to eq('green')
    end

    it 'item should be an array' do
      expect(@label.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'items array include an item ' do
      item = Item.new('2018-8-8')
      @label.add_item(item)
      expect(@label.items).to include(item)
    end

    it 'item label should be SELF' do
      item = Item.new('2018-8-8')
      @label.add_item(item)
      expect(item.label).to eq(@label)
    end
  end
end

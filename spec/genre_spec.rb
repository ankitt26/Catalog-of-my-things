require_relative '../classes/genre'

describe Genre do
  before :each do
    @genre = Genre.new('Horror')
  end

  context 'Given Genre as the class and name as Horror' do
    it 'Should create an instance of the class and store it in the variable genre' do
      expect(@genre).to be_instance_of Genre
    end

    it 'Should return Horror as the genre name' do
      expect(@genre.name).to eq 'Horror'
    end
  end

  describe '#add_item' do
    context "Given 'dead zone' as parameter" do
      it 'Should increase the size of the items array' do
        item = Item.new('2018-8-8')
        @genre.add_item(item)
        expect(@genre.items.length).to eq 1
      end
    end
  end
end

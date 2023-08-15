require_relative '../classes/book'

describe Book do
  before(:each) do
    @book = Book.new('The Hobbit', 'good', '2022-10-06')
  end

  describe '#initialize' do
    it 'check for instance' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'check the publisher' do
      expect(@book.publisher).to eq('The Hobbit')
    end

    it 'check the publish_date' do
      expect(@book.publish_date).to eq('2022-10-06')
    end

    it 'check if cover_state is good or bad' do
      expect(%w[bad good]).to include(@book.cover_state)
    end
  end
end

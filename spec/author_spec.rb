require_relative '../classes/author'

describe Author do
  it 'it should take first_name and last_name arguments' do
    first_author = Author.new('John', 'Doe')
    expect("#{first_author.first_name} #{first_author.last_name}").to eq 'John Doe'
  end

  it 'Item array to take inputs' do
    second_author = Author.new('Jane', 'Doe')
    item = Item.new('2022-01-01')
    second_author.add_item(item)
    expect(second_author.instance_variable_get(:@items).length).to eq 1
  end
end

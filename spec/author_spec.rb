require_relative '../classes/author'

describe Author do
  it "it should take first_name and last_name arguments" do
    author_1 = Author.new("John", "Doe")
    expect("#{author_1.first_name} #{author_1.last_name}").to eq "John Doe"
  end

  it "Item array to take inputs" do
    author_2 = Author.new("Jane", "Doe")
    item = Item.new("2022-01-01") 
    author_2.add_item(item)
    expect(author_2.instance_variable_get(:@items).length).to eq 1
  end
  
end
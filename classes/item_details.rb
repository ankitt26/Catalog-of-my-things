require_relative 'author'
require_relative 'label'
require_relative 'genre'

module GetDataInfo
  def get_author(file, item)
    puts 'The Author?'
    print 'First name: '
    first_name = gets.chomp.to_s
    print 'last name: '
    last_name = gets.chomp.to_s

    author = Author.new(first_name, last_name)
    item.add_author(author)
    data = SaveRetrieveData.new
    data.save(file, author.to_hash)
    author.summary
  end

  def get_label(file, item)
    puts 'The Label?'
    print 'Title: '
    title = gets.chomp.to_s
    print 'Color: '
    color = gets.chomp.to_s
    label = Label.new(title, color)
    item.add_label(label)
    data = SaveRetrieveData.new
    data.save(file, label.to_hash)
    label.summary
  end

  def get_genre(file, item)
    puts 'The genre?'
    print 'Name: '
    name = gets.chomp.to_s
    genre = Genre.new(name)
    item.add_genre(genre)
    data = SaveRetrieveData.new
    data.save(file, genre.to_hash)
    genre.summary
  end
end

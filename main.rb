

class App
  def book_list
    puts "Book 1 \n Book 2 \n"
  end

  def music_albums
    puts "Glory Sound Prep \n Wasteland, Baby! \n"
  end

  def movies_list
    puts "Hobbits \n Lord of the Rings"
  end

  def games_list
    puts "Far Cry \n Uncharted"
  end

  def genre_list
    puts "Sci-Fi \n Adventure"
  end

  def labels_list
    puts "Gift \n New"
  end

  def authors_list
    puts "Ababio \n J.R.R Tolkien "
  end

  def source_list
    puts "From friend \n Gift from Mom"
  end

  def add_book
    puts "You have added a book"
  end

  def add_music_album
    puts "You have added album"
  end

  def add_movie
    puts "You have added movie"
  end

  def add_game
    puts "You have added a game"
  end
end


def main
  app = App.new
  puts "My Catalog"


end


def menu_options
  puts "\nPlease choose an option:"
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List all movies'
  puts '4. List all games'
  puts '5. List all genre'
  puts '6. List all labels'
  puts '7. List all authors'
  puts '8. List all sources'
  puts '9. Add a book'
  puts '10. Add a music album'
  puts '11. Add a movie'
  puts '12. Add a game'
  puts '13.  Exit'
end
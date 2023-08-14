class App
  def book_list
    puts "Book 1 \nBook 2 \n"
  end

  def music_albums
    puts "Glory Sound Prep \nWasteland, Baby!"
  end

  def movies_list
    puts "Hobbits \nLord of the Rings"
  end

  def games_list
    puts "Far Cry \nUncharted"
  end

  def genre_list
    puts "Sci-Fi \nAdventure"
  end

  def labels_list
    puts "Gift \nNew"
  end

  def authors_list
    puts "Ababio \nJ.R.R Tolkien "
  end

  def source_list
    puts "From friend \nGift from Mom"
  end

  def add_book
    puts 'You have added a book'
  end

  def add_music_album
    puts 'You have added album'
  end

  def add_movie
    puts 'You have added movie'
  end

  def add_game
    puts 'You have added a game'
  end
end

def main
  App.new
  puts 'My Catalog'

  app = App.new
  puts 'My Catalog'

  menu_selection = menu_hash(app)

  loop do
    menu_options
    choice = gets.chomp.to_i

    if menu_selection.key?(choice)
      menu_selection[choice].call
    else
      show_invalid_choice
    end
  end
end

def menu_hash(app)
  {
    1 => app.method(:book_list),
    2 => app.method(:music_albums),
    3 => app.method(:movies_list),
    4 => app.method(:games_list),
    5 => app.method(:genre_list),
    6 => app.method(:labels_list),
    7 => app.method(:authors_list),
    8 => app.method(:source_list),
    9 => app.method(:add_book),
    10 => app.method(:add_music_album),
    11 => app.method(:add_movie),
    12 => app.method(:add_game),
    13 => method(:exit_app)
  }
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
  puts '13. Exit'
end

def show_invalid_choice
  puts 'Invalid choice. Please try again.'
end

def exit_app
  puts 'Exiting the app. Goodbye!'
  exit
end

main

require_relative 'app'

def choose_option
  puts '**********************************************'
  puts "\n"
  'please choose an option by selecting a number
  1 - List all books
  2 - List all music albums
  3 - List of games
  4 - List all genres
  5 - List all labels
  6 - List all authors
  7 - Add a book
  8 - Add a music album
  9 - Add a game
  10 - Exit'
end

def user_list_options(choice, app)
  case choice
  when 1 then app.list_books
  when 2 then app.list_music_albums
  when 3 then app.list_games
  when 4 then app.list_genres
  when 5 then app.list_labels
  when 6 then app.list_authors
  end
end

def user_options(choice, app)
  case choice
  when 1..6 then user_list_options(choice, app)
  when 7 then app.add_book
  when 8 then app.add_music_album
  when 9 then app.add_game
  when 10
    puts 'Thanks for using this app'
    puts "\n***********************************************"
    exit
  else
    puts 'Selected number must be between 1 and 10'
  end
end

def main
  app = App.new
  puts "\n"
  puts '**********************************************'
  puts "\nCATALOG OF MY THINGS\n\n"

  loop do
    puts choose_option
    choice = gets.chomp.to_i
    puts "\n"
    user_options(choice, app)
    puts "\n"
  end
end

main

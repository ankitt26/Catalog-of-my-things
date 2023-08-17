require_relative 'app'

OPTIONS = {
  '1' => 'List all books',
  '2' => 'List all Music albums',
  '3' => 'List all Games',
  '4' => 'List all genres',
  '5' => 'List all labels',
  '6' => 'List all Authors',
  '7' => 'Add a book',
  '8' => 'Add a music album',
  '9' => 'Add a Game',
  '10' => 'Quit'
}.freeze

def main
  app = App.new
  puts '**********************************************'
  puts "\nCATALOG OF MY THINGS\n\n"
  puts '**********************************************'
  loop do
    puts 'Select an option to continue'
    OPTIONS.each { |index, string| puts "#{index} - #{string}" }
    user_option = gets.chomp.to_s
    case user_option
    when '1' then app.list_books
    when '2' then app.list_music_albums
    when '3' then app.list_games
    when '4' then app.list_genres
    when '5' then app.list_labels
    when '6' then app.list_authors
    when '7' then app.add_book
    when '8' then app.add_music_album
    when '9' then app.add_game
    when '10'
      puts 'Thanks for using this app'
      puts "\n***********************************************"
      exit
    else
      puts 'Invalid option, please select a number between 1 and 10'
    end
  end
end

main

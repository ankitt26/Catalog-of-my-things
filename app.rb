require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'classes/save_retrieve_data'
require_relative 'classes/game'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/item_details'
require 'json'

class App
  include GetDataInfo
  def initialize
    @save_retrieve_data = SaveRetrieveData.new
    @save_retrieve_data.create_files
  end

  def add_music_album
    print 'Publication date:'
    publish_date = gets.chomp
    print 'Is the Music album on spotify? [Y/N]:'
    on_spotify = gets.chomp.to_s.downcase
    puts 'Out of range' unless %w[y n].include?(on_spotify)
    yes = on_spotify == 'y'
    music = MusicAlbum.new(publish_date, on_spotify: yes)
    author = get_author('storage/authors.json', music)
    label = get_label('storage/label.json', music)
    genre = get_genre('storage/genres.json', music)
    music_to_hash = music.to_hash.merge({
                                          'author' => author,
                                          'label' => label,
                                          'genre' => genre
                                        })
    @save_retrieve_data.save('storage/music_albums.json', music_to_hash)
    puts 'Music album added successfully!'
  end

  def list_music_albums
    music_albums = @save_retrieve_data.get_data('storage/music_albums.json')
    puts 'The list is empty!' if music_albums.empty?
    music_albums.each do |music|
      author = music['author'].nil? ? 'Empty' : music['author']['first_name']
      genre = music['genre'].nil? ? 'Empty' : music['genre']['name']
      label = music['label'].nil? ? 'Empty' : music['label']['title']
      print "\n[Music Album] Author: #{author} | Genre: #{genre} | label: #{label} | "
      print "Published at: #{music['publish_date']} | On spotify: #{music['on_spotify']}"
    end
    puts "\n\n"
  end

  def list_genres
    genres = @save_retrieve_data.get_data('storage/genres.json')
    puts 'The list is empty!' if genres.empty?
    genres.each do |genre|
      puts "[Genre] #{genre['name']}"
    end
    puts "\n\n"
  end

  def list_authors
    authors = @save_retrieve_data.get_data('storage/authors.json')
    puts 'The list is empty!' if authors.empty?
    authors.each { |author| puts "[Author] First name : #{author['first_name']} | Last name: #{author['last_name']}" }
    puts "\n\n"
  end

  def list_games
    games = @save_retrieve_data.get_data('storage/games.json')
    puts 'The list is empty!' if games.empty?
    games.each do |game|
      author = game['author']['first_name']
      label = game['label']['title']
      genre = game['genre']['name']
      print "\n[Game] Author: #{author} | Label: #{label} | Genre: #{genre} | Multiplayer : #{game['multiplayer']}"
      print " | Publish date: #{game['publish_date']} | Last played_at: #{game['last_played']}"
    end
    puts "\n\n"
  end

  def add_game
    print 'Publish date: '
    publish = gets.chomp

    print 'Multiplayer [y/n]: '
    multiplayer = gets.chomp
    puts 'Out of range' unless %w[y n].include?(multiplayer)
    multiplayer_yes = multiplayer == 'y'

    print 'Last played at: '
    last_played_at = gets.chomp
    game = Game.new(publish, multiplayer_yes, last_played_at)
    author = get_author('storage/authors.json', game)
    label = get_label('storage/label.json', game)
    genre = get_genre('storage/genres.json', game)
    game_to_hash = game.to_hash.merge({
                                        'author' => author,
                                        'label' => label,
                                        'genre' => genre
                                      })
    @save_retrieve_data.save('storage/games.json', game_to_hash)
    puts "Game added successfully!\n"
  end

  def add_book
    puts 'A) Publication date (format: yyyy-mm-dd) :'
    publish_date = gets.chomp
    puts 'B) Name of publisher :'
    publisher = gets.chomp
    puts 'C) State of book cover (Bad or Good) :'
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    author = get_author('storage/authors.json', book)
    label = get_label('storage/label.json', book)
    genre = get_genre('storage/genres.json', book)
    book_to_hash = book.to_hash.merge(
      {
        'author' => author,
        'label' => label,
        'genre' => genre
      }
    )
    @save_retrieve_data.save('storage/books.json', book_to_hash)
    puts 'New book successfully added!'
  end

  def list_books
    books = @save_retrieve_data.get_data('storage/books.json')
    puts 'The list is empty!' if books.empty?
    books.each do |book|
      publisher_name = book['publisher']
      publish_date = book['publish_date']
      cover_state = book['cover_state']
      author = book['author']['first_name']
      label = book['label']['title']
      genre = book['genre']['name']
      print "\n[Book] Author:#{author} | Label: #{label} | Genre: #{genre} | "
      print "Publisher : #{publisher_name} | Published at: #{publish_date} | Cover: #{cover_state}"
    end
    puts "\n\n"
  end

  def list_labels
    labels = @save_retrieve_data.get_data('storage/label.json')
    puts 'The list is empty!' if labels.empty?
    labels.each_with_index do |label, index|
      puts "#{index + 1}) [Label] Title: #{label['title']} | Label Color: #{label['color']}"
    end
    puts "\n\n"
  end
end

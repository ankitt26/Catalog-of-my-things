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
end
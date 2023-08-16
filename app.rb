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
end
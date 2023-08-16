require 'json'

FILES = ['authors.json', 'genres.json', 'games.json', 'music_albums.json', 'books.json', 'label.json'].freeze

class SaveRetrieveData
  def create_files
    FILES.each do |file|
      File.write("./storage/#{file}", JSON.generate([])) unless File.exist?("./storage/#{file}")
    end
  end

  def get_data(file)
    file_data = File.read(file)
    JSON.parse(file_data)
    []
  end

  def save(file, data)
    data_from_file = get_data(file)
    file = File.open(file, 'w')

    data_from_file = [] unless data_from_file.is_a?(Array)

    unless data.is_a?(Array)
      data_from_file.push(data)
      file.write JSON.dump(data_from_file)
      return file.close
    end

    data_from_file.concat(data)
    file.write JSON.dump(data_from_file)
    file.close
  end
end

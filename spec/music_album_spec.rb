require_relative '../classes/music_album'

describe MusicAlbum do

  context 'Given MusicAlbum as the class' do
    album = MusicAlbum.new('2011-8-8', on_spotify: false)
    it "Should create an instance of the class and store it in the variable album" do
      expect(album).to be_instance_of MusicAlbum
    end

    it "Should return 2011-8-8 as the publish date" do
      expect(album.publish_date).to eq '2011-8-8'
    end

    it "Should return false as on_spotify value" do
      expect(album.on_spotify).to eq false
    end
  end

  describe "#can_be_archived" do
    context 'Given a publish_date earlier than 2013 and on_spotify = false' do
      it "Should return false" do
        album = MusicAlbum.new('2011-8-8', on_spotify: false)
        expect(album.can_be_archived?).to eq false
      end
    end

    context 'Given a publish_date later than 2013 and on_spotify = false' do
      it "Should return false" do
        album = MusicAlbum.new('2018-8-8', on_spotify: false)
        expect(album.can_be_archived?).to eq false
      end
    end

    context 'Given a publish_date earlier than 2013 and on_spotify = true' do
      it "Should return false" do
        album = MusicAlbum.new('2011-8-8', on_spotify: true)
        expect(album.can_be_archived?).to eq true
      end
    end

    context 'Given a publish_date later than 2013 and on_spotify = false' do
      it "Should return false" do
        album = MusicAlbum.new('2016-8-8', on_spotify: true)
        expect(album.can_be_archived?).to eq false
      end
    end
  end
end
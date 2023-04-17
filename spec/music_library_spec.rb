require 'music_library'

RSpec.describe MusicLibrary do
  context 'initially' do
    it "is empty" do
      tracks = MusicLibrary.new
      expect(tracks.all).to eq []
    end
  end

  context 'all' do
    it "returns all tracks" do
      music_library = MusicLibrary.new
      track1 = Track.new("my_title", "my_artist")
      track2 = Track.new("my_title2", "my_artist2")
      music_library.add(track1)
      music_library.add(track2)
      expect(music_library.all).to eq [track1, track2]
    end
  end
end
require 'music_library'
require 'track'

RSpec.describe "integration" do
  context "when we add a track to the libaray" do
    it "adds a track" do
      music_library = MusicLibrary.new
      track = Track.new("my_title", "my_artist")
      music_library.add(track)
      expect(music_library.all).to eq([track])
    end
  end

  context "when adding multiple tracks to the libaray" do
    it "adds multiple tracks" do
      music_library = MusicLibrary.new
      track1 = Track.new("my_title", "my_artist")
      track2 = Track.new("my_title2", "my_artist2")
      music_library.add(track1)
      music_library.add(track2)
      expect(music_library.all).to eq([track1, track2])
    end
  end

  context "with some tracks already in the library" do
    it "searches for those tracks by full title" do
      music_library = MusicLibrary.new
      track1 = Track.new("my_title", "my_artist")
      track2 = Track.new("my_title2", "my_artist2")
      music_library.add(track1)
      music_library.add(track2)
      result = music_library.search_by_title("my_title2")
      expect(result).to eq([track2])
    end

    it "searches for those tracks by partial title" do
      music_library = MusicLibrary.new
      track1 = Track.new("my_title", "my_artist")
      track2 = Track.new("my_title2", "my_artist2")
      music_library.add(track1)
      music_library.add(track2)
      result = music_library.search_by_title("title2")
      expect(result).to eq([track2])
    end
  end

  context "where there are no tracks matching" do
    it "yeilds an empty list" do
      music_library = MusicLibrary.new
      track2 = Track.new("my_title2", "my_artist2")
      music_library.add(track2)
      result = music_library.search_by_title("test")
      expect(result).to eq([])
    end
  end
end
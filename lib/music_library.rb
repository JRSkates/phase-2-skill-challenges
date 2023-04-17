# File: lib/music_library.rb

class MusicLibrary
  def initialize
    @tracks = []
  end
  
  def add(track) # track is an instance of Track
    @tracks.push(track)
  end
  
  def all
    @tracks
  end
    
  def search_by_title(keyword) # keyword is a string
    @tracks.select { |track| track.title.include?(keyword) }
  end
end
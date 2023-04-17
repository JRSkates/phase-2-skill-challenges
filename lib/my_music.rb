class MyMusic
  def initialize
    @my_track = []
  end
    
  def add(track) # track is a string
    @my_track.include?(track) ? (return "You have already added this song.") : @my_track.push(track)
  end
    
  def list
    @my_track.each { |track| track}
  end
end
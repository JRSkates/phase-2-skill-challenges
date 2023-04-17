class Track
  def initialize(title, artist) 
    @title = title
    @artist = artist# title and artist are both strings
  end
  
  def title
    return @title
  end

  def artist
    return @artist
  end
  
  def format
    return "#{@title} by #{@artist}"
  end
end
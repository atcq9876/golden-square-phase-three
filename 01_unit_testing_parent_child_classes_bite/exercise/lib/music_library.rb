class MusicLibrary
  def initialize
    @library = []
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
    @library << track
  end

  def all
    # Returns a list of track objects
    @library.empty? ? (raise "No tracks added yet") : @library
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
    raise "No tracks added yet" if @library.empty?
    raise "Please enter a valid keyword" if (!keyword.is_a? String)
    matches = []
    @library.each do |track|
      matches << track if track.matches?(keyword)
    end
    matches.empty? ? (raise "No tracks contain that keyword") : matches
  end
end

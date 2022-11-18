class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
    raise "Please enter a valid track" if (!@title.is_a? String) || (!@artist.is_a? String)
    raise "Please enter a valid track" if (@title == "") || (@artist == "")
  end

  def matches?(keyword) # keyword is a string
    # Returns true if the keyword matches either the title or artist
    raise "Please enter a valid keyword" if (!keyword.is_a? String) || (keyword == "")
    return true if @title.downcase.include?(keyword.downcase)
    return true if @artist.downcase.include?(keyword.downcase)
    false
  end
end

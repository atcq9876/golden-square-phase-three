require 'music_library'


# Mock tests

describe "integration" do
  describe "MusicLibrary's #add and #all, and related DiaryEntry methods" do
    context "when adding two tracks and calling #all" do
      it "returns both tracks" do
        track_1 = FakeTrack.new
        track_2 = FakeTrack.new
        library = MusicLibrary.new
        library.add(track_1)
        library.add(track_2)
        expect(library.all).to eq [track_1, track_2]
      end
    end
  end

  describe "MusicLibrary's #search and #add, and related DiaryEntry methods" do
    context "add three tracks and search for a keyword contained in one track" do
      it "returns said track" do
        track_1 = FakeTrackSearch.new("Steve Biko", "A Tribe Called Quest")
        track_2 = FakeTrackSearch.new("Award Tour", "Tribe")
        track_3 = FakeTrackSearch.new("Ego Trippin'", "De La Soul")
        library = MusicLibrary.new
        library.add(track_1)
        library.add(track_2)
        library.add(track_3)
        expect(library.search("Tour")).to eq [track_2]
      end
    end

    context "add three tracks and search for a keyword that doesn't match" do
      it "raises error" do
        track_1 = FakeTrackSearch.new("Steve Biko", "A Tribe Called Quest")
        track_2 = FakeTrackSearch.new("Award Tour", "Tribe")
        track_3 = FakeTrackSearch.new("Ego Trippin'", "De La Soul")
        library = MusicLibrary.new
        library.add(track_1)
        library.add(track_2)
        library.add(track_3)
        expect{library.search("test")}.to raise_error "No tracks contain that keyword"
      end
    end

    context "add three tracks and search for non-string keyword" do
      it "raises error" do
        track_1 = FakeTrackSearch.new("Steve Biko", "A Tribe Called Quest")
        track_2 = FakeTrackSearch.new("Award Tour", "Tribe")
        track_3 = FakeTrackSearch.new("Ego Trippin'", "De La Soul")
        library = MusicLibrary.new
        library.add(track_1)
        library.add(track_2)
        library.add(track_3)
        expect{library.search(5)}.to raise_error "Please enter a valid keyword"
      end
    end
  end
end

class FakeTrack
end

class FakeTrackSearch
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
    # Returns true if the keyword matches either the title or artist
    raise "Please enter a valid keyword" if (!keyword.is_a? String) || (keyword == "")
    return true if @title.downcase.include?(keyword.downcase)
    return true if @artist.downcase.include?(keyword.downcase)
    false
  end
end




# Other unit tests

describe "#all" do
  context "when no tracks added" do
    it "fails" do
      library = MusicLibrary.new
      expect{library.all}.to raise_error "No tracks added yet"
    end
  end
end

describe "#search" do
  context "when no tracks added" do
    it "fails" do
      library = MusicLibrary.new
      expect{library.search("test")}.to raise_error "No tracks added yet"
    end
  end
end







# general tests

  # 1
    #all - no tracks added

  # 2
    #search - no tracks added




# mock tests (base on integration tests)

# describe "integration" do
#   describe "MusicLibrary's #add and #all, and related DiaryEntry methods" do
#     context "when adding two tracks and calling #all" do
#       it "returns both tracks" do
#         track_1 = Track.new("Steve Biko", "A Tribe Called Quest")
#         track_2 = Track.new("Award Tour", "Tribe")
#         library = MusicLibrary.new
#         library.add(track_1)
#         library.add(track_2)
#         expect(library.all).to eq [track_1, track_2]
#       end
#     end
#   end

#   describe "MusicLibrary's #search and #add, and related DiaryEntry methods" do
#     context "add three tracks and search for a keyword contained in one track" do
#       it "returns said track" do
#         track_1 = Track.new("Steve Biko", "A Tribe Called Quest")
#         track_2 = Track.new("Award Tour", "Tribe")
#         track_3 = Track.new("Ego Trippin'", "De La Soul")
#         library = MusicLibrary.new
#         library.add(track_1)
#         library.add(track_2)
#         library.add(track_3)
#         expect(library.search("Tour")).to eq [track_2]
#       end
#     end

#     context "add three tracks and search for a keyword that doesn't match" do
#       it "raises error" do
#         track_1 = Track.new("Steve Biko", "A Tribe Called Quest")
#         track_2 = Track.new("Award Tour", "Tribe")
#         track_3 = Track.new("Ego Trippin'", "De La Soul")
#         library = MusicLibrary.new
#         library.add(track_1)
#         library.add(track_2)
#         library.add(track_3)
#         expect{library.search("test")}.to raise_error "No tracks contain that keyword"
#       end
#     end

#     context "add three tracks and search for non-string keyword" do
#       it "raises error" do
#         track_1 = Track.new("Steve Biko", "A Tribe Called Quest")
#         track_2 = Track.new("Award Tour", "Tribe")
#         track_3 = Track.new("Ego Trippin'", "De La Soul")
#         library = MusicLibrary.new
#         library.add(track_1)
#         library.add(track_2)
#         library.add(track_3)
#         expect{library.search(5)}.to raise_error "Please enter a valid keyword"
#       end
#     end
#   end
# end
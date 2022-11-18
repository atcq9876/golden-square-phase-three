require 'music_library'


# Mock tests

describe "integration" do
  describe "MusicLibrary's #add and #all, and related DiaryEntry methods" do
    context "when adding two tracks and calling #all" do
      it "returns both tracks" do
        fake_track_1 = double :track
        fake_track_2 = double :track
        library = MusicLibrary.new
        library.add(fake_track_1)
        library.add(fake_track_2)
        expect(library.all).to eq [fake_track_1, fake_track_2]
      end
    end
  end

  describe "MusicLibrary's #search and #add, and related DiaryEntry methods" do
    context "add three tracks and search for a keyword contained in one track" do
      it "returns said track" do
        fake_track_1 = double :track
        expect(fake_track_1).to receive(:matches?).with("Tour").and_return(false)
        fake_track_2 = double :track
        expect(fake_track_2).to receive(:matches?).with("Tour").and_return(true)
        fake_track_3 = double :track
        expect(fake_track_3).to receive(:matches?).with("Tour").and_return(false)
        library = MusicLibrary.new
        library.add(fake_track_1)
        library.add(fake_track_2)
        library.add(fake_track_3)
        expect(library.search("Tour")).to eq [fake_track_2]
      end
    end

    context "add three tracks and search for a keyword that doesn't match" do
      it "raises error" do
        fake_track_1 = double :track
        expect(fake_track_1).to receive(:matches?).with("test").and_return(false)
        fake_track_2 = double :track
        expect(fake_track_2).to receive(:matches?).with("test").and_return(false)
        fake_track_3 = double :track
        expect(fake_track_3).to receive(:matches?).with("test").and_return(false)
        library = MusicLibrary.new
        library.add(fake_track_1)
        library.add(fake_track_2)
        library.add(fake_track_3)
        expect{library.search("test")}.to raise_error "No tracks contain that keyword"
      end
    end

    context "add three tracks and search for non-string keyword" do
      it "raises error" do
        fake_track_1 = double :track
        fake_track_2 = double :track
        fake_track_3 = double :track
        library = MusicLibrary.new
        library.add(fake_track_1)
        library.add(fake_track_2)
        library.add(fake_track_3)
        expect{library.search(5)}.to raise_error "Please enter a valid keyword"
      end
    end
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








# # Original mock tests written before watching solution

# describe "integration" do
#   describe "MusicLibrary's #add and #all, and related DiaryEntry methods" do
#     context "when adding two tracks and calling #all" do
#       it "returns both tracks" do
#         fake_track_1 = FakeTrack.new
#         fake_track_2 = FakeTrack.new
#         library = MusicLibrary.new
#         library.add(fake_track_1)
#         library.add(fake_track_2)
#         expect(library.all).to eq [fake_track_1, fake_track_2]
#       end
#     end
#   end

#   describe "MusicLibrary's #search and #add, and related DiaryEntry methods" do
#     context "add three tracks and search for a keyword contained in one track" do
#       it "returns said track" do
#         fake_track_1 = FakeTrackSearch.new("Steve Biko", "A Tribe Called Quest")
#         fake_track_2 = FakeTrackSearch.new("Award Tour", "Tribe")
#         fake_track_3 = FakeTrackSearch.new("Ego Trippin'", "De La Soul")
#         library = MusicLibrary.new
#         library.add(fake_track_1)
#         library.add(fake_track_2)
#         library.add(fake_track_3)
#         expect(library.search("Tour")).to eq [fake_track_2]
#       end
#     end

#     context "add three tracks and search for a keyword that doesn't match" do
#       it "raises error" do
#         fake_track_1 = FakeTrackSearch.new("Steve Biko", "A Tribe Called Quest")
#         fake_track_2 = FakeTrackSearch.new("Award Tour", "Tribe")
#         fake_track_3 = FakeTrackSearch.new("Ego Trippin'", "De La Soul")
#         library = MusicLibrary.new
#         library.add(fake_track_1)
#         library.add(fake_track_2)
#         library.add(fake_track_3)
#         expect{library.search("test")}.to raise_error "No tracks contain that keyword"
#       end
#     end

#     context "add three tracks and search for non-string keyword" do
#       it "raises error" do
#         fake_track_1 = FakeTrackSearch.new("Steve Biko", "A Tribe Called Quest")
#         fake_track_2 = FakeTrackSearch.new("Award Tour", "Tribe")
#         fake_track_3 = FakeTrackSearch.new("Ego Trippin'", "De La Soul")
#         library = MusicLibrary.new
#         library.add(fake_track_1)
#         library.add(fake_track_2)
#         library.add(fake_track_3)
#         expect{library.search(5)}.to raise_error "Please enter a valid keyword"
#       end
#     end
#   end
# end


# class FakeTrack
# end

# class FakeTrackSearch
#   def initialize(title, artist)
#     @title = title
#     @artist = artist
#   end

#   def matches?(keyword) # keyword is a string
#     # Returns true if the keyword matches either the title or artist
#     raise "Please enter a valid keyword" if (!keyword.is_a? String) || (keyword == "")
#     return true if @title.downcase.include?(keyword.downcase)
#     return true if @artist.downcase.include?(keyword.downcase)
#     false
#   end
# end
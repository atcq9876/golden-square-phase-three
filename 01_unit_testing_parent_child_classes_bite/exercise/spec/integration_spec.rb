require 'music_library'
require 'track'


describe "integration" do
  describe "MusicLibrary's #add and #all, and related DiaryEntry methods" do
    context "when adding two tracks and calling #all" do
      it "returns both tracks" do
        track_1 = Track.new("Steve Biko", "A Tribe Called Quest")
        track_2 = Track.new("Award Tour", "Tribe")
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
        track_1 = Track.new("Steve Biko", "A Tribe Called Quest")
        track_2 = Track.new("Award Tour", "Tribe")
        track_3 = Track.new("Ego Trippin'", "De La Soul")
        library = MusicLibrary.new
        library.add(track_1)
        library.add(track_2)
        library.add(track_3)
        expect(library.search("Tour")).to eq [track_2]
      end
    end

    context "add three tracks and search for a keyword that doesn't match" do
      it "raises error" do
        track_1 = Track.new("Steve Biko", "A Tribe Called Quest")
        track_2 = Track.new("Award Tour", "Tribe")
        track_3 = Track.new("Ego Trippin'", "De La Soul")
        library = MusicLibrary.new
        library.add(track_1)
        library.add(track_2)
        library.add(track_3)
        expect{library.search("test")}.to raise_error "No tracks contain that keyword"
      end
    end

    context "add three tracks and search for non-string keyword" do
      it "raises error" do
        track_1 = Track.new("Steve Biko", "A Tribe Called Quest")
        track_2 = Track.new("Award Tour", "Tribe")
        track_3 = Track.new("Ego Trippin'", "De La Soul")
        library = MusicLibrary.new
        library.add(track_1)
        library.add(track_2)
        library.add(track_3)
        expect{library.search(5)}.to raise_error "Please enter a valid keyword"
      end
    end
  end
end

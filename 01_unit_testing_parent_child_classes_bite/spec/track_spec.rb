require 'track'


describe "#initialize" do
  context "when passed valid arguments" do
    it "successfully constructs" do
      track = Track.new("Award Tour", "Tribe")
      expect(track.is_a? Track).to eq true
    end
  end

  context "when passed non-string arguments" do
    it "raises error" do
      expect{track = Track.new(5, nil)}.to raise_error "Please enter a valid track"
    end
  end

  context "when passed empty argument(s)" do
    it "raises error" do
      expect{track = Track.new("", "Test")}.to raise_error "Please enter a valid track"
    end
  end      
end

describe "#matches?" do
  context "with track that contains keyword" do
    it "returns true" do
      track = Track.new("Award Tour", "Tribe")
      expect(track.matches?("Tour")).to eq true
    end
  end
end

describe "#matches?" do
  context "with track that doesn't contain keyword" do
    it "returns false" do
      track = Track.new("Award Tour", "Tribe")
      expect(track.matches?("Test")).to eq false
    end
  end

  context "with non-string keyword passed to method" do
    it "fails" do
      track = Track.new("Award Tour", "Tribe")
      expect{track.matches?(2)}.to raise_error "Please enter a valid keyword"
    end
  end

  context "with empty string keyword passed to method" do
    it "fails" do
      track = Track.new("Award Tour", "Tribe")
      expect{track.matches?("")}.to raise_error "Please enter a valid keyword"
    end
  end
end

require 'diary'

RSpec.describe Diary do
  describe "#contents" do
    it "returns contents" do
      diary = Diary.new("Contents")
      expect(diary.read).to eq "Contents"
    end
  end
end

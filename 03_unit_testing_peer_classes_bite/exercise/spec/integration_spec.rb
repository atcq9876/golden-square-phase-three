require 'secret_diary'
require 'diary'

RSpec.describe "integration" do
  context "when trying to read a locked diary" do
    it "raises the error 'Go away!'" do
      diary = Diary.new("Diary contents")
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "when trying to read an unlocked diary" do
    it "returns the diary's contents" do
      diary = Diary.new("Diary contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "Diary contents"
    end
  end

  context "when trying unlocking, relocking, then reading diary" do
    it "raises the error 'Go away!'" do
      diary = Diary.new("Diary contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end
end

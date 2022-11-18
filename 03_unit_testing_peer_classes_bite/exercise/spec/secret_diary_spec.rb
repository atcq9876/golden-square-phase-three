require 'secret_diary'

# unit tests imitating integration
RSpec.describe "integration mocking" do
  context "when trying to read a locked diary" do
    it "raises the error 'Go away!'" do
      fake_diary = double :fake_diary
      secret_diary = SecretDiary.new(fake_diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "when trying to read an unlocked diary" do
    it "returns the diary's contents" do
      fake_diary = double :fake_diary, read: "Diary contents"
      secret_diary = SecretDiary.new(fake_diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "Diary contents"
    end
  end

  context "when trying to read a locked diary" do
    it "raises the error 'Go away!'" do
      fake_diary = double :fake_diary
      secret_diary = SecretDiary.new(fake_diary)
      secret_diary.unlock
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end
end
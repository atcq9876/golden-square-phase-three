class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
    @diary_unlocked = false
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
    raise "Go away!" if @diary_unlocked == false
    @diary.read
  end

  def lock
    # Locks the diary
    # Returns nothing
    @diary_unlocked = false
  end

  def unlock
    # Unlocks the diary
    # Returns nothing
    @diary_unlocked = true
  end
end
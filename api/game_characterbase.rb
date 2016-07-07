# Used to set move speed and frequency (extends RPG Maker class)
class Game_CharacterBase
    
  def move_speed=(value)
    @move_speed = value
  end
  def move_frequency=(value)
    @move_frequency = value
  end
end
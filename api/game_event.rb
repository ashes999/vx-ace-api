# Used to set event direction
class Game_Event < Game_Character

  def stop_walking
    @move_type = 0 # stop moving
    @direction_fix = true # don't change direction if talked to    
  end
  
  # 0, 1, or 2 for first, second, or third frame
  def animation_frame=(value)
    @pattern = @original_pattern = value
  end
end
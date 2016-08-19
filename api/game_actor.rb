class Game_Actor < Game_Battler
  def has_skill?(name)
    self.skills.each do |s|
      return true if s.name.downcase == name.downcase
    end
    return false
  end
end

### Infrastructure for pre-/post-attack hooks
class Game_Actor < Game_Battler
  def before_attack
  end
  
  def after_attack
  end
end
### End pre-/post-attack hooks
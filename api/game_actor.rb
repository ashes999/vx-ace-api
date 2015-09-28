class Game_Actor < Game_Battler
  def has_skill?(name)
    self.skills.each do |s|
      return true if s.name.downcase == name.downcase
    end
    return false
  end
end
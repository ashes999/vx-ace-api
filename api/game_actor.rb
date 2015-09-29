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
 
class Scene_Battle < Scene_Base
  alias_method :original_execute_action, :execute_action
  alias_method :original_process_action_end, :process_action_end
  
  def execute_action     
    attacker = @subject
    action = attacker.current_action
    if $game_party.members.include?(attacker) && !action.nil? && action.attack?
      attacker.before_attack
      @attack_stats = {:attacker => attacker, :damage => action.item.damage}
    end
    original_execute_action
  end
  
  def process_action_end
    original_process_action_end
    return if @attack_stats.nil?
    @attack_stats[:attacker].after_attack    
  end      
end
### End pre-/post-attack hooks
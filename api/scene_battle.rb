class Scene_Battle < Scene_Base

  alias_method :vxapi_execute_action, :execute_action
  alias_method :vxapi_process_action_end, :process_action_end
  alias_method :vxapi_pre_terminate, :pre_terminate
  
  @@pre_terminate_action = nil
  
  ## Use this to set a callback that executes after battle.
  def self.pre_terminate_action=(callback)
    @@pre_terminate_action = callback
  end
  
  ### everything below is private/internal ###
  
  def execute_action     
    attacker = @subject
    action = attacker.current_action
    if $game_party.members.include?(attacker) && !action.nil? && action.attack?
      attacker.before_attack
      @attack_stats = {:attacker => attacker, :damage => action.item.damage}
    end
    vxapi_execute_action
  end
  
  def process_action_end
    vxapi_process_action_end
    return if @attack_stats.nil?
    @attack_stats[:attacker].after_attack
  end
  
  def pre_terminate
    @@pre_terminate_action.call unless @@pre_terminate_action.nil?
    vxapi_pre_terminate
  end  
end
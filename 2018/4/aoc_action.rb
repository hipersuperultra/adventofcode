# nodoc
class AocAction
  attr_accessor :type, :robot_id

  TYPE_GUARD = :guard
  TYPE_FALLS = :falls
  TYPE_WAKES = :wakes

  def initialize(raw_action)
    action_method = raw_action[0..4].downcase
    action_method_name = "parse_#{action_method}_action"
    send(action_method_name, raw_action[6..-1])
  end

  private

  def parse_guard_action(action_params)
    @type = TYPE_GUARD
    @robot_id = action_params.scan(/#([0-9]+)/)[0][0].to_i
  end

  def parse_falls_action(_action_params)
    @type = TYPE_FALLS
  end

  def parse_wakes_action(_action_params)
    @type = TYPE_WAKES
  end

  def to_s
    "#{@type} #{print_action[@type]}"
  end

  def print_action
    {
      AocAction::TYPE_GUARD => "##{@robot_id} begins shift",
      AocAction::TYPE_FALLS => 'asleep',
      AocAction::TYPE_WAKES => 'up'
    }
  end
end

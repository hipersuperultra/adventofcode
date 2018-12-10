# nodoc
class AocEvent
  include Comparable
  attr_accessor :time, :action

  def initialize(time, action)
    @time = time
    @action = action
  end

  def <=>(other)
    @time <=> other.time
  end

  def to_s
    "[#{@time}] #{@action}"
  end
end

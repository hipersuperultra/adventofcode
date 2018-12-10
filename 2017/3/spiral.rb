# nodoc
class Arroios
  def initialize
    @data = Array.new(600) { Array.new(600) }
  end

  def [](x)
    @data[x]
  end

  def []=(x, y, value)
    @data[x][y] = value
  end
end

# nodoc
class Spiral
  attr_accessor :i, :j

  DIR_MAP = [1, 2, 3, 0].freeze
  TURN_VEC = [[0, 1], [1, 0], [0, -1], [-1, 0]].freeze
  STEP_VEC = [[-1, 0], [0, 1], [1, 0], [0, -1]].freeze

  def initialize(max)
    @max = max
    @i = @j = 0
    @dir_cur = 0
    @matrix = Arroios.new # Hash.new { |h, k| h[k] = [] }
  end

  def turn
    @i += TURN_VEC[@dir_cur][0]
    @j += TURN_VEC[@dir_cur][1]
    @dir_cur = DIR_MAP[@dir_cur]
  end

  def step
    @i += STEP_VEC[@dir_cur][0]
    @j += STEP_VEC[@dir_cur][1]
  end

  def can_turn?
    @matrix[@i + TURN_VEC[@dir_cur][0]][@j + TURN_VEC[@dir_cur][1]].nil?
  end

  def walk
    (1..(@max - 1)).each do |n|
      @matrix[@i][@j] = n
      if can_turn?
        turn
      else
        step
      end
    end
  end
end

s = Spiral.new(265_149)
s.walk
puts s.i.abs + s.j.abs

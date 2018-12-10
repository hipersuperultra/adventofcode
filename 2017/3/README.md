# Advent of Code / 2017 / 3 - Spiral

## Important stuff

1. 2-dimensional array implementation:
```ruby
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
```

2. Making class members visible outside:
```ruby
attr_accessor :i, :j
```

3. Constants freezed:
```ruby
DIR_MAP = [1, 2, 3, 0].freeze
```

4. Using intervals on each:
```ruby
(1..(@max - 1))
```

5. Modulo (absolute) value of an integer:
```ruby
puts s.i.abs + s.j.abs
```

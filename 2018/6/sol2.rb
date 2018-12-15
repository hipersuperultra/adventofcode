coords = []
graph = []
items = ('AAA'..'ZZZ').to_a
max_x = nil
max_y = nil

class Node
  attr_accessor :distance, :label
  
  def initialize(label)
    @label = label
    @distance = 0
  end

  def add_distance(distance)
    @distance += distance
  end

  def to_s
    return label    
  end
end

File.foreach('input') { |line| coords << line.split(', ').map(&:to_i) }

coords.each_with_index do |c, i|
  (graph[c[0]] ||= [])[c[1]] = Node.new(items[i])
  max_x = c[0] if max_x.nil? || max_x < c[0]
  max_y = c[1] if max_y.nil? || max_y < c[1]
end

graph.each_with_index { |c, i| graph[i] = [] if c.nil? }

# graph.each { |c| puts c.inspect }

def distance(x, y, a, b)
  (x - a).abs + (y - b).abs
end

def chars_from_edges(graph)
  chars = []
  chars += (graph[-1][0..-1]).map { |c| c.label.downcase }
  chars += (graph[0][0..-1]).map { |c| c.label.downcase }
  chars += graph.map{ |line| line[-1].label.downcase }
  chars += graph.map{ |line| line[0].label.downcase }
  (chars - ['.', nil]).uniq!
  chars += chars.map { |c| c.upcase }
end

for i in 0..max_x
  for j in 0..max_y
    next unless graph[i][j].nil?
    
    min_distance = nil
    coord = nil
    distances = []

    coords.each do |c|
      distance = distance(i, j, c[0], c[1])
      distances << distance
      if(min_distance.nil? || distance < min_distance)
        coord = c
        min_distance = distance
      end
    end

    char = distances.count(min_distance) > 1 ? '.' : graph[coord[0]][coord[1]].label.downcase

    graph[i][j] = Node.new(char)
  end
end


# for i in 0..max_y
#   print "["
#   for j in 0..max_x
#     print "'#{graph[j][i]}',"
#   end
#   puts "]"
# end

# Lets find out the biggest area covered
char_counter = {}
edges = chars_from_edges(graph)

graph.each do |line| 
  line.each do |node|
    c = node.label
    c.downcase!
    unless edges.include? c
      char_counter[c] = char_counter[c].nil? ? 1 : char_counter[c] + 1
    end
  end
end

puts char_counter.sort_by { |_key, value| value }.inspect
















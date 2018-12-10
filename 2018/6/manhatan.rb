cordinates = []
graph = []
items = ('A'..'Z').to_a
max_x = -1

def circ_coords(x, y)
  [[x - 1, y + 1], [x - 1, y - 1], [x - 1, y], [x + 1, y + 1], [x + 1, y - 1], [x + 1, y], [x, y + 1], [x, y - 1]]
end

def fill_circ_coords(target, x, y, char, max_x)
  circ_coords(x, y).each do |c|
    next if c[0] > max_x
    target[c[0]][c[1]] = char.downcase if target[c[0]][c[1]].nil? && (c[0] >= 0 && c[1] >= 0)
  end
end

File.foreach('input') { |line| cordinates << line.split(', ').map(&:to_i) }

cordinates.each_with_index do |c, i|
  (graph[c[0]] ||= [])[c[1]] = items[i]
  max_x = c[0] if c[0] > max_x
end

graph.each_with_index { |c, i| graph[i] = [] if c.nil? }

cordinates.each do |c|
  fill_circ_coords(graph, c[0], c[1], graph[c[0]][c[1]], max_x)
end

# circ_coords(0, 0).each { |c| puts c.inspect }
graph.each { |c| puts c.inspect }

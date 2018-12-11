coords = []
graph = []
items = ('A'..'Z').to_a
max_x = nil
max_y = nil

File.foreach('input') { |line| coords << line.split(', ').map(&:to_i) }

coords.each_with_index do |c, i|
  (graph[c[0]] ||= [])[c[1]] = items[i]
  max_x = c[0] if max_x.nil? || max_x < c[0]
  max_y = c[1] if max_y.nil? || max_y < c[1]
end

graph.each_with_index { |c, i| graph[i] = [] if c.nil? }

def distance(x, y, a, b)
  (x - a).abs + (y - b).abs
end

for i in 0..max_x
  for j in 0..max_y
    if graph[i][j].nil?
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

      char = distances.count(min_distance) > 1 ? '.' : graph[coord[0]][coord[1]].downcase

      graph[i][j] = char
    end
  end
end

graph.each { |c| puts c.inspect }

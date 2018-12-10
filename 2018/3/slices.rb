graph = []

File.foreach('input') do |line|
  params = line.scan(/#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)/)[0]
  params = { id: params[0].to_i, edge: params[1].to_i, top: params[2].to_i, width: params[3].to_i, height: params[4].to_i }

  for i in 0..(params[:width] - 1)
    for j in 0..(params[:height] - 1)
      pos = (graph[params[:edge] + i] ||= [])[params[:top] + j]
      graph[params[:edge] + i][params[:top] + j] = pos.nil? ? 1 : pos + 1
    end
  end
end

count = 0

graph.each do |line|
  line.each do |val|
    count += 1 if val.to_i > 1
  end
end

puts count

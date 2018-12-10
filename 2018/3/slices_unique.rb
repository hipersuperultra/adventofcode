graph = []
slices = []

# nodoc
class Node
  attr_accessor :count, :item_ids

  def initialize
    @count = 0
    @item_ids = []
  end
end

File.foreach('input') do |line|
  params = line.scan(/#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)/)[0]
  params = { id: params[0].to_i, edge: params[1].to_i, top: params[2].to_i, width: params[3].to_i, height: params[4].to_i }
  slices << params

  for i in 0..(params[:width] - 1)
    for j in 0..(params[:height] - 1)
      pos = (graph[params[:edge] + i] ||= [])[params[:top] + j]
      pos ||= Node.new
      pos.item_ids << params[:id]
      pos.count += 1
      graph[params[:edge] + i][params[:top] + j] = pos
    end
  end
end

valid_id = -1

slices.each do |slice|
  valid = true
  valid_id = slice[:id]

  for i in 0..(slice[:width] - 1)
    for j in 0..(slice[:height] - 1)
      pos = graph[slice[:edge] + i][slice[:top] + j]
      if pos.item_ids.size > 1
        valid = false
        next
      end
    end
  end

  break if valid
end

puts valid_id
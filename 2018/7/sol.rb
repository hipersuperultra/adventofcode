require 'set'

class Node
  attr_accessor :label, :adjacents

  def initialize(label)
    @adjacents = Set.new
    @label = label
  end

  def to_s
    @label
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_edge(from, to)
    from.adjacents << to
  end
end

class Topsort
  attr_accessor :post_order

  def initialize(graph)
    @post_order = []
    @visited = []

    graph.nodes.each do |node|
      dfs(node) unless @visited.include? node
    end
  end

  private

  def dfs(node)
    @visited << node
    node.adjacents.each do |adj_node|
      dfs(adj_node) unless @visited.include? adj_node
    end

    @post_order << node
  end
end

nodes = {}
graph = Graph.new

File.foreach('input') do |line|
  origin, destination = line.scan(/Step ([A-Z]) must be finished before step ([A-Z]) can begin./)[0]
  graph.nodes << (nodes[origin] ||= Node.new(origin))
  graph.nodes << (nodes[destination] ||= Node.new(destination))

  graph.add_edge(nodes[origin], nodes[destination])
end

# puts graph

puts Topsort.new(graph).post_order.map(&:to_s).reverse.join

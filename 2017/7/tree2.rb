weights = {}
bros = {}
children = {}
parent = {}

def peso(no, children, weights)
    weights[no] + (children[no].to_a.map{ |p| weights[p] }.reduce(:+) || 0)
end

def n_parents(no, parent)
  p_counter = 0
  loop do
    break if parent[no].nil?
    no = parent[no]
    p_counter += 1
  end
  p_counter
end

File.foreach('input') do |line|
  line = line.strip
  program, list = line.split(' -> ')
  _, program, weight = (program.match(/([a-z]*) \(([0-9]*)\)/)).to_a
  list = list&.split(', ') || []

  children[program] = list 
  weights[program] = weight.to_i
  parent[program] = nil if parent[program].nil?
  list.each{ |l| parent[l] = program }
end

children.each do |parent, child|
  child.each do |c|
    bros[c] = child - [c]
  end
end

children.each do |p, c|
  c = c.map{|cc| weights[cc] }
end

fodidos = []

bros.each do |bb, b|
  peso = peso(bb, children, weights)
  pesob = b.map{ |bbb| peso(bbb, children, weights) }
  unless pesob.include? peso
    fodidos << bb
  end
end

# puts fodidos.inspect
puts fodidos.map{|no| n_parents(no, parent) }.sort.inspect


# bros.each { |b| puts b.inspect }
# children.each { |b| puts b.inspect }
# puts peso('padx', children, weights)

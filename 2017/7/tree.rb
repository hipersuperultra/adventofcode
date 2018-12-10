weights = []
programs = []
parent = {}

File.foreach('input') do |line|
  line = line.strip
  program, list = line.split(' -> ')
  _, program, weight = (program.match(/([a-z]*) \(([0-9]*)\)/)).to_a
  list = list&.split(', ') || []

  programs << program
  weights << weight
  parent[program] = nil if parent[program].nil?
  list.each do |l|
    parent[l] = program
  end
end

puts parent.select{ |v, i| i.nil? }.inspect

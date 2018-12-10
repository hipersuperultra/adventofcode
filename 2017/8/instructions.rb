registers = {}
regex = /([a-z]*) (dec|inc) (-?[0-9]*) if ([a-z]*) (!=|==|>|<|>=|<=) (-?[0-9]*)/
op_trans = { 'inc' => :+, 'dec' => :- }
max = -99999

File.foreach('input') do |line|
  _, target, operation, value, conditional, cond, cond_value = (line.match(regex)).to_a

  registers[target] = 0 if registers[target].nil?
  registers[conditional] = 0 if registers[conditional].nil?

  if registers[conditional].send(cond.to_sym, cond_value.to_i)
    value = registers[target].send(op_trans[operation], value.to_i)
    registers[target] = value
    max = value if value > max
  end
end

puts "Part I response: " + registers.max_by{ |k,v| v }[1].to_s
puts "Part II response: " + max.to_s

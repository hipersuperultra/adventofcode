offset = 0
jumps = 1

instructions = File.read('input').strip.split.map(&:to_i)

loop do
  jump = instructions[offset]
  break if (offset + jump) >= instructions.size
  instructions[offset] += (instructions[offset] >= 3 ? -1 : 1)
  offset += jump
  jumps += 1
end

puts jumps

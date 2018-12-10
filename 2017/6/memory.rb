memory = File.read('input').strip.split.map(&:to_i)
memory_configs = []

# puts memory.inspect

loop do
  memory_configs << memory.clone # saves snapshot of the current memory

  # find fullest memory
  temp    = 0
  pointer = 0
  for i in 0..(memory.size - 1)
    if memory[i] > temp
      temp = memory[i]
      pointer = i
    end
  end

  # start relocating
  memory[pointer] = 0
  loop do
    pointer = (pointer + 1) % memory.size
    temp -= 1
    memory[pointer] += 1
    break if temp.zero?
  end
  # puts memory_configs.inspect
  # puts memory.inspect

  break if memory_configs.include? memory
end

puts memory_configs.size # answer for part 1

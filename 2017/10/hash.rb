INPUT_FILE = 'input.txt'.freeze
LIST_SIZE = 255

lengths = File.read(INPUT_FILE).strip.split(',').map(&:to_i)
list = (0..LIST_SIZE).to_a

list_pos = 0
skip_size = 0

lengths.each do |length|
  puts "List pos: #{list_pos}"
  puts "Skip: #{skip_size}"
  puts "length: #{length}"

  rev_list = if list_pos + length > list.size
               list[list_pos..(list.size - 1)] + list[0..(((list_pos + length) % list.size)-1)]
             else
               list[list_pos..(list_pos + length - 1)]
             end

  puts "Rev list: #{rev_list.inspect}"
  rev_list.reverse!
  puts "Rev list: #{rev_list.inspect}"

  ins_pos = list_pos
  rev_list.each do |l|
    list[ins_pos % list.size] = l
    ins_pos += 1
  end
  puts "Status: #{list.inspect}"
  puts '--------------------------'

  list_pos = (list_pos + length + skip_size) % list.size
  skip_size += 1
end

puts list.inspect

puts "Answer 1: #{list[0] * list[1]}"

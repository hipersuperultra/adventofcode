number = File.read('entrada2.txt').strip
size = number.size
number = number << number

sum = 0
position = 0
over = size / 2

loop do
  sum += number[position].to_i if number[position] == number[position + over]
  position += 1
  break if position == size
end

puts sum

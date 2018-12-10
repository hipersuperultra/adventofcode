number = File.read('entrada1.txt')

sum = 0
position = 0
last = nil

loop do
  sum += last.to_i if last == number[position]
  last = number[position]
  position += 1
  break if position == number.size
end

puts sum

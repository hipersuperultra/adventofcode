min = max = nil
diffs = []

File.foreach('input.txt') do |line|
  numbers = line.split("\t").map(&:to_i)
  numbers.each do |n|
    min = n if min.nil? || n < min
    max = n if max.nil? || n > max
  end
  diffs << (max - min)
  min = max = nil
end

puts diffs.inject(0, :+)

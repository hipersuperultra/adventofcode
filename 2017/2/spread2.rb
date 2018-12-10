min = max = nil
divs = []

File.foreach('input.txt') do |line|
  numbers = line.split("\t").map(&:to_i)

  numbers.each do |i|
    numbers.each do |j|
      if i != j && (i % j).zero?
        max = i
        min = j
      end
    end
  end
  divs << (max / min)
  min = max = nil
end

puts divs.inject(0, :+)

valids = 0

File.foreach('input') do |line|
  words = line.strip.split(' ')
  valids += 1 if words.detect{ |e| words.count(e) > 1 }.nil?
end

puts valids

sequence = File.open('input') { |f| f.readline }

def valid_seq(a, b)
  return a&.downcase == b&.downcase && a != b
end

changed = true

while changed do
  changed = false
  for i in 0..(sequence.size - 2)
    if valid_seq(sequence[i], sequence[i + 1])
      2.times { sequence.slice!(i) }
      changed = true
    end
  end
end

puts sequence.size - 1

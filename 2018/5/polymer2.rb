sequence = File.open('input') { |f| f.readline }

def valid_seq(a, b)
  return a&.downcase == b&.downcase && a != b
end

def reduce_polymer(sequence)
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

  sequence
end

min_size = nil
units = sequence.downcase.split('').uniq

units.each do |u|
  subseq = sequence.gsub(u, '').gsub(u.upcase, '')
  reduced = reduce_polymer(subseq)
  min_size = reduced.size if min_size.nil? || min_size >  reduced.size
end

puts min_size - 1

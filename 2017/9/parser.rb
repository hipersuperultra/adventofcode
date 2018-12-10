program = File.read('input').strip

stack = []
anulate = false
in_garbage = false
value = 0
chars = 0

program.chars.each do |c|
  if in_garbage
    if anulate
      anulate = false
      next
    end
    if c == '>'
      in_garbage = false
      next
    elsif c == '!'
      anulate = true
      next
    else
      chars += 1
    end
  else
    if c == '{'
      stack << c
      next
    elsif c == '}'
      value += stack.size
      stack.slice!(-1)
      next
    elsif c == '<'
      in_garbage = true
      next
    end
  end
end

puts "Part I: #{value}"
puts "Part II: #{chars}"

programs = []

File.foreach('input') do |line|
  program = line.strip.split(' ')
  if programs.include? program[0]
    puts "Programa repetido"
    puts program[0]
    puts programs.inspect
    exit
  end
  programs << program[0]
end

puts "Nenhum programa é repetido"
puts programs.inspect

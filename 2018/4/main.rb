require_relative 'aoc_time'
require_relative 'aoc_event'
require_relative 'aoc_action'

STATUS_AWAKE = '.'.freeze
STATUS_ASLEEP = '#'.freeze

events = []

File.foreach('input') do |line|
  events << AocEvent.new(AocTime.new(line[0..18]), AocAction.new(line[19..-1]))
end

events.sort!

# events.each { |e| puts e }

def print_graph(graph, info)
  puts "DATE   ID\t\t MINUTE"
  print "         \t\t "
  (0..5).each { |i| 10.times { print i } }
  puts
  print "         \t\t "
  6.times { (0..9).each { |i| print i } }
  puts

  graph.each_with_index do |line, i|
    if info[i][0][2] == 971
      print "#{info[i][0][1].to_s.rjust(2, '0')}-#{info[i][0][0].to_s.rjust(2, '0')}  ##{info[i][0][2]}\t\t "
      line.each { |l| print l }
      puts
    end
  end
end

graph       = []
graph_test  = []
graph_line  = -1
guard_id    = -1
starts      = nil
last_status = nil

events.each do |e|
  if e.action.type == AocAction::TYPE_GUARD
    unless starts.nil?
      ((starts.minute)..59).each { |i| (graph[graph_line] ||= [])[i] = last_status }
    end
    guard_id    = e.action.robot_id
    starts      = e.time.hour != 0 ? e.time.next_day : e.time
    graph_line += 1
    last_status = STATUS_AWAKE
    (graph_test[graph_line] ||= []) << [starts.day, starts.month, e.action.robot_id]
  elsif e.action.type == AocAction::TYPE_FALLS
    (starts.minute..(e.time.minute)).each { |i| (graph[graph_line] ||= [])[i] = STATUS_AWAKE }
    starts = e.time
    last_status = STATUS_ASLEEP
  elsif e.action.type == AocAction::TYPE_WAKES
    (starts.minute..(e.time.minute)).each { |i| (graph[graph_line] ||= [])[i] = STATUS_ASLEEP }
    starts = e.time
    last_status = STATUS_AWAKE
  end
end

((starts.minute)..59).each { |i| (graph[graph_line] ||= [])[i] = last_status }

# considers delays as waked up
graph.each_with_index { |e, i| graph[i] = e.map { |ee| ee.nil? ? '.' : ee } }

print_graph(graph, graph_test)

guards_asleep = {}

# counting the one that sleeps the most
graph.each_with_index do |line, i|
  guards_asleep[graph_test[i][0][2]] = guards_asleep[graph_test[i][0][2]].nil? ? line.count('#') : guards_asleep[graph_test[i][0][2]] + line.count('#')
end

# puts guards_asleep.sort_by { |_key, value| value }.inspect
# 971 sleeps the most!

# finds where he sleeps the most

min_counter = []

graph.each_with_index do |line, i|
  if graph_test[i][0][2] == 971
    line.each_with_index do |c, j|
      # ok ok ... 
      count = (c == '#') ? 1 : 0
      min_counter[j] = min_counter[j].nil? ? count : min_counter[j] + count
    end
  end
end

min_counter.each_with_index { |a, b| puts "#{b}\t#{a}" }





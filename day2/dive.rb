# frozen_string_literal: true

# Part A
# Calculate the horizontal position and depth you would have after following the
# planned course. What do you get if you multiply your final horizontal position
# by your final depth?

course = File.readlines("input.txt", chomp: true).map(&:split)

depth = 0
horizontal = 0

course.each do |direction, value|
  value = value.to_i
  case direction
  when "forward"
    horizontal += value
  when "down"
    depth += value
  when "up"
    depth -= value
  end
end

puts "Part A"
puts "The horizontal position is: #{horizontal}."
puts "The depth is: #{depth}."
puts "Multipling #{horizontal} by #{depth} = #{horizontal * depth}."
puts

# Part B
# In addition to horizontal position and depth, you'll also need to track a
# third value, aim, which also starts at 0. The commands also mean something
# entirely different than you first thought:
# down x increases your aim by x units.
# up x decreases your aim by x units.
# forward x does two things:
#   it increases your horizontal position by x units.
#   it increases your depth by your aim multiplied by x.

depth = 0
horizontal = 0
aim = 0

course.each do |direction, value|
  value = value.to_i
  case direction
  when "forward"
    horizontal += value
    depth += aim * value
  when "down"
    aim += value
  when "up"
    aim -= value
  end
end

puts "Part B"
puts "The horizontal position is: #{horizontal}."
puts "The depth is: #{depth}."
puts "Multipling #{horizontal} by #{depth} = #{horizontal * depth}."
puts

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

puts "The horizontal position is: #{horizontal}."
puts "The depth is: #{depth}."
puts "Multipling #{horizontal} by #{depth} = #{horizontal * depth}."

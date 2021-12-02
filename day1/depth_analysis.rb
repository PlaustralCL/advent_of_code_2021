# frozen_string_literal: true

# Given a file of depth measurements, countthe number of times a depth
# measurement increases from the previous measurement.

depths = File.readlines("input.txt", chomp: true).map(&:to_i)

increasing_depths = (1..depths.length - 1).map { |index| depths[index] > depths[index - 1] }
puts "The number of measurements that are larger than the previous measurement: #{increasing_depths.count(true)}."

# frozen_string_literal: true

# PartA
# Given a file of depth measurements, countthe number of times a depth
# measurement increases from the previous measurement.

depths = File.readlines("input.txt", chomp: true).map(&:to_i)

def increasing_depths(depth_list)
  (1..depth_list.length - 1).map { |index| depth_list[index] > depth_list[index - 1] }
end

# increasing_depths = (1..depths.length - 1).map { |index| depths[index] > depths[index - 1] }
puts "Part A"
puts "The number of single measurements that are larger than the previous measurement: #{increasing_depths(depths).count(true)}."
puts

# Part B
# Consider sums of a three-measurement sliding window. How many sums are larger
# than the previous sum?
windows = depths.each_cons(3).to_a.map(&:sum)
puts "Part B"
puts "The number of three measurement windows that are larger than the previous window: #{increasing_depths(windows).count(true)}."

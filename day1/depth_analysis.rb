# frozen_string_literal: true

# PartA
# Given a file of depth measurements, countthe number of times a depth
# measurement increases from the previous measurement. Answer: 1400

depths = File.readlines("input.txt", chomp: true).map(&:to_i)

def increasing_depths(depth_list)
  (1..depth_list.length - 1).count { |index| depth_list[index] > depth_list[index - 1] }
end

puts "Part A"
puts "The number of single measurements that are larger than the previous measurement: #{increasing_depths(depths)}."
puts

# Part B
# Consider sums of a three-measurement sliding window. How many sums are larger
# than the previous sum? Answer: 1429
windows = depths.each_cons(3).to_a.map(&:sum)
puts "Part B"
puts "The number of three measurement windows that are larger than the previous window: #{increasing_depths(windows)}."

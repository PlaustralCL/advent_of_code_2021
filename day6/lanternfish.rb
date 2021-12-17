# frozen_string_literal: true

test_data = [3, 4, 3, 1, 2]
initial_population = File.readlines("input.txt", chomp: true).first.split(",").map(&:to_i)

population = Array.new(initial_population)
new_fish = []

# Part A. This uses a brute force apprach to calculate the popuation after 80 days.
def population_growth(generation, new_fish)
  generation.map do |timer|
    if timer.zero?
      new_fish << 8
      6
    else
      timer - 1
    end
  end
end

80.times do
  new_fish = []
  population = population_growth(population, new_fish)
  population << new_fish unless new_fish.empty?
  population.flatten!
end

puts "The population after 80 days is: #{population.length}"
puts

# Part B. The brute force approach kills the computer after about 149 days. This
# solution based on https://www.reddit.com/r/adventofcode/comments/r9z49j/comment/hnffzni/?utm_source=share&utm_medium=web2x&context=3

population = Array.new(initial_population).tally
population.default = 0
256.times do
  population.transform_keys! { |age| age - 1 }
  population[8] += population[-1]
  population[6] += population[-1]
  population.delete(-1)
end

puts "The population after 256 days is: #{population.values.sum}"

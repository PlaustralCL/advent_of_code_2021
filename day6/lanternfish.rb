# frozen_string_literal: true

test_data = [3, 4, 3, 1, 2]
initial_population = File.readlines("input.txt", chomp: true).first.split(",").map(&:to_i)

population = Array.new(initial_population)
new_fish = []

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

puts "The population after 80 generations is: #{population.length}"

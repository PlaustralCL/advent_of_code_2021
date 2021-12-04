# frozen_string_literal: true

def frequency_sort(data)
  data.each_with_object(Hash.new(0)) do |digit, hash|
    hash[digit] += 1
  end
end

def transpose_diagnostic_data(diagnostic)
  diagnostic.transpose.map do |column|
    frequency_sort(column)
  end
end

def gamma(frequency_data)
  frequency_data.map do |hash|
    hash.key(hash.values.max)
  end
end

def epsilion(frequency_data)
  frequency_data.map do |hash|
    hash.key(hash.values.min)
  end
end

diagnostic_report = File.readlines("test_data.txt", chomp: true).map(&:chars)
frequencies = transpose_diagnostic_data(diagnostic_report)
gamma_rate = gamma(frequencies).join.to_i(2)
epsilion_rate = epsilion(frequencies).join.to_i(2)
puts "The gamma rate is: #{gamma_rate}."
puts "The epsilion rate is: #{epsilion_rate}."
puts "The power consumption is: #{gamma_rate * epsilion_rate}."

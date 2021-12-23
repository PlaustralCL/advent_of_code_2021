# frozen_string_literal: true

require "pry"

# input:
# Player 1 starting position: 4
# Player 2 starting position: 3

# test_data
# player1_position = 4
# player2_position = 8

# Tracks player information
class Player
  attr_reader :name, :position, :score

  def initialize(name, position)
    @name = name
    @position = position
    @score = 0
  end

  def update_score
    @score += position
  end

  def update_position(move)
    @position = if ((position + move) % 10).zero?
                  10
                else
                  (position + move) % 10
                end
  end
end

# Tracks the dice position
class Dice
  attr_reader :side, :number_of_rolls

  def initialize(side = 0)
    @side = side
    @number_of_rolls = 0
  end

  def roll_die
    @number_of_rolls += 1
    @side = 0 if side + 1 > 100
    @side += 1
  end
end

player1 = Player.new("Player 1", 4)
player2 = Player.new("Player 2", 8)
die = Dice.new

current_player = player1

loop do
  # moves = 0
  # 3.times do
  #   moves += die.roll_die
  # end
  roll1 = die.roll_die
  roll2 = die.roll_die
  roll3 = die.roll_die
  moves = roll1 + roll2 + roll3


  current_player.update_position(moves)
  current_player.update_score
  # puts "Dice roles #{roll1}, #{roll2}, #{roll3}"
  # puts "#{current_player.name} rolled a total of #{moves} and moves to space #{current_player.position} for a total score of #{current_player.score}."
  break if current_player.score >= 1000

  current_player = current_player == player1 ? player2 : player1
end

puts "#{player1.name} score is #{player1.score}"
puts "#{player2.name} score is #{player2.score}"
puts "The die was rolled #{die.number_of_rolls} times"





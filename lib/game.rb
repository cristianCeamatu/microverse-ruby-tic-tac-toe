require './lib/utils'

class Game
  include Utils

  def initialize
    @winning_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
  end

  def winner?(indexes_of_sign)
    @winning_combinations.any? do |combination|
      return true if combination.all? { |element| indexes_of_sign.include?(element) }
    end
    false
  end
end

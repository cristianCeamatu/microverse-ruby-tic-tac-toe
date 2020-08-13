require './lib/utils'

class Board
  include Utils

  attr_accessor :display_board

  def initialize(display_board = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @display_board = display_board
  end

  def display
    result = ''
    display_board.each_with_index do |element, index|
      result += " #{element} " if [2, 5, 8].include?(index)
      result += "\n-----------\n" if [2, 5].include?(index)
      result += " #{element} |" unless [2, 5, 8].include?(index)
    end
    result
  end

  def update_board(position, sign)
    display_board[position] = sign
  end
end

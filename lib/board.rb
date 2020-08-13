require "./lib/utils"

class Board
  include Utils
  attr_accessor :display_board

  def initialize(display_board = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @display_board = display_board
  end

  def display
    display_board.each_with_index do |element, index|
      puts " #{element} " if [2, 5, 8].include?(index)
      puts "-----------" if [2, 5].include?(index)
      print " #{element} |" unless [2, 5, 8].include?(index)
    end
  end

  def update_board(position, sign)
    display_board[position] = sign
  end
end

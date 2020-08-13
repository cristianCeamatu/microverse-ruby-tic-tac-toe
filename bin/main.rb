#!/usr/bin/env ruby

require './lib/player'
require './lib/game'

puts 'Welcome to our Tic-Tac-Toe game!'

sleep 1

puts 'Developed by Cristian Ceamatu and Amita Roy'

sleep 1

valid_name1 = false
while valid_name1 == false

  puts "Player 1: What's your name?"
  player1_name = gets.chomp

  puts Game.validate_name(player1_name) if Game.validate_name(player1_name).size > 16
  valid_name1 = true if Game.validate_name(player1_name).size <= 16
end

valid_name2 = false
while valid_name2 == false

  puts "Player 2: What's your name?"
  player2_name = gets.chomp

  puts Game.validate_name(player2_name) if Game.validate_name(player2_name).size > 16
  valid_name2 = true if Game.validate_name(player2_name).size <= 16
end

sleep 1
puts
puts "Today's players will be #{player1_name} and #{player2_name}"
puts
sleep 1

puts 'We will randomly select the first one to move in...'
[3, 2, 1].each do |element|
  puts element
  sleep 1
end

puts
first_player = rand(1..2) == 1 ? player1_name : player2_name
second_player = first_player == player1_name ? player2_name : player1_name
player1 = Player.new(first_player, 'X')
player2 = Player.new(second_player, 'O')

# Create the Game and Board objects

puts "#{first_player} you will start first with character X and #{second_player} will go second with character O"

sleep 2

# Create an object from the board class which will have the current board state array
display_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Winning combinations array will be in the Game object

# winning_combinations = [
#   [1, 2, 3],
#   [4, 5, 6],
#   [7, 8, 9],
#   [1, 4, 7],
#   [2, 5, 8],
#   [3, 6, 9],
#   [1, 5, 9],
#   [3, 5, 7],
# ]

# Set the current player and initialize a winner variable that we make it true if a player is winning after his turn
current_player = first_player
# winner = nil

# round = 0
# Start while loop to keep getting inputs until any of the player wins or all the blocks are taken
puts
display_board.each_with_index do |element, index|
  puts " #{element} " if [2, 5, 8].include?(index)
  puts '-----------' if [2, 5].include?(index)
  print " #{element} |" unless [2, 5, 8].include?(index)
end

sleep 1

puts
puts "#{current_player}, please select the position for your move"
selection = gets.chomp.to_i # Validation for valid selection (num should 1 to 9 and not taken by other player)
display_board[selection - 1] = 'X'

# replace the number in the array with the selection of the current_player(current_player.sign)

# check if this player is winner after the selection using the winning_combinations array
# if we have a winner we break the loop
# If we have a winner we set a variable winner
winner = current_player

# swap the player after each iteration of the loop
# current_player = current_player == first_player ? second_player : first_player

# increment the round count (round += 1)
# break the loop if the round > 8

# After the loop breaks

if winner.nil?
  # add the posibility to restart the game
  puts 'The result is a tie! Do you want to play again?'
  # answer = gets.chomp
  # If the answer is Yes or Y we run the game again (Game.start)

else
  puts
  display_board.each_with_index do |element, index|
    puts " #{element} " if [2, 5, 8].include?(index)
    puts '-----------' if [2, 5].include?(index)
    print " #{element} |" unless [2, 5, 8].include?(index)
  end
  puts
  puts "And the winner is #{winner}!"
end

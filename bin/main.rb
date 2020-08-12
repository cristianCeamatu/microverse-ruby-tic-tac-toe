#!/usr/bin/env ruby

# Creat the Game, Board and Player classes
# Create the Game and Board objects

puts "Welcome to our Tic-Tac-toe game!"

sleep 1

# Create the Player objects based on their name
puts "Player 1: What's your name?"
player1 = gets.chomp # Validate the input and capitalize the first letter
# Create a new player object with the received name

puts "Player 2: What's your name?"
player2 = gets.chomp # Validate the input and capitalize the first letter
# Create a new player object with the received name

sleep 1

puts "Today's players will be #{player1} and #{player2}"

sleep 1

puts 'We will randomly select the first one to move in...'

# We will add the counter before announcing the first player
[3, 2, 1].each do |element|
  puts element
  sleep 1
end

# A random function will assign the character to both players. Like X for player1 and O for player2.
first_player = rand(1..2) == 1 ? player1 : player2
second_player = first_player == player1 ? player2 : player1
# After we decide the first player we give the X selection to the Player object

puts "#{first_player} you will start first with character X and #{second_player} will go second with character O"

sleep 2

# Create an object from the board class which will have the current board state array
display_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Winning combinations array will be in the Game object
winning_combinations = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7]
]

# Set the current player and initialize a winner variable that we make it true if a player is winning after his turn
current_player = first_player
winner = nil

round = 0
# Start while loop to keep getting inputs until any of the player wins or all the blocks are taken
puts
display_board.each_with_index do |element, index|
  puts " #{element} " if index == 2 || index == 5 || index == 8
  puts "-----------" if index == 2 || index == 5
  print " #{element} |" if index != 2 && index != 5 && index != 8
end

sleep 1

puts
puts "#{current_player}, please select the position for your move"
selection = gets.chomp  # Validation for valid selection (num should 1 to 9 and not taken by other player)
display_board[selection] = 'X'

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
  answer = gets.chomp
  # If the answer is Yes or Y we run the game again (Game.start)

else
  display_board.each_with_index do |element, index|
    puts " #{element} " if index == 2 || index == 5 || index == 8
    puts "-----------" if index == 2 || index == 5
    print " #{element} |" if index != 2 && index != 5 && index != 8
  end

  puts "And the winner is #{winner}!"
end

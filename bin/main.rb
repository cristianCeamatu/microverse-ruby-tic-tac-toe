#!/usr/bin/env ruby

puts "Welcome to our Tic-Tac-toe game!"

puts "Player 1: What's your name?"

player1 = gets.chomp # validate the input

puts "Player 2: What's your name?"

player2 = gets.chomp # validate the input

puts "Today's players will be #{player1} and #{player2}"
sleep 2

# A random function will assign the character to both players. Like X for player1 and O for player2.

puts "and the first player is..."

# we will add the counter before announcing the players name

puts "#{player1} you will start first with character X and #{player2} will go second with character O"
sleep 1

# Winning combinations array
# start while loop to keep getting inputs untill any of the player wins or all the blocks are taken

puts "1, 2, 3" # here we will display our game board
puts "4, 5, 6"
puts "7, 8, 9"

sleep 1

puts "#{player1}, Please select the position for your move"
player1_selection = gets.chomp  # validation for valid selection (num should 1 to 9 and not taken by other player)

# check if this player is winner after the selction

# display the board after player select their move with their inputs

# There will be an array of numbers from which each player will select the number.
# If one player has selected a number that number will no more available for another player.

puts "#{player2}, Please select the position for your move"
player2_selection = gets.chomp # validation for valid selection (num should 1 to 9 and not taken by other player)

# check if this player is winner after the selction

# display the board after player select their move with their inputs

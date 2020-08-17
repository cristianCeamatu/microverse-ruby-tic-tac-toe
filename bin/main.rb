#!/usr/bin/env ruby

require_relative '../lib/colors.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

game = Game.new

puts 'Welcome to our:'
print 'TIC '.red
sleep 1
print 'TAC '.red
sleep 1
print 'TOE '.red
sleep 1
print 'Game! '.red

sleep 1

puts 'Developed by Cristian Ceamatu and Amita Roy'.green

sleep 1

valid_name1 = false
while valid_name1 == false
  puts "Player 1: What's your name?".blue
  player1_name = gets.chomp

  puts game.validate_name(player1_name).yellow if game.validate_name(player1_name).size > 16
  valid_name1 = true if game.validate_name(player1_name).size <= 16
end

valid_name2 = false
while valid_name2 == false
  puts "Player 2: What's your name?".blue
  player2_name = gets.chomp

  puts game.validate_name(player2_name).yellow if game.validate_name(player2_name).size > 16
  valid_name2 = true if game.validate_name(player2_name).size <= 16
end

sleep 1
puts
puts "Today's players will be #{player1_name.capitalize} and #{player2_name.capitalize}".red
puts
sleep 1

restart = true
loop do # rubocop:disable Metrics/BlockLength
  puts 'We will randomly select the first player to move in...'
  [3, 2, 1].each do |element|
    puts element.to_s.green
    sleep 1
  end

  puts
  first_player = rand(1..2) == 1 ? player1_name : player2_name
  second_player = first_player == player1_name ? player2_name : player1_name
  player1 = Player.new(first_player.capitalize, 'X'.red)
  player2 = Player.new(second_player.capitalize, 'O'.yellow)

  puts "#{player1.name} you will start first with character 'X' and #{player2.name} will go second with character 'O'"
  puts
  sleep 1

  game_board = Board.new

  sleep 1

  current_player = player1
  winner = nil
  round = 1
  loop do
    puts game_board.display
    puts
    puts "#{current_player.name}, please select the position for your move".blue

    # Loop until we get a correct selection and update the board
    loop do
      selection = gets.chomp.to_i
      if game_board.validate_selection(selection - 1, game_board.display_board).is_a?(Numeric)
        game_board.update_board(selection - 1, current_player.sign)
        break
      else
        puts game_board.validate_selection(selection - 1, game_board.display_board).yellow
      end
    end

    winner = current_player if game.winner?(game.indexes_of_sign(current_player.sign, game_board.display_board))

    round += 1
    break if round > 9 || winner

    current_player = current_player == player1 ? player2 : player1
  end

  puts
  puts game_board.display
  puts
  sleep 1
  if winner.nil?
    puts 'The result is a tie!'.red
  else
    puts 'And the winner is ' << winner.name.red << ' after ' << (round - 1).to_s.red << ' rounds!'
  end
  sleep 1
  puts
  puts 'Do you want to play again? (y or yes)'
  restart = gets.chomp.strip
  break unless %w[y yes].include?(restart)
end

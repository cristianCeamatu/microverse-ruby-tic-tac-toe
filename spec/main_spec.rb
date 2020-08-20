require_relative '../lib/colors.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

describe 'Main game logic' do
  let(:game) { Game.new }
  let(:game_board) { Board.new }
  let(:player1) { Player.new('Cris', 'X') }
  let(:player2) { Player.new('Ami', 'O') }
  let(:player_sign_indexes) { [0, 4, 3] }
  let(:player_winner_sign_indexes) { [0, 1, 2] }

  it 'expects `game` object to be an instance of Game' do
    expect(game).to be_a Game
  end

  it 'expects `game_board` object to be an instance of Board' do
    expect(game_board).to be_a Board
  end

  it 'expects `player1` object to be an instance of Player' do
    expect(player1).to be_a Player
  end

  it 'expects `player2` object to be an instance of Player' do
    expect(player2).to be_a Player
  end

  context '`game` object checks if a player is a winner and' do
    it 'returns true when there is a winner' do
      expect(game.winner?(player_winner_sign_indexes)).to eql(true)
    end

    it 'returns false when there is a winner' do
      expect(game.winner?(player_sign_indexes)).to eql(false)
    end
  end
end

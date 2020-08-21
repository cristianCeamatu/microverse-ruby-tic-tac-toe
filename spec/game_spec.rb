require_relative '../lib/game'

describe Game do
  let(:game) { Game.new }

  describe '#winner?' do
    it 'returns true if the array of indexes received includes one element of the winning_combinations array' do
      expect(game.winner?([0, 3, 8, 6])).to eql(true)
    end

    it 'returns false if the array of indexes received doesn`t include one element of the winning_combinations array' do
      expect(game.winner?([0, 3, 8, 7, 9])).to eql(false)
    end
  end
end

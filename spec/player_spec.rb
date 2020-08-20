require_relative '../lib/player'

describe Player do
  let(:player) { Player.new('Cris', 'X') }

  describe '#name' do
    it 'returns the name of the players' do
      expect(player.name).to eql('Cris')
    end
  end

  describe '#sign' do
    it 'returns the sign of the players' do
      expect(player.sign).to eql('X')
    end
  end
end

require_relative '../lib/board.rb'

describe Board do
  let(:board) { Board.new([1, 2, 3, 4, 'X', 'O', 7, 'X', 'O']) }

  describe '#display_board' do
    it 'return the current board array' do
      expect(board.display_board).to eql([1, 2, 3, 4, 'X', 'O', 7, 'X', 'O'])
    end
  end

  describe '#display' do
    it 'return a string based on the current board' do
      expect(board.display.class).to eql(String)
    end
  end

  describe '#update_board' do
    it 'updates the board array with the sign(second parameter) on the received position(first parameter)' do
      board.update_board(0, 'X')
      expect(board.display_board[0]).to eql('X')
    end

    it 'returns the sign that was updated' do
      expect(board.update_board(0, 'X')).to eql('X')
    end
  end
end

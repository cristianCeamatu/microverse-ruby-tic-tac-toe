require_relative '../lib/utils'

describe Utils do
  include Utils

  let(:board) { [1, 2, 3, 4, 'X', 'O', 7, 'X', 'O'] }

  describe '#validate_name' do
    it 'return the parameter when no errors' do
      expect(validate_name('Cris')).to eql('Cris')
    end

    context 'returns an error message when:' do
      it 'parameter type of the input is not a string' do
        expect(validate_name(333)).to eql('Only String type accepted for the input')
      end

      it 'all chars are not all alphabet letters' do
        expect(validate_name('23axy')).to eql('Only alphabet letters accepted (no numbers or special characters)')
      end

      it 'length of the string is not between 3-16 letters' do
        expect(validate_name('ax')).to eql('The length of the input should be between 3-16 letters')
      end
    end
  end

  describe '#validate_selection' do
    it 'raises an ArgumentError if the selection is not a Numeric type' do
      expect { validate_selection('X', board) }.to raise_error(ArgumentError)
    end

    it 'returns the selection when is a valid one' do
      expect(validate_selection(1, board)).to eql(1)
    end

    context 'return an error message when:' do
      it 'the selection is not a number between 1-9' do
        expect(validate_selection(22, board)).to eql('Use numbers between 1 to 9')
      end

      it 'the position is already occupied by a sign' do
        expect(validate_selection(4, board)).to eql('The position has already been taken, please select another number')
      end
    end
  end

  describe '#indexes_of_sign' do
    context 'return an array with all indexes of the sign in the board array' do
      it 'when `X`' do
        expect(indexes_of_sign('X', board)).to eql([4, 7])
      end

      it 'when `O`' do
        expect(indexes_of_sign('O', board)).to eql([5, 8])
      end
    end
  end
end

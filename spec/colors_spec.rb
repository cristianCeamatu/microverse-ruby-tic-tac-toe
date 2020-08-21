require_relative '../lib/colors'

describe String do
  describe '#colorize' do
    context 'returns a string containing:' do
      it 'the color code parameter' do
        expect('xx'.colorize(99)).to include('99')
      end

      it 'the string it was called on' do
        expect('xx'.colorize(99)).to include('xx')
      end
    end
  end
end

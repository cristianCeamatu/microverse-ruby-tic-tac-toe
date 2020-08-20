module Utils
  def validate_name(input)
    return 'Only String type accepted for the input' unless input.is_a?(String)
    return 'Only alphabet letters accepted (no numbers or special characters)' unless input.match(/^[A-Z]+$/i)
    return 'The length of the input should be between 3-16 letters' unless input.strip.length.between?(3, 16)

    input.strip
  end

  def validate_selection(selection, board)
    return 'Use numbers between 1 to 9' unless selection.between?(0, 8)
    return 'The position has already been taken, please select another number' if board[selection].is_a?(String)

    selection
  end

  def indexes_of_sign(sign, board)
    board.size.times.select { |index| board[index] == sign }
  end
end

module Utils
  def validate_name(input)
    return "Only String type accepted for the input" unless input.is_a?(String)
    return "Only alphabet letters accepted (no numbers or special characters)" unless input.match(/([a-zA-Z]+)/)
    return "The length of the input should be between 3-16 letters" unless input.strip.length.between?(3, 16)

    input.strip
  end

  def validate_selection(selection, board = nil)
    return "Use numbers between 1 to 9" unless selection.between?(1, 9)
    return "The position has already been taken, please select another number" if board[selection].is_a?(String)
    selection
  end
end

include Utils

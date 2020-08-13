module Utils

  def validate_name(input)
    return 'Only String type accepted for the input' unless input.is_a?(String)
    return 'Only alphabet letters accepted (no numbers or special characters)' unless input.match(/([a-zA-Z]+)/)
    return 'The length of the input should be between 3-16 letters' unless input.strip.length.between?(3, 16)
  
    input.strip
  end

  # def validate_selection
  # end
end

include Utils

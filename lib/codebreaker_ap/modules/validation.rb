module CodebreakerAp
  module Validation
    def check_length(value, length)
      raise WrongLengthError unless length.include? value.length
    end

    def check_chars_range(value, range)
      raise WrongNumbersError unless value.chars.all? { |number| range.include? number.to_i }
    end

    def check_difficulty(difficulty_name, all_difficulty_names)
      raise WrongDifficultyError unless all_difficulty_names.include?(difficulty_name)
    end
  end
end

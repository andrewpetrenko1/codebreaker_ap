module CodebreakerAp
  class Validator
    include Validation

    attr_reader :errors

    def initialize
      @errors = []
    end

    def validate_difficulty(level, difficulty_keys)
      check_difficulty(level.to_sym, difficulty_keys)
    rescue WrongDifficultyError => e
      @errors.push(e)
    end

    def validate_length(name, name_length)
      check_length(name, name_length)
    rescue WrongLengthError => e
      @errors.push(e)
    end

    def validate_player_answer(answer, answer_length, answer_chars_range)
      validate_length(answer, answer_length)
      check_chars_range(answer, answer_chars_range)
    rescue WrongNumbersError => e
      @errors.push(e)
    end
  end
end

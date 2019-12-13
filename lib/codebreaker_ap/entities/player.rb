module CodebreakerAp
  class Player < BaseEntity
    attr_reader :name
    attr_accessor :answer, :validated

    ANSWER_CHARS_RANGE = (1..6).freeze
    ANSWER_LENGTH = (4..4).freeze
    NAME_LENGTH = (3..20).freeze
    def initialize
      @name = nil
      @answer = nil
      super()
    end

    def setup_name(player_name)
      @name = player_name
      valid_instance?
    end

    def setup_answer(answer)
      @answer = answer
      valid_instance?
    end

    private

    def valid_instance?
      valid?
      return if validated

      puts errors
    end

    def validate
      @errors << validate_name if name
      @errors << validate_answer if answer
    rescue WrongLengthError => e
      @errors.push(e)
    rescue WrongNumbersError => e
      @errors.push(e)
    end

    def validate_name
      check_length(@name, NAME_LENGTH)
    end

    def validate_answer
      check_length(@answer, ANSWER_LENGTH)
      check_chars_range(@answer, ANSWER_CHARS_RANGE)
    end
  end
end

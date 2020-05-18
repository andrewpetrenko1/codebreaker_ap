module CodebreakerAp
  class Player
    attr_reader :name
    attr_accessor :answer, :validated

    ANSWER_CHARS_RANGE = (1..6).freeze
    ANSWER_LENGTH = (4..4).freeze
    NAME_LENGTH = (3..20).freeze
    def initialize
      @name = nil
      @answer = nil
    end

    def setup_name(player_name)
      check = Validator.new
      check.validate_length(player_name, NAME_LENGTH)
      return check.errors unless check.errors.empty?

      @name = player_name.capitalize
    end

    def setup_answer(answer)
      check = Validator.new
      check.validate_player_answer(answer, ANSWER_LENGTH, ANSWER_CHARS_RANGE)
      return check.errors unless check.errors.empty?

      @answer = answer
    end
  end
end

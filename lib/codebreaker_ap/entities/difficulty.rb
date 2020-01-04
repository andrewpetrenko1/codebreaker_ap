module CodebreakerAp
  class Difficulty < BaseEntity
    DIFFICULTY = {
      easy: {
        hints: 2,
        attempts: 15
      },
      medium: {
        hints: 1,
        attempts: 10
      },
      hell: {
        hints: 1,
        attempts: 5
      }
    }.freeze

    attr_reader :level, :hints
    attr_accessor :attempts

    def initialize
      @level = nil
      @hints = nil
      @attempts = nil
      super()
    end

    def initialize_difficulty(level)
      @level = level
      valid?
      setup_difficulty if validated
    end

    def hint(hints_code)
      return Message.new.no_hint if @hints.zero?

      @hints -= 1
      hints_code.pop
    end

    private

    def setup_difficulty
      difficulty_options = DIFFICULTY[@level.to_sym]
      @hints = difficulty_options[:hints]
      @attempts = difficulty_options[:attempts]
    end

    def validate
      check_difficulty(@level.to_sym, DIFFICULTY.keys)
    rescue WrongDifficultyError => e
      @errors.push(e)
    end
  end
end

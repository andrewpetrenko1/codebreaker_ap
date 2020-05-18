module CodebreakerAp
  class WrongLengthError < StandardError
    def initialize
      super(Message.new.wrong_length)
    end
  end
  class WrongDifficultyError < StandardError
    def initialize
      super(Message.new.wrong_difficulty)
    end
  end
  class WrongNumbersError < StandardError
    def initialize
      super(Message.new.wrong_chars)
    end
  end
end

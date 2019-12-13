module CodebreakerAp
  class WrongLengthError < StandardError
    def initialize
      super(I18n.t(:wrong_length))
    end
  end
  class WrongDifficultyError < StandardError
    def initialize
      super(I18n.t(:wrong_difficulty))
    end
  end
  class WrongNumbersError < StandardError
    def initialize
      super(I18n.t(:wrong_chars))
    end
  end
end

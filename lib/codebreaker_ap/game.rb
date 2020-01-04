module CodebreakerAp
  class Game
    include Storage
    include Statistic

    LOCALES_FOLDER = File.expand_path('storage_files', __dir__)
    CODE_LENGTH = 4
    CODE_LENGTH_RANGE = (1..4).freeze
    SECRET_CODE_NUMBERS_RANGE = (1..6).freeze
    IN_POSITION = '+'.freeze
    NOT_IN_POSITION = '-'.freeze

    attr_reader :secret_code, :difficulty

    def initialize
      @difficulty = CodebreakerAp::Difficulty.new
      @secret_code = generate_secret_code
      @hints_code = secret_code.to_a.dup.shuffle
      @game_win = false
    end

    def check_answer(answer)
      answer = answer.to_s

      @game_win = true if @secret_code.join == answer
      @difficulty.attempts -= 1

      compare_answer_with_secret(answer.split(''), secret_code.join.split(''))
    end

    def win?
      @game_win
    end

    def take_hint
      difficulty.hint(@hints_code)
    end

    def show_rules
      rules = read_from_file("#{LOCALES_FOLDER}/#{Message.new.file_rules}")
      return unless rules

      rules
    end

    private

    def compare_answer_with_secret(answer_array, secret_code_array)
      (position_matches(answer_array, secret_code_array) + other_matches(answer_array, secret_code_array)).join('')
    end

    def position_matches(answer_array, secret_code_array)
      matches = []
      answer_array.each_with_index do |value, index|
        next if value != secret_code_array[index]

        secret_code_array[index] = nil
        answer_array[index] = nil
        matches.push(IN_POSITION)
      end
      matches
    end

    def other_matches(answer_array, secret_code_array)
      matches = []
      answer_array.each do |value|
        next if value.nil?

        if secret_code_array.include? value
          secret_code_array[secret_code_array.find_index(value)] = nil
          matches.push(NOT_IN_POSITION)
        end
      end
      matches
    end

    def generate_secret_code
      CODE_LENGTH_RANGE.map { rand(SECRET_CODE_NUMBERS_RANGE) }
    end
  end
end

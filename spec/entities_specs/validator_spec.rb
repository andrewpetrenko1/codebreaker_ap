RSpec.describe CodebreakerAp::Validator do
  subject(:validator) { described_class.new }

  context 'validation errors' do
    it 'WrongDifficultyError' do
      validator.validate_difficulty('wrong difficulty', CodebreakerAp::Difficulty::DIFFICULTY.keys)
      expect(validator.errors).to include(CodebreakerAp::WrongDifficultyError)
    end
    it 'WrongLengthError' do
      validator.validate_length('a', CodebreakerAp::Player::NAME_LENGTH)
      expect(validator.errors).to include(CodebreakerAp::WrongLengthError )
    end
    it 'WrongNumbersError' do
      validator.validate_player_answer('1289', CodebreakerAp::Player::ANSWER_LENGTH, CodebreakerAp::Player::ANSWER_CHARS_RANGE)
      expect(validator.errors).to include(CodebreakerAp::WrongNumbersError)
    end
    it 'WrongNumbersError and WrongLengthError' do
      validator.validate_player_answer('129', CodebreakerAp::Player::ANSWER_LENGTH, CodebreakerAp::Player::ANSWER_CHARS_RANGE)
      expect(validator.errors).to include(CodebreakerAp::WrongNumbersError)
    end
  end
end

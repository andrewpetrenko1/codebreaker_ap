RSpec.describe CodebreakerAp::Difficulty do
  subject(:difficulty) { described_class.new }

  context 'difficulty error' do
    it 'WrongDifficultyError' do
      difficulty.initialize_difficulty('wrong difficulty')
      expect(difficulty.errors).to include(CodebreakerAp::WrongDifficultyError)
    end
  end
  context 'difficulty apply' do
    it 'easy level' do
      difficulty.initialize_difficulty('easy')
      expect(difficulty.hints).to eq(2)
      expect(difficulty.attempts).to eq(15)
    end
    it 'medium level' do
      difficulty.initialize_difficulty('medium')
      expect(difficulty.hints).to eq(1)
      expect(difficulty.attempts).to eq(10)
    end
    it 'hell level' do
      difficulty.initialize_difficulty('hell')
      expect(difficulty.hints).to eq(1)
      expect(difficulty.attempts).to eq(5)
    end
  end

  context 'hints operation' do
    before(:each) { difficulty.initialize_difficulty('easy') }
    it 'takes a hint' do
      difficulty.hint([1, 2, 3, 4])
      expect(difficulty.hints).to eq 1
    end
    it 'pops last array element' do
      expect(difficulty.hint([1, 2, 3, 4])).to eq(4)
    end
  end
end

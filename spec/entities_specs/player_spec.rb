RSpec.describe CodebreakerAp::Player do
  subject(:player) { described_class.new }
  context 'player setup' do
    it 'name' do
      player.setup_name('andrew')
      expect(player.name).to eq('Andrew')
    end
    it 'answer' do
      player.setup_answer('1234')
      expect(player.answer).to eq('1234')
    end
  end
end

I18n.load_path << Dir[File.expand_path('lib/codebreaker_ap/storage_files/error_locales') + '/*.yml']
I18n.default_locale = :en
RSpec.describe CodebreakerAp::Player do
  subject(:player) { described_class.new }
  context 'player validation errors' do
    it 'WrongLengthError' do
      player.setup_name('S')
      expect(player.errors).to include(CodebreakerAp::WrongLengthError)
    end
    it 'WrongNumbersError' do
      player.setup_answer('1239')
      expect(player.errors).to include(CodebreakerAp::WrongNumbersError)
    end
  end
end

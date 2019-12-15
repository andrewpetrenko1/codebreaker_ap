RSpec.describe CodebreakerAp::Game do
  subject(:game) { described_class.new }
  before(:each) do
    game.difficulty.initialize_difficulty('easy')
  end
  describe 'algorithm tests' do
    context 'Check test data' do
      let(:test_data) do
        [
          [[6, 5, 4, 3], '5643', '++--'],
          [[6, 5, 4, 3], '6411', '+-'],
          [[6, 5, 4, 3], '6544', '+++'],
          [[6, 5, 4, 3], '3456', '----'],
          [[6, 5, 4, 3], '6666', '+'],
          [[6, 5, 4, 3], '2666', '-'],
          [[6, 5, 4, 3], '2222', ''],
          [[6, 6, 6, 6], '1661', '++'],
          [[1, 2, 3, 4], '3124', '+---'],
          [[1, 2, 3, 4], '1524', '++-'],
          [[1, 2, 3, 4], '1234', '++++']
        ]
      end

      it 'returns correct results' do
        test_data.each do |test_case|
          game.instance_variable_set(:@secret_code, test_case[0])

          expect(game.check_answer(test_case[1])).to eql(test_case[2])
        end
      end
    end

    context 'ruby_garage_tests' do
      IN_POSITION = CodebreakerAp::Game::IN_POSITION
      NOT_IN_POSITION = CodebreakerAp::Game::NOT_IN_POSITION
      [
        [[6, 5, 4, 1], '6541', [IN_POSITION, IN_POSITION, IN_POSITION, IN_POSITION].join('')],
        [[1, 2, 2, 1], '2112', [NOT_IN_POSITION, NOT_IN_POSITION,
                                NOT_IN_POSITION, NOT_IN_POSITION].join('')],
        [[6, 2, 3, 5], '2365', [IN_POSITION, NOT_IN_POSITION,
                                NOT_IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '4321', [NOT_IN_POSITION, NOT_IN_POSITION,
                                NOT_IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '1235', [IN_POSITION, IN_POSITION, IN_POSITION].join('')],
        [[1, 2, 3, 4], '5431', [IN_POSITION, NOT_IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '1524', [IN_POSITION, IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '4326', [NOT_IN_POSITION, NOT_IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '3525', [NOT_IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '5612', [NOT_IN_POSITION, NOT_IN_POSITION].join('')],
        [[5, 5, 6, 6], '5600', [IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '6254', [IN_POSITION, IN_POSITION].join('')],
        [[1, 2, 3, 1], '1111', [IN_POSITION, IN_POSITION].join('')],
        [[1, 1, 1, 5], '1231', [IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '4255', [IN_POSITION, NOT_IN_POSITION].join('')],
        [[1, 2, 3, 4], '5635', [IN_POSITION].join('')],
        [[1, 2, 3, 4], '6666', [].join('')],
        [[1, 2, 3, 4], '2552', [NOT_IN_POSITION].join('')]
      ].each do |item|
        it "when result is #{item[2]} if code is - #{item[0]}, guess is #{item[1]}" do
          game.instance_variable_set(:@secret_code, item[0])
          guess = item[1]
          expect(game.check_answer(guess)).to eq item[2]
        end
      end
    end
  end

  it 'generates secret code' do
    expect(game.secret_code.join.size).to eq(CodebreakerAp::Game::CODE_LENGTH)
    expect(game.secret_code.join).to match(/[1-6]+/)
  end

  it 'take last number of hint code' do
    hint_before = game.instance_variable_get(:@hints_code).dup
    expect(game.take_hint).to eq(hint_before.pop)
  end

  it 'win the game' do
    game.instance_variable_set(:@secret_code, [1, 2, 3, 4])
    game.check_answer('1234')
    expect(game.win?).to be(true)
  end

  describe 'statistic' do
    let(:content) do
      {
      player: 'andrew',
      difficulty: 'easy',
      total_attempts: 15,
      total_hints: 2,
      used_attempts: 0,
      used_hints: 0
      }
    end
    it 'save and show stats' do
      test_file = 'spec/entities_specs/statistic_test_file.yml'.freeze
      statistic_file = CodebreakerAp::Statistic::STATISTIC_FILE
      CodebreakerAp::Statistic::STATISTIC_FILE = test_file
      game.save_stats('andrew', game.difficulty)
      expect(game.show_stats).to include(content)
      File.delete(test_file) if File.exist?(test_file)
      CodebreakerAp::Statistic::STATISTIC_FILE = statistic_file
    end
  end
end

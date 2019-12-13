module CodebreakerAp
  module Statistic
    STATISTIC_FILE = 'lib/codebreaker/storage_files/statistic.yml'.freeze
    def save_stats(player_name, difficulty)
      save_to_file(create_statistic_data(player_name, difficulty), STATISTIC_FILE)
    end

    def show_stats
      statistic = load_statistic
      statistic.each_with_index do |value, index|
        puts statistic(value, index + 1)
      end
    end

    private

    def create_statistic_data(player_name, difficulty)
      difficulty_total = Difficulty::DIFFICULTY[difficulty.level.to_sym]
      {
        player: player_name,
        difficulty: difficulty.level,
        total_attempts: difficulty_total[:attempts],
        total_hints: difficulty_total[:hints],
        used_attempts: difficulty_total[:attempts] - difficulty.attempts,
        used_hints: difficulty_total[:hints] - difficulty.hints
      }
    end

    def statistic(value, index)
      "Rating: ##{index}\n"\
      "Player name: #{value[:player]}\n"\
      "Difficulty: #{value[:difficulty]}\n"\
      "Total attempts: #{value[:total_attempts]}\n"\
      "Total hints: #{value[:total_hints]}\n"\
      "Used attempts: #{value[:used_attempts]}\n"\
      "Used hints: #{value[:used_hints]}\n\n"
    end

    def load_statistic
      data = YAML.load_stream(File.open(STATISTIC_FILE, 'a+'))
      return unless data

      data.sort_by { |players| [players[:difficulty], players[:used_attempts]] }
    end
  end
end

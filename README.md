# Codebreaker

Codebreaker is a logic game in which a code-breaker tries to break a secret code created by a code-maker. The codemaker, which will be played by the application we’re going to write, creates a secret code of four numbers between 1 and 6.
The codebreaker gets some number of chances to break the code (depends on chosen difficulty). In each turn, the codebreaker makes a guess of 4 numbers. The codemaker then marks the guess with up to 4 signs - + or - or empty spaces.
 - A + indicates an exact match: one of the numbers in the guess is the same as one of the numbers in the secret code and in the same position.
 - A - indicates a number match: one of the numbers in the guess is the same as one of the numbers in the secret code but in a different position.
 - An empty space indicates that there is not a current digit in a secret number.

## Installation

Include to Gemfile:

```ruby
gem 'codebreaker_ap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codebreaker_ap

## Usage

Create and setup difficulty:
```ruby
game = Codebreaker::Game.new
game.difficulty.initialize_difficulty('hell')
```
Print statistic:
```ruby
game.show_stats
```
Check entered answer and return pluses, minuses or empty spaces:
```ruby
game.check_answer('1234')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

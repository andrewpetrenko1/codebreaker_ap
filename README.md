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

Create object: 
```ruby
game = Codebreaker::Game.new
```
Setup difficulty:
```ruby
game.difficulty.initialize_difficulty('hell')
```
Print or get statistic:
```ruby
game.show_stats #print
game.load_statistic #get pure statistic without labels
```
Print rules:
```ruby
game.show_rules
```
Check entered answer and return '+', '-' or ' ':
```ruby
game.check_answer('1234')
```

# Console
Also available console for this game: [codebreaker_ap-console
](https://github.com/andrewpetrenko1/codebreaker_ap-console "codebreaker_ap-console") 

[![Gem Version](https://badge.fury.io/rb/cardistry.svg)](https://badge.fury.io/rb/cardistry)

# Cardistry

Cardistry provides a few basic classes that model the behavior of a real deck of cards – and a (mostly!) complete test suite. 

### Goals

- Easily extendable classes so that you can model your favorite decks and games, from poker to tarot, or even MTG or UNO.
- Realistic, simulated (not random!) riffle shuffling
- Common actions like cutting the deck, dealing individual cards to other locations, and more.

#### Intended Classes
- **Card** - Represents a single card, to be contained by other Classes
- **Deck** - An enumerable collection of cards. 
- **Spread** (*not yet added*) – A sequence of positions, each with a name (ie "The River").
- **Hand** (*not yet added*) - A sortable collection of cards.
 
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cardistry'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cardistry

## Usage

### A Basic Deck

```ruby
require 'cardistry'

deck = Cardistry::Deck.new
deck.load 'cards.json'

puts deck.size    # 52
puts deck.info    # "cards: 52, suits: [:spades, :hearts, :clubs, :diamonds]
puts deck.first   # "Ace of Spades"

puts deck[0].suit # :spades

```

### Extending

```
require 'cardistry'

class CoolerCard < Cardistry::Card
  
  def to_s
    "Cooler than #{super}"
  end
  
end

```

### Example source data file

Eventually a standard poker style deck will be included. You can find something close in `spec/test_deck.json` for now.

```json
[
  {
    "name": "Ace of Spades",
    "kind": "pip",
    "suit": "spades",
    "rank": 1
  },
  
  // ...
  
  {
    "suit": "clubs",
    "rank": 7
  },
  
  // ...
  
  {
    "name": "Queen of Hearts",
    "kind": "court",
    "suit": "hearts",
    "rank": 12
  },
  
  // ... etc
]
```
*Note that currently, all fields except rank are optional, kind will default to `:pip`*

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cardistry. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cardistry project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cardistry/blob/master/CODE_OF_CONDUCT.md).

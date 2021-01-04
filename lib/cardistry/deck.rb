require "json"
require "cardistry/card"

module Cardistry
  class Deck
    include Enumerable

    attr_reader :suits

    def initialize
      @cards = []
      @suits = []
    end

    def load from_file
      data = File.read from_file

      JSON.parse(data, { symbolize_names: true }).each do |entry|
        rank = entry[:rank]
        suit = entry[:suit] ? entry[:suit].to_sym : nil
        kind = entry[:kind] ? entry[:kind].to_sym : nil
        name = entry[:name]

        card = Card.new( rank, suit, kind, name )
        register_suit card.suit
        @cards << card
      end
    end

    def each &block
      @cards.each &block
    end

    def [] index
      @cards[index] || "Not found"
    end

    def size
      @cards.size
    end

    def info
      info = <<~INFO
        cards: #{size}
        suits: #{@suits}
      INFO
    end

    private

    def register_suit suit
      @suits << suit unless @suits.include?(suit) or !suit
    end

  end
end

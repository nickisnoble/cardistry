require "json"
require "cardistry/card"

module Cardistry
  class Deck
    include Enumerable

    def initialize *cards
      @cards = cards || []
    end

    def load from_file
      data = File.read from_file
      JSON.parse(data, { symbolize_names: true }).each do |entry|
        card = Card.new( entry[:rank], entry[:suit], entry[:kind], entry[:name])

        @cards << card
      end
    end

    def each &block
      @cards.each &block
    end

    def size
      @cards.size
    end

    def info
      info = <<~INFO
        cards: #{size}
      INFO
    end

  end
end

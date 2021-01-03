require 'cardistry/deck'

module Cardistry
  RSpec.describe Deck do
    before do
      @deck = Deck.new
    end

    it "is empty when initialized" do
      expect( @deck.cards.size ).to eq 0
    end

    # it "can load cards from a file"

    context "with cards loaded" do
      before do
        @deck = Deck.new
      end

      # it "can be cut into an arbitrary number of groups"
      # it "can be cut and joined smoothly"
      # it "can be riffle shuffled"
      # it "can be sorted into new deck order"

      # it "cards can be drawn from the deck" do
      #   initial_count = @deck.cards.size
      #   card = @deck.draw!

      #   expect( @deck.cards.size ).to be < initial_count
      # end

      # it "cards can be peeked at without changing size" do
      #   initial_count = @deck.cards.size
      #   cards = @deck.peek 3

      #   expect( cards.size ).to eq 3
      #   expect( cards[0] ).to eq @deck.cards[0]
      #   expect( @deck.cards.size ).to eq initial_count
      # end
    end
  end
end

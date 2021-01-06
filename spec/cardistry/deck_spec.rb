require 'cardistry/deck'

module Cardistry
  RSpec.describe Deck do
    before do
      @deck = Deck.new
    end

    it "is empty when initialized" do
      expect( @deck.size ).to eq 0
    end

    it "can load cards from a file" do
      path = File.join( File.dirname(__FILE__) , '../test_deck.json' )

      @deck.load path
      expect( @deck.size ).to be 52
    end

    it "is enumerable" do
      expect( @deck.is_a? Enumerable ).to be true
    end

    context "with cards loaded" do
      before do
        @deck = Deck.new
        path = File.join( File.dirname(__FILE__) , '../test_deck.json' )

        @deck.load path
      end

      it "can show info" do
        expect( @deck.info ).to include("52")
      end

      it "tracks the existing suits" do
        expect( @deck.suits.sort ).to eq [
          :spades,
          :hearts,
          :clubs,
          :diamonds
        ].sort
      end

      it "lets you access cards with []" do
        expect( @deck[0].to_s ).to eq "Ace of Spades"
      end

      it "does not track nil as a suit" do
        cards = @deck << Card.new(0, nil)

        expect( @deck.suits.size ).to eq 4
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

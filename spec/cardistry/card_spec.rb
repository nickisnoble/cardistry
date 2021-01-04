require 'cardistry/card'

module Cardistry
  RSpec.describe Card do
    before do
      @card = Card.new(12, :hearts, :court, "Queen of Hearts")
    end

    it "can be created" do
      kind = :court
      suit = :hearts
      rank = 12
      name = "Queen of Hearts"

      card = Card.new rank, suit, kind, name

      expect(card.name).to eq(name)
      expect(card.suit).to eq(suit)
      expect(card.kind).to eq(kind)
      expect(card.rank).to eq(rank)
    end

    it "has a string representation" do
      expect( @card.to_s ).to eq "Queen of Hearts"
    end

    context "minimum info given" do
      before do
        suit = :diamonds
        rank = 4

        @card = Card.new rank, suit
      end

      it "defaults name to `rank of suit`" do
        expect( @card.name ).to eq "4 of Diamonds"
      end
    end

    context "a few cards exist" do
      before do
        @cards = [
          Card.new( 12, :hearts, :court, "Queen of Hearts"),
          Card.new( 1, :major_arcana, :trump, "The Magician"),
          Card.new( 13, :diamonds, :court, "King of Diamonds"),
          Card.new( 4, :diamonds )
        ]

        @suits = suits = [
          :hearts,
          :major_arcana,
          :diamonds
        ].sort

        @kinds = [
          :court,
          :pip,
          :trump,
        ].sort
      end

      it "tracks the existing suits" do
        expect( Card.suits.sort ).to eq @suits
      end

      it "does not track nil as a suit" do
        cards = @cards + [Card.new(0, nil, :trump, "Joker")]

        expect( Card.suits.size ).to eq @suits.size
      end


      it "tracks the existing kinds" do
        expect( Card.kinds.sort ).to eq @kinds
      end

    end
  end
end

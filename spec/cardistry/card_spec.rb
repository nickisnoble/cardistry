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
  end
end

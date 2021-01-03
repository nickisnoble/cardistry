require 'cardistry/card'

module Cardistry
  RSpec.describe Card do
    before do
      @card = Card.new(:court, :hearts, 12, "Queen of Hearts")
    end

    it "can be created" do
      kind = :court
      suit = :hearts
      number = 12
      name = "Queen of Hearts"

      card = Card.new kind, suit, number, name

      expect(card.name).to eq(name)
      expect(card.suit).to eq(suit)
      expect(card.kind).to eq(kind)
      expect(card.number).to eq(number)
    end

    it "has a string representation" do
      expect( @card.to_s ).to eq "Queen of Hearts"
    end

    context "no name given" do
      before do
        kind = :pip
        suit = :diamonds
        number = 4

        @card = Card.new kind, suit, number
      end

      it "defaults name to `number of suit`" do
        expect( @card.name ).to eq "4 of Diamonds"
      end
    end

    context "a few cards exist" do
      before do
        @cards = [
          Card.new(:court, :hearts, 12, "Queen of Hearts"),
          Card.new(:trump, :major_arcana, 1, "The Magician"),
          Card.new(:wild, :major_arcana, 0, "Joker"),
          Card.new(:pip, :diamonds, 4),
        ]
      end

      it "tracks the existing suits" do
        suits = [
          :hearts,
          :major_arcana,
          :diamonds
        ].sort

        expect( Card.suits.sort ).to eq suits
      end

      it "tracks the existing kinds" do
        kinds = [
          :court,
          :pip,
          :trump,
          :wild
        ].sort

        expect( Card.kinds.sort ).to eq kinds
      end

    end
  end
end

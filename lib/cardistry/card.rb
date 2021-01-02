module Cardistry
  class Card
    attr_reader :kind, :suit, :number, :name

    @@suits = []
    @@kinds = []

    def initialize kind, suit, number, name = nil
      @name = name || "#{number} of #{suit.capitalize}"
      @suit = suit
      @kind = kind
      @number = number

      @@suits << @suit unless @@suits.include? @suit
      @@kinds << @kind unless @@kinds.include? @kind
    end

    def self.suits
      @@suits
    end

    def self.kinds
      @@kinds
    end
  end
end

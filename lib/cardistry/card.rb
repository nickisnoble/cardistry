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

      Card.register_suit @suit
      Card.register_kind @kind
    end

    def self.suits
      @@suits
    end

    def self.kinds
      @@kinds
    end


    private

    class << self
      def register_suit suit
        @@suits << suit unless @@suits.include? suit
      end

      def register_kind kind
        @@kinds << kind unless @@kinds.include? kind
      end
    end
  end
end

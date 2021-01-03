module Cardistry
  class Card
    attr_reader :kind, :suit, :rank, :name

    @@suits = []
    @@kinds = []

    def initialize kind, suit, rank, name = nil
      @kind = kind
      @suit = suit
      @rank = rank
      @name = name || default_name

      Card.register_suit @suit
      Card.register_kind @kind
    end

    def self.suits
      @@suits
    end

    def self.kinds
      @@kinds
    end

    def to_s
      @name
    end

    private

    def default_name
      rank = @rank > 1 ? @rank : 'Ace'
      "#{rank} of #{@suit.capitalize}"
    end

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

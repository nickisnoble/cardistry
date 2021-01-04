module Cardistry
  class Card
    attr_reader :kind, :suit, :rank, :name

    @@suits = []
    @@kinds = []

    def initialize rank, suit = nil, kind = :pip, name = nil
      @rank = rank
      @suit = suit
      @kind = kind
      @name = name || default_name

      Card.register_suit @suit if @suit
      Card.register_kind @kind if @kind
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
      @suit ? "#{rank} of #{@suit.capitalize}" : rank
    end

    class << self
      def register_suit suit
        @@suits << suit unless @@suits.include?(suit) or !suit
      end

      def register_kind kind
        @@kinds << kind unless @@kinds.include?(kind) or !kind
      end
    end
  end
end

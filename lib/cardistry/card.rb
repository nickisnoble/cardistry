module Cardistry
  class Card
    attr_reader :kind, :suit, :number, :name

    @@suits = []
    @@kinds = []

    def initialize kind, suit, number, name = nil
      @kind = kind
      @suit = suit
      @number = number
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
      number = @number > 1 ? @number : 'Ace'
      "#{number} of #{@suit.capitalize}"
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

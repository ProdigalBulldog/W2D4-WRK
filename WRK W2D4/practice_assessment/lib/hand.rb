require_relative 'deck'
require_relative 'card'
require 'byebug'

class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    total = 0
    
    @cards.each do |card|
      begin
        total += card.blackjack_value
      rescue RuntimeError => e
        if e.message = "ace has special value"
          if total < 17
            total += 11
          else
            total += 1
          end
        end
      end
    end
    
    total
  end

  def busted?
  end

  def hit(deck)
  end

  def beats?(other_hand)
  end

  def return_cards(deck)
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end

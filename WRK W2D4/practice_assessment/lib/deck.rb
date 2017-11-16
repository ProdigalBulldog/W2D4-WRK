require_relative 'card'
require 'byebug'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    local_cards = []
    
    Card.suits.each do |suit|
      Card.values.each do |value|
        card = Card.new(suit, value)
        local_cards << card
      end
    end
    
    local_cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > @cards.count
    return_cards = @cards.take(n)
    @cards.shift(n)
    return_cards
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards += cards
  end
end

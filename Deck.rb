require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    Card::CARD_SUITS.each do |suit|
      Card::CARD_VALUES.each do |value|
        @cards << Card.new(suit,value)
      end
    end
  end

  def card
    @cards.delete(@cards.sample)
  end

  def shuffle_cards
    @cards.shuffle
  end
end
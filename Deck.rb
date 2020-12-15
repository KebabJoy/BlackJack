class Deck
  attr_accessor :cards
  def initialize
    CARD_SIGNS.each do |sign|
      CARD_NUMS.each do |num|
        @cards << "#{sign}#{num}"
      end
    end
  end

  CARD_SIGNS = %w[♠ ♥ ♦ ♣]
  CARD_NUMS = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']

  def shuffle_cards
    @cards.shuffle
  end
end
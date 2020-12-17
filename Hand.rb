class Hand
  attr_accessor :cards, :deck, :points

  def initialize(deck)
    @deck = deck
    @points ||= 0
  end

  def draw_card
    @cards << @deck.card
    @points = points
  end

  def count_points
    @cards.each do |card|
      if card.value[0] =~ /\d/
        @points += card.value.to_i
      elsif card.value == 'A'
        @points += 11
      else
        @points += 10
      end
    end
    if @points > 21
      @cards.each do |card|
        @points -= 10 if card.value == 'A'
        break if @points <= 21
      end
    end
  end
end
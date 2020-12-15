class Player
  attr_reader :points; :name
  attr_accessor :hand_cards; :cash

  def initialize(name)
    @name = name
    @cash ||= 100
    @points ||= 0
  end

  def count_points
    @hand_cards.each do |card|
      if card[1..card.length] =~ /\d/
        @points += card[1..card.length].to_i
      elsif card[1] == 'A'
        @points += 11
      else
        @points += 10
      end
    end
    if @points > 21
      @hand_cards.each do |card|
        @points -= 10 if card[1] == 'A'
        break if @points <= 21
      end
    end
  end

  def bet
    @cash -= 10
  end
end

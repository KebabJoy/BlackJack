class Dealer
  attr_reader :hand_cards; :points
  def initialize
    @cash ||= 100
    @points ||= 0
  end

  def bet
    @cash -= 10
  end

  def autoplay
    skip if @points > 17
    take_card if @points < 17
  end

  def skip

  end

  def open_cards

  end

  def take_card

  end

end

class Dealer
  attr_reader :deck; :hand_cards
  def initialize
    @cash ||= 100
  end

  def bet
    @cash -= 10
  end

  def play

  end

  def skip

  end

  def open_cards

  end

  def take_card

  end


end

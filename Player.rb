class Player
  attr_reader :cash
  attr_accessor :hand_cards

  def initialize
    @cash ||= 100

  end

  def bet
    @cash -= 10
  end

  def skip

  end

end

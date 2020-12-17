class Player
  attr_reader :name; :hand
  attr_accessor :cash

  def initialize(deck,name)
    @name = name
    @hand = Hand.new(deck)
    @cash ||= 100

  end

  def bet
    @cash -= 10
  end
end

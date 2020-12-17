require_relative 'Player'

class Dealer < Player
  def initialize(deck)
    super(deck,:dealer)
  end

  def autoplay
    draw_card unless @hand.points < 17 ||
    count_points
  end
end

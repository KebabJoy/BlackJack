require_relative 'Player'

class Dealer < Player
  attr_reader :hand_cards; :points
  def initialize
    super(:dealer)
  end

  def autoplay
    draw_card if @points < 17
    count_points
  end
end

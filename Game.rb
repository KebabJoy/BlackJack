class Game
  attr_reader :players; :turn; :table_money; :deck
  def initialize(dealer, *players, deck)
    @players << dealer
    @players << players
    @turn ||= players.sample
    @deck = deck
    deal_cards

  end

  def deal_cards
    2.times do
      @players.each do |player|
        player.hand_cards << @deck.cards.sample
      end
    end
  end

  def turn_manager

  end

  def command_manager(command)
    send "#{command}"

  end

  def open_cards

  end

  def skip

  end

  def take_card

  end

end

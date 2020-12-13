class Game
  attr_reader :players; :turn; :table_money; :deck
  def initialize(dealer, *players, deck)
    @dealer = dealer
    @players << dealer
    @players << players
    @turn ||= players.sample
    @deck = deck
    deal_cards
  end

  def deal_cards
    [0,1].each do |i|
      @players.each do |player|
        player.hand_cards << @deck.cards.sample
        @deck.cards.delete(player.hand_cards[i])
      end
    end
  end

  def return_cards_to_deck
    [0,1].each do |i|
      @players.each do |player|
        @deck.cards << player.hand_cards[i]
      end
    end
  end

  def turn_manager
    if @turn == @dealer
      @dealer.autoplay
    end
  end

  def shuffle_deck
    @deck.cards.shuffle
  end

  def next_player
    if @turn == @players.last
      @turn = @players[0]
    else
      @turn = @players[@players.find(@turn)+1]
    end
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

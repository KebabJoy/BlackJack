class Game
  attr_reader :current_player; :deck; :game_on; :current_bet; :dealer
  def initialize(dealer, player, deck)
    @player = player
    @dealer = dealer
    @game_on = true
    @current_player ||= player
    @deck = deck.shuffle
  end

  def start
    return_cards_to_deck if @deck.cards.length < 56
    deal_cards
    bets
  end

  def deal_cards
    %w[player dealer].each do |player|
      2.times do
        "@#{player}".hand.draw_card
      end
    end
  end

  def return_cards_to_deck
    %w[player dealer].each do |player|
      player.hand.cards.each do |card|
        player.hand.cards.delete(card)
        @deck.cards << card
      end
    end
  end

  def end!
    @game_on = false
  end

  def end?
    end! if (@player.hand.cards.length >= 3 && @dealer.hand.cards.length >= 3)
  end

  def winner
    if @player.hand.points == @dealer.hand.points
      @winner = "Nobody"
      @player.cash += @current_bet / 2
      @dealer.cash += @current_bet / 2
    elsif @player.hand.points > @dealer.hand.points
      @winner = "Player"
      @player.cash += @current_bet
    else
      @winner = "Dealer"
      @dealer.cash += @current_bet
    end
    @current_bet = 0
  end

  def next_turn #imitating multiplayer game + needs to word with different interfaces. Useless concept in this program
    @current_player = next_player
    if @current_player == @dealer
      @dealer.autoplay
      @current_player = next_player
    end
  end

  def next_player #First I was making multiplayer game but then I read the task and stopped inventing a bike. But the some methods left
    @current_player = (@current_player == @player) ? @dealer : @player
  end

  def bets
    @player.bet
    @dealer.bet
    @current_bet = 20
  end
end

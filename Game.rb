class Game
  attr_reader :current_player; :table_money; :deck; :game_on; :current_bet
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
      [0..1].each do |i|
        "@#{player}".hand_cards << @deck.cards.sample
        @deck.cards.delete("@#{player}".hand_cards[i])
      end
    end
  end

  def return_cards_to_deck
    %w[player dealer].each do |player|
      player.hand_cards.each do |card|
        player.hand_cards.delete(card)
        @deck.cards << card
      end
    end
  end

  def end!
    @game_on = false
  end

  def end?
    end! if (@player.hand_cards.length >= 3 && @dealer.hand_cards.length >= 3)
  end

  def winner
    if @player.points == @dealer.points
      @winner = "Nobody"
      @player.cash += 10
      @dealer.cash += 10
    elsif @player.points > @dealer.points
      @winner = "Player"
      @player.cash += 20
    else
      @winner = "Dealer"
      @dealer.cash += 20
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
    @current_player = (@current_player == @players[0]) ? @players[1] : @players[0]
  end

  def draw_card
    @current_player.hand_cards << @deck.cards.sample
    @deck.delete(@current_player.hand_cards.last)
    @current_player.count_points
  end

  def bets
    @player.bet
    @dealer.bet
    @current_bet = 20
  end
end

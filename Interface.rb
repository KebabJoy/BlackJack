require 'Deck'
require 'Dealer'
require 'Game'
require 'Player'

class Interface
  def initialize
    puts "Enter your name:"
    name = gets.chomp
    @game = Game.new(Dealer.new,Player.new(name),Deck.new)
    start_game
  end

  def start_game
    @game_on = true
    @game.start
    while @game_on
      print_table
      options
      @game.end?
    end
    results
  end

  def options
    puts "Choose your option: \n1)Check\n2)Show cards\n3)Draw a card"
    command = gets.chomp
    case command
    when '1'
      @game.next_turn
    when '2'
      @game.end!
    when '3'
      @game.draw_card
    else
      puts "Wrong command. Try again"
      options
    end
  end

  def results
    puts "Dealer's cards:"
    @game.dealer.hand.cards.each do |card|
      print "#{card}"
    end
    puts "Your cards:"
    @game.current_player.hand.cards.each do |card|
      print "#{card} "
    end
    puts
    puts "#{@game.winner.name} wins"
    try_again
  end

  def try_again
    puts "Play again?(yes/no)"
    command = gets.chomp
    case command
    when "yes"
      start_game
    when "no"
      exit(0)
    else
      puts "Wrong command"
      try_again
    end
  end

  def print_table
    puts "Dealer's cards"
    @game.dealer.hand.cards.length.times do
      print '*'
    end
    puts "Your cards"
    @game.current_player.hand.cards.each do |card|
      print "#{card} "
    end
    puts
  end

end
require 'colorize' # gem install colorize https://www.devdungeon.com/content/colorize-ruby-terminal-output
class Player
  attr_reader :name, :balance
  def initialize(name, balance)
    @name = name
    @balance = balance
  end
end

class User < Player
  def initialize(name, balance)
    super(name, balance)
  end
end

class Dealer < Player
  def initialize
    super('Dealer', 100)
  end
end

class Card
  attr_reader :name, :suit, :value
  #SUITS = %w[♥️ ♦️ ♣️ ♠️].freeze # Неинтер-ный массив слов, разделенный пробелом. Равносильно ["♥️", "♦️", "♣️", "♠️"]
  SUITS = ['♥️'.red, '♦️'.red, '♣️'.black, '♠️'.black].freeze
  CARDS = [*(2..10), 'J', 'Q', 'K', 'A'].freeze
  def initialize(name, suit)
    @name = name
    @suit = suit
    @value = calc_value_card(name)
  end

  def calc_value_card(card)
    case card
    when 2..10
      @value = card
    when 'J', 'Q', 'K'
      @value = 10
    when 'A'
      @value = 11
    end
  end
end

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    new_deck
    shuffle_cards!
  end

  # Колода изначально пуста, поэтому обратимся к методу для заполнения карт
  def new_deck
    new_deck!
  end

  def take_card
    new_deck if deck_empty?
    cards.pop
  end

  private

  # Колода карт
  def new_deck!
    Card::CARDS.each do |card|
      Card::SUITS.each do |suit|
        @cards << Card.new(card, suit)
      end
    end
  end

  # Перетасовка карт
  def shuffle_cards!
    @cards.shuffle!
  end

  # Колода пустая?
  def deck_empty?
    cards.empty?
  end
end

=begin
ur = User.new('Ikbol', 100)
dr = Dealer.new
puts ur.name
puts dr.name
puts ur.balance
puts dr.balance


cd = Card.new('A', 'dsads')
puts cd.value

dk = Deck.new
puts dk.cards.count
puts "#{dk.cards[0].name} - #{dk.cards[0].suit}"

puts "#{dk.cards[0].name} - #{dk.cards[0].suit}"

dk.take_card
=end

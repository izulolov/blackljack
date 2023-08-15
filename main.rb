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
  SUITS = %i[♥️ ♦️ ♣️ ♠️].freeze # Неинтер-ный массив символов, разделенный пробелом. Равносильно ["♥️", "♦️", "♣️", "♠️"]
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

=begin
ur = User.new('Ikbol', 100)
dr = Dealer.new
puts ur.name
puts dr.name
puts ur.balance
puts dr.balance
=end


cd = Card.new('A', 'dsads')
puts cd.value

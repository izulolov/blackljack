require 'colorize' # gem install colorize https://www.devdungeon.com/content/colorize-ruby-terminal-output
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

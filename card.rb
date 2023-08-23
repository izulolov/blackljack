require 'colorize' # Установка gem install colorize; Сайт https://www.devdungeon.com/content/colorize-ruby-terminal-output
require_relative 'player'
class Card
  attr_reader :name, :suit, :value
  SUITS = ['♥️'.red, '♦️'.red, '♣️'.black, '♠️'.black].freeze
  CARDS = [*(2..10), 'J', 'Q', 'K', 'A'].freeze

  def initialize(name, suit)
    @name = name
    @suit = suit
    @value = calc_value_card(name)
  end

  # Стоимость карты
  def calc_value_card(card)
    case card
    when 2..10
      @value = card
    when 'J', 'Q', 'K'
      @value = 10
    when 'A'
      @value = 11 # Туз может быть 11 или 1, поэтому в методе card_weight учтем это
    end
  end
end

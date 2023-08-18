require_relative 'deck'
require_relative 'card'
class Player
  attr_reader :name, :balance, :score, :cards
  def initialize(name)
    @name = name
    @balance = 100
    @cards = []
  end

  def add_card(card)
    @cards << card
    card_weight
  end

  def show
    @cards.each { |cd| puts "#{cd.name}- #{cd.suit}" }
  end

  # Все карты в рукe, то есть после раздачи.
  # Метод для вывода карт в консоль.
  # Пока идет игра для вывода карт Дилера используем метод show_cards_close.
  # Когда настало время открыт карты можно вызвать этот метод для Дилера.
  def show_cards
    view = ''
    @cards.each { |card| view += "| s#{card.name} - #{card.suit} |" }
    view
  end

  # Вес карт который сейчас в руке грубо говоря
  def card_weight # Вес карт который сейчас в руке грубо говоря
    @score = 0 # сумма баллов карт в руке
    @cards.each { |cd| @score += cd.value }
  end
end

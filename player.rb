require_relative 'deck'
require_relative 'card'
class Player
  attr_reader :name, :score, :cards, :type
  attr_accessor :balance
  def initialize(name)
    @name = name
    @balance = 100
    @cards = []
    type_player
  end

  def add_card(card)
    @cards << card
    card_weight
  end

  # Обновить набор карт и очки, если игра продолжается, то есть предедушие карты и очки должны обнулястя
  def refresh
    @cards = []
    @score = 0
  end

  def type_player
    @name == 'Dealer' ? @type = 'Dealer' : @type = 'User'
  end

  # Все карты в рукe, то есть после раздачи.
  # Метод для вывода карт в консоль.
  # Пока идет игра для вывода карт Дилера используем метод show_cards_close.
  # Когда настало время открыт карты можно вызвать этот метод для Дилера.
  def show_cards
    view = ''
    @cards.each { |card| view += "| #{card.name} - #{card.suit} |" }
    #@cards.each { |card| view += card.show(self) }
    view
  end

  # Скорее всего этот метод придется переделать
  # Вес карт который сейчас в руке грубо говоря
  def card_weight # Вес карт который сейчас в руке грубо говоря
    @score = 0 # сумма баллов карт в руке
    @cards.each { |cd| @score += cd.value }
  end
end

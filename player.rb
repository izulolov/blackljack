require_relative 'deck'
require_relative 'card'
class Player
  attr_reader :name, :score, :cards, :type, :count_ace
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
    visual_design = ''
    top = ''
    label = ''
    line = ''
    bottom = ''
    @cards.each do |card|
      top += '|‾‾‾‾‾‾‾‾‾|'
      suit_name = "#{card.suit} #{card.name}"
      label += if card.name == 10
                 "|     #{suit_name}|"
               else
                 "|      #{suit_name}|"
               end
      line += '|         |'
      bottom += '|_________|'
    end
    visual_design += "#{top}\n#{label}\n"
    4.times do
      visual_design += "#{line}\n"
    end
    visual_design += bottom
    visual_design
  end

  # Вес карт который сейчас в руке с учетом туза
  def card_weight
    @score = 0 # сумма баллов карт в руке
    @count_ace = @cards.count { |cd| cd.name == 'A' } # Проверяем сколько тузов
    if count_ace >= 2 # Если туза больше чем 2
      @cards.each { |cd| @score += cd.value }
      @score = @score - (@count_ace - 1) * 10
    else
      @cards.each { |cd| @score += cd.value }
    end
    @score
  end
end

require_relative 'player'
require_relative 'deck'
class Dealer < Player

  def initialize
    super('Dealer')
  end

  # Закрытая карта дилера
  def show_cards_close
    visual_design = ''
    top = ''
    label = ''
    line = ''
    bottom = ''
    symb = '|XXXXXXXXX|'
    @cards.count.times do
      top += '|‾‾‾‾‾‾‾‾‾|'
        label += symb
        line += symb
      bottom += '|_________|'
    end
    visual_design += "#{top}\n#{label}\n"
    4.times do
      visual_design += "#{line}\n"
    end
    visual_design += bottom
    visual_design
  end
end

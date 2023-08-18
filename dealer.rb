require_relative 'player'
require_relative 'deck'
class Dealer < Player
  def initialize
    super('Dealer')
  end

  def show_cards_close
    view = ''
    @cards.each { view += "| * - * |" }
    view
  end
end

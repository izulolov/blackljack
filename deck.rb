require_relative 'card'
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    new_deck!
    shuffle_cards!
  end

  def take_card
    deck_empty? ? new_deck! : @cards.shift
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
    @cards.empty?
  end
end

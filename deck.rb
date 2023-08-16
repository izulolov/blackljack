require_relative 'card'
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
    deck_empty? ? new_deck : cards.pop
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
dk = Deck.new
puts dk.cards.count
puts "#{dk.cards[0].name} - #{dk.cards[0].suit}"

puts "#{dk.cards[0].name} - #{dk.cards[0].suit}"
puts dk.cards.count
dk.take_card
puts dk.cards.count
=end

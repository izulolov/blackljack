=begin
a = %i[♥️ ♦️ ♣️ ♠️]
b = %w[♥️ ♦️ ♣️ ♠️]

#puts a[1]
#puts a[0]

puts '2'..'10'

def cost(card)
  case card
  when 2..10
    card
  when 'J', 'Q', 'K'
    10
  when 'A'
    11
  end
end

puts cost(10)

CARDS = [*(2..10), 'J', 'Q', 'K', 'A'].freeze

CARDS.each {|c| puts c}
CARDS << 'G'

require 'colorize'

puts String.colors

SUITS1 = ['♥️'.red, '♦️'.red, '♣️'.black, '♠️'.black].freeze
SUITS = %w[♥️.red ♦️ ♣️ ♠️].freeze
SUITS.each {|st| puts st}

=end

a = [2,5,6,9]

puts a.include?(5)

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
=end
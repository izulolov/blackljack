require_relative 'deck'
require_relative 'dealer'
require_relative 'user'
class Game
  attr_reader  :deck, :dealer, :user
  def initialize(user_name)
    @deck = Deck.new
    @user = User.new(user_name)
    @dealer = Dealer.new
  end
end

ge = Game.new('Ikbol')

=begin
dk = Deck.new
ur = User.new('Ikbol')
dr = Dealer.new

puts "#{ge.user.name} - #{ge.user.balance}"
puts "#{ge.dealer.name} - #{ge.dealer.balance}"
ge.deck.cards.each { |cr| puts cr }
puts ge.deck.cards.count
=end

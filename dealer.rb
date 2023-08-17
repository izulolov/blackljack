require_relative 'player'
class Dealer < Player
  def initialize
    super('Dealer')
  end

  
end

=begin
dr = Dealer.new

puts dr.name
puts dr.balance
=end

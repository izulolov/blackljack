class Player
  attr_reader :name, :balance
  def initialize(name, balance)
    @name = name
    @balance = balance
  end
end

class User < Player
  def initialize(name, balance)
    super(name, balance)
  end
end

class Dealer < Player
  def initialize
    super('Dealer', 100)
  end
end

=begin
ur = User.new('Ikbol', 100)
dr = Dealer.new
puts ur.name
puts dr.name
puts ur.balance
puts dr.balance
=end

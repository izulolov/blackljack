require_relative 'player'
class User < Player
  def initialize(name)
    super(name)
  end
end

=begin
ur = User.new('Ikbol')

puts ur.name
puts ur.balance

=end

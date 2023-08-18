require_relative 'deck'
require_relative 'dealer'
require_relative 'user'

class Game
  attr_accessor :user, :dealer, :money, :deck, :players

  def initialize(user_name)
    @money = 100
    @deck = Deck.new
    @user = User.new(user_name)
    @dealer = Dealer.new
    @players = [@user, @dealer]
    start_game
  end

  def start_game
    puts 'Раздача карт...'
    sleep(0.5)
    @players.each do |player|
      2.times do
        player.add_card(@deck.cards.shift)
      end
    end
  end
end

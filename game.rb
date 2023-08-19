require_relative 'deck'
require_relative 'dealer'
require_relative 'user'

class Game
  attr_accessor :user, :dealer, :money, :deck, :players

  def initialize(user_name)
    @money = 100
    @bet = 10
    @deck = Deck.new
    @user = User.new(user_name)
    @dealer = Dealer.new
    @players = [@user, @dealer]
    start_game
  end

  def status_bar
    "Баланс: #{@money.zero? ? 0 : @money} Ставка: #{@bet} Очки: #{@user.score}"
  end

  def start_game
    puts 'Раздача карт...'
    sleep(0.5)
    @players.each do |player|
      2.times do
        player.add_card(@deck.take_card)
      end
    end
  end
end

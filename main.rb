require_relative 'game'
class Main
  def initialize
    @main_game = Game.new(user_name)
    show_info
  end

  def user_name
    puts 'Введите своё имя:'
    gets.chomp.to_s
  end

  def show_info
    @main_game.players.each do |player|
      puts "#{player.show_cards} - #{player.score}" if player.instance_of? User
      puts "#{player.show_cards_close}" if player.instance_of? Dealer
      #puts "#{player.show_cards}" if player.instance_of? Dealer
    end
  end
end

Main.new

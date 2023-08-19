require_relative 'game'
class Main
  def initialize
    @main_game = Game.new(user_name)
    show_info
  end

  def user_name
    puts 'Введите своё имя:'
    @user_name = gets.chomp.to_s
  end

  def show_info
    puts "Игрок: #{@user_name}. #{@main_game.status_bar}"
    puts @main_game.user.show_cards
    puts
    puts "Игрок: #{'Dealer'}."
    puts @main_game.dealer.show_cards_close
  end
end

Main.new

require_relative 'game'
class Main

  def initialize
    @main_game = Game.new(user_name)
    menu
  end

  def user_name
    puts 'Введите своё имя:'
    @user_name = gets.chomp.to_s
  end

  # В данный момент более менее работает возможность "ОТКРЫТЬ КАРТУ"
  # Другие возможности будут добавлятся постепенно
  def menu
    loop do
      puts 'Выберите действие: 1-Пропустить ход
      2-Добавить карту 3-Открыть карту'
      action = gets.chomp
      case action
      when '1'
        puts 'lost_step'
      when '2'
        puts 'add_card'
      when '3'
        @main_game.open_card
        puts 'Хотите продолжить игру(Y/n)?'
        console = gets.chomp
        console.downcase == 'y' ? @main_game.start_game : exit
      end
    end
  end
end

Main.new
